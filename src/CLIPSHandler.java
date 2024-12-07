import net.sf.clipsrules.jni.*;

import java.util.ArrayList;
import java.util.List;

public class CLIPSHandler {

    private Environment clips;

    public class Question {
        public String text;
        public List<String> choices;
        public boolean multiple;



        public Question(String text, List<String> choices, boolean multiple) {
            this.text = text;
            this.choices = choices;
            this.multiple = multiple;
        }

        @Override
        public String toString() {
            return "<Question: \"" + text + "\" - " + String.join(" ", choices) + " (multiple: " + multiple + ")>";
        }
    }

    public CLIPSHandler() {
        try {
            // Initialize the CLIPS environment
            clips = new Environment();
            System.out.println("CLIPS Environment initialized.");

            // Load the CLIPS file
            clips.load("facts.clp");
            clips.load("rules.clp");
            clips.eval("(reset)");

            // Activate tracing to debug
            clips.eval("(watch rules)");
            clips.eval("(watch facts)");

            // Run the CLIPS engine
            clips.run();
            System.out.println("CLIPS rules executed.");

        } catch (UnsatisfiedLinkError ule) {
            System.err.println("Failed to load the CLIPSJNI library: " + ule.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Question> fetchQuestions() {
        List<Question> questions = new ArrayList<>();

        try {

            String query = "(find-all-facts ((?f question)) TRUE)";
            PrimitiveValue result = clips.eval(query);

            if (result instanceof MultifieldValue) {
                MultifieldValue facts = (MultifieldValue) result;

                for (int i = 0; i < facts.size(); i++) {
                    FactAddressValue fact = (FactAddressValue) facts.get(i);

                    String questionText = fact.getSlotValue("text").getValue().toString();

                    MultifieldValue questionChoices = (MultifieldValue) fact.getSlotValue("choices");
                    List<String> choices = new ArrayList<>();
                    for (int j = 0; j < questionChoices.size(); j++) {
                        String questionChoice = questionChoices.get(j).getValue().toString();
                        choices.add(questionChoice);
                    }

                    boolean multiple = Integer.parseInt(fact.getSlotValue("multiple").getValue().toString()) == 1;

                    Question question = new Question(questionText, choices, multiple);
                    questions.add(question);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return questions;
    }
}