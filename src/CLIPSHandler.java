import net.sf.clipsrules.jni.*;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class CLIPSHandler {

    private Environment clips;
    private String rulesPath;
    private ProgramInfo programInfo;

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
        public long factId;
        public String text;
        public List<QuestionChoice> choices;
        public boolean multiple;

        public Question(long factId, String text, List<QuestionChoice> choices, boolean multiple) {
            this.factId = factId;
            this.text = text;
            this.choices = choices;
            this.multiple = multiple;
        }

        // List of choice indexes
        public void answer(List<Integer> choiceIndexes) {
            for (int index: choiceIndexes) {
                assertFact(this.choices.get(index).fact, true);
            }
            retractFact(factId, true);
        }

        @Override
        public String toString() {
            String choicesString = "";
            for (QuestionChoice choice : choices) {
                choicesString += choice.text + ", ";
            }

            return "<(" + factId + ") Question: \"" + text + "\" - " + choicesString + " (multiple: " + multiple + ")>";
        }
    }

    public class Recommendation {
        String name;
        String preview;

        public Recommendation(String name, String preview) {
            this.name = name;
            this.preview = preview;
        }
        @Override
        public String toString() {
            return "Recommendation: " +
                    "fontName='" + name + '\'' +
                    ", previewPath='" + preview + '\'';

        }
    }

    public class ProgramInfo {
        public String name;

        public ProgramInfo(String name) {
            this.name = name;
        }
    }

    public String getProgramName() {
        if (programInfo != null) {
            return programInfo.name;
        } else {
            return "";
        }
    }

    public CLIPSHandler() {
        try {
            // Initialize the CLIPS environment
            clips = new Environment();
            System.out.println("CLIPS Environment initialized.");

            // Load rule and fact files
            rulesPath = "rules/";
            File rulesFolder = new File(rulesPath);

            System.out.println("Loading rule files:");
            for (File file : Objects.requireNonNull(rulesFolder.listFiles())) {
                String filePath = file.getAbsolutePath();
                System.out.println("- " + filePath);
                if (filePath.endsWith(".clp")) {
                    clips.load(filePath);
                }
            }

            // Initialize facts and rules by resetting
            clips.eval("(reset)");
            System.out.println("CLIPS environment ready!");

            // Extra debug information
            clips.eval("(watch rules)");
            clips.eval("(watch facts)");

            // Load program info
            programInfo = fetchProgramInfo();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ProgramInfo fetchProgramInfo() {

        try {

            String query = "(find-all-facts ((?f program-info)) TRUE)";
            PrimitiveValue result = clips.eval(query);
            FactAddressValue fact = (FactAddressValue) ((MultifieldValue) result).get(0);

            String name = fact.getSlotValue("name").getValue().toString();

            return new ProgramInfo(name);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Recommendation> fetchRecommendations() {

        List<Recommendation> recommendations = new ArrayList<>();

        try {

            String query = "(find-all-facts ((?f recommendation)) TRUE)";
            PrimitiveValue result = clips.eval(query);

            if (result instanceof MultifieldValue facts) {
                for (int i = 0; i < facts.size(); i++) {

                    FactAddressValue fact = (FactAddressValue) facts.get(i);
                    String name = fact.getSlotValue("name").getValue().toString();
                    String preview = fact.getSlotValue("preview").getValue().toString();
                    recommendations.add(new Recommendation(name, preview));

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return recommendations;
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
                    long factId = fact.getFactIndex();

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

                    Question question = new Question(factId, questionText, choices, multiple);
                    questions.add(question);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return questions;
    }

    public void assertFact(String fact, boolean run) {

        try {

            String query = "(assert " + fact + ")";
            PrimitiveValue result = clips.eval(query);

            System.out.println("Asserted! - " + result.toString());

            if (run) {
                clips.run();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void retractFact(long factId, boolean run) {

        try {

            String query = "(retract " + factId + ")";
            PrimitiveValue result = clips.eval(query);

            System.out.println("Retracted! - " + result.toString());

            if (run) {
                clips.run();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}