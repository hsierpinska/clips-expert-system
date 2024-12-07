import net.sf.clipsrules.jni.*;

import java.util.ArrayList;
import java.util.List;

public class CLIPSHandler {

    private Environment clips;

    public class QuestionChoice {
        public String text;
        public String fact;
        public QuestionChoice(String text, String fact) {
            this.text = text;
            this.fact = fact;
        }

        public String getText() {
            return text;
        }

        public String getFact() {
            return fact;
        }

        @Override
        public String toString() {
            return "(" + text + ", " + fact + ")";
        }
    }

    public class Question {
        public String text;
        public List<QuestionChoice> choices;
        public boolean multiple;

        public Question(String text, List<QuestionChoice> choices, boolean multiple) {
            this.text = text;
            this.choices = choices;
            this.multiple = multiple;
        }

        // List of choice indexes
        public void answer(List<Integer> choiceIndexes) {
            for (int index: choiceIndexes) {
                assertFact(this.choices.get(index).fact);
            }
            System.out.println(countFacts()); // Moved

        }

        @Override
        public String toString() {
            String choicesString = "";
            for (QuestionChoice choice : choices) {
                choicesString += choice.text + ", ";
            }

            return "<Question: \"" + text + "\" - " + choicesString + " (multiple: " + multiple + ")>";
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


                    // Get choices --------------

                    List<String> questionChoicesText = new ArrayList<>();
                    MultifieldValue questionChoices = (MultifieldValue) fact.getSlotValue("choices");
                    for (int j = 0; j < questionChoices.size(); j++) {
                        String questionChoice = questionChoices.get(j).getValue().toString();
                        questionChoicesText.add(questionChoice);
                    }

                    List<String> questionChoicesFacts = new ArrayList<>();
                    MultifieldValue questionFacts = (MultifieldValue) fact.getSlotValue("facts");
                    for (int j = 0; j < questionFacts.size(); j++) {
                        String questionFact = questionFacts.get(j).getValue().toString();
                        questionChoicesFacts.add(questionFact);
                    }

                    List<QuestionChoice> choices = new ArrayList<>();
                    for (int j = 0; j < questionChoicesText.size(); j++) {
                        choices.add(new QuestionChoice(questionChoicesText.get(j), questionChoicesFacts.get(j)));
                    }

                    // ---------------

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

    public void assertFact(String fact) {
        List<Question> questions = new ArrayList<>();

        try {

            String query = "(assert " + fact + ")";
            PrimitiveValue result = clips.eval(query);

            System.out.println("Asserted!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int countFacts() {
        try {
            PrimitiveValue result = clips.eval("(facts)");
            if (result instanceof MultifieldValue facts) {
                return facts.size();
            } else if (result instanceof VoidValue) {
                return 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}