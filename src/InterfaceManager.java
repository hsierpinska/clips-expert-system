import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class InterfaceManager {


    private JFrame frame;
    CLIPSHandler handler;

    public InterfaceManager(CLIPSHandler handler) {
        this.handler = handler;

        frame = new JFrame("Typeface system");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // zamykanie
        frame.setSize(400, 400);
        frame.setLayout(null);
        frame.setVisible(true);
        frame.setIgnoreRepaint(true);


        List<CLIPSHandler.Question> questions = handler.fetchQuestions();
        System.out.println(questions);

        if (!questions.isEmpty()) {
            CLIPSHandler.Question question = questions.get(0);
            displayQuestion(question);
        }
    }


    public static String formatString(String input) {
        String[] parts = input.replaceAll("[()]", "").split(",");
        String result = parts[0].trim().toLowerCase();
        return result.substring(0, 1).toUpperCase() + result.substring(1);
    }

    public static String formatLabel(String input) {
        return "<html>" + input.replace("\\n", "<br>") + "</html>";

    }
    public void displayQuestion(CLIPSHandler.Question question) {
        frame.getContentPane().removeAll();
        String labelText = formatLabel(question.text);
        JLabel label = new JLabel(labelText);
        label.setFont(new Font("Calibri", Font.BOLD, 20));
        label.setBounds(10, 10, 350, 100);
        frame.add(label);

        ButtonGroup radioGroup = new ButtonGroup();

        List<JRadioButton> radioButtons = new ArrayList<>();
        List<JCheckBox> checkBoxes = new ArrayList<>();

        if (question.multiple) {
            int xPos = 10;
            int yPos = 100;
            for (CLIPSHandler.QuestionChoice choices : question.choices) {
                String checkboxTitle = formatString(choices.toString());
                JCheckBox checkBox = new JCheckBox(checkboxTitle);
                checkBox.setBounds(xPos, yPos, 500, 30);
                frame.add(checkBox);
                checkBoxes.add(checkBox);
                yPos += 30;
            }
        } else {
            int xPos = 10;
            int yPos = 100;
            for (CLIPSHandler.QuestionChoice choices : question.choices) {
                String radioTitle = formatString(choices.toString());
                JRadioButton radioButton = new JRadioButton(radioTitle);
                radioButton.setBounds(xPos, yPos, 500, 30);
                frame.add(radioButton);
                radioGroup.add(radioButton);
                radioButtons.add(radioButton);

                yPos += 30;
            }
        }

        JButton submitButton = new JButton("Submit");
        submitButton.setBounds(250, 300, 100, 20);

        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                List<Integer> indexes = new ArrayList<>();
                if (question.multiple) {
                    for (int i=0; i<checkBoxes.size(); i++) {
                        if (checkBoxes.get(i).isSelected()) {
                            indexes.add(i);
                        }
                    }
                }
                for(int i = 0; i < radioButtons.size(); i++) {
                    if (radioButtons.get(i).isSelected()) {
                        indexes.add(i);
                    }
                }
                if (indexes.isEmpty()) {
                    JOptionPane.showMessageDialog(frame, "Please select an answer");
                } else {
                    question.answer(indexes);
                }
                List<CLIPSHandler.Question> questions = handler.fetchQuestions();
                if (!questions.isEmpty()) {
                    CLIPSHandler.Question question = questions.get(0);
                    displayQuestion(question);
                } else {
                    JOptionPane.showMessageDialog(frame, "The end");
                    System.exit(0);
//                    todo: rekomendacje albo kolejne pytania jeśli nie znajdzie dopasowania
                }
            }
        });

        frame.add(submitButton);
        frame.revalidate();
        frame.repaint();
    }
}
