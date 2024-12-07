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
        frame.setSize(500, 500);
        frame.setLayout(null);
        frame.setVisible(true);
        frame.setIgnoreRepaint(true);


        List<CLIPSHandler.Question> questions = handler.fetchQuestions();
        System.out.println(questions);

        CLIPSHandler.Question question = questions.get(0);

        displayQuestion(question);

    }

    public void displayQuestion(CLIPSHandler.Question question) {
        frame.getContentPane().removeAll();

        JLabel label = new JLabel(question.text);
        label.setFont(new Font("Calibri", Font.BOLD, 20));
        label.setBounds(10, 10, 200, 100);
        frame.add(label);

        ButtonGroup radioGroup = new ButtonGroup();

        List<JRadioButton> radioButtons = new ArrayList<>();
        List<JCheckBox> checkBoxes = new ArrayList<>();

        if (question.multiple) {
            int xPos = 10;
            int yPos = 200;
            for (CLIPSHandler.QuestionChoice choice : question.choices) {
                JCheckBox checkBox = new JCheckBox(choice.toString());
                checkBox.setBounds(xPos, yPos, 500, 50);
                frame.add(checkBox);
                checkBoxes.add(checkBox);

                yPos += 50;
            }
        } else {
            int xPos = 10;
            int yPos = 200;
            for (CLIPSHandler.QuestionChoice choices : question.choices) {
                JRadioButton radioButton = new JRadioButton(choices.toString());
                radioButton.setBounds(xPos, yPos, 500, 50);
                frame.add(radioButton);
                radioGroup.add(radioButton);
                radioButtons.add(radioButton);

                yPos += 50;
            }
        }

        JButton submitButton = new JButton("Submit");
        submitButton.setBounds(300, 100, 100, 20);
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                List<Integer> indexes = new ArrayList<>();
                indexes.add(0);
                question.answer(indexes);
            }
        });

        frame.add(submitButton);

        frame.revalidate();
        frame.repaint();
    }
}
