import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class InterfaceManager {

    private final JFrame frame;
    CLIPSHandler handler;

    public InterfaceManager(CLIPSHandler handler) {
        this.handler = handler;

        // Setup JFrame
        frame = new JFrame(handler.getProgramName());
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // zamykanie
        frame.setSize(400, 400);
        frame.setLayout(null);
        frame.setVisible(true);
        frame.setIgnoreRepaint(true);

        // Show first question
        List<CLIPSHandler.Question> questions = handler.fetchQuestions();
        if (!questions.isEmpty()) {
            CLIPSHandler.Question question = questions.get(0);
            displayQuestion(question);
        }
    }

    public static String formatLabel(String input) {
        return "<html>" + input.replace("\\n", "<br>") + "</html>";
    }

    public void displayRecommendation(List<CLIPSHandler.Recommendation> recommendations, int index) {
        if (index >= recommendations.size()) return; // Invalid index protection

        frame.getContentPane().removeAll();

        System.out.print(recommendations.get(index));

        String fontName = recommendations.get(index).name;
        JLabel label = new JLabel("<html>Your recommendation is:<br>" + fontName + "</html>");
        label.setFont(new Font("Calibri", Font.BOLD, 20));
        label.setBounds(50, 40, 350, 100);
        frame.add(label);

        // Image
        String previewPath = recommendations.get(index).preview;
        ImageIcon imageIcon = new ImageIcon(previewPath);
        JLabel image = new JLabel(imageIcon);
        int height = imageIcon.getIconHeight();
        int width = imageIcon.getIconWidth();
        frame.add(image, BorderLayout.CENTER);
        image.setBounds(120, 150, width, height);

        // Exit button
        JButton exitButton = new JButton("Exit");
        exitButton.setBounds(250, 300, 100, 20);
        exitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        frame.add(exitButton);

        // Next recommendation button
        if (index < recommendations.size() - 1) {
            JButton nextButton = new JButton("Next recommendation >");
            nextButton.setBounds(40, 300, 175, 20);
            nextButton.addActionListener(new ActionListener() {
                @Override
                public void actionPerformed(ActionEvent e) {
                    displayRecommendation(recommendations, index + 1);
                }
            });
            frame.add(nextButton);
        }

        frame.revalidate();
        frame.repaint();
    }

    public void displayFail() {
        frame.getContentPane().removeAll();

        JLabel label = new JLabel("Failed to find a recommendation!");
        label.setFont(new Font("Calibri", Font.BOLD, 20));
        label.setBounds(50, 60, 350, 100);
        frame.add(label);

        // Exit button
        JButton exitButton = new JButton("Exit");
        exitButton.setBounds(250, 300, 100, 20);
        exitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.exit(0);
            }
        });
        frame.add(exitButton);

        frame.revalidate();
        frame.repaint();
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

        // Add checkboxes or radio buttons
        if (question.multiple) {

            int xPos = 10;
            int yPos = 100;
            for (CLIPSHandler.QuestionChoice choices : question.choices) {
                String checkboxTitle = choices.getText();
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
                String radioTitle = choices.getText();
                JRadioButton radioButton = new JRadioButton(radioTitle);
                radioButton.setBounds(xPos, yPos, 500, 30);
                frame.add(radioButton);
                radioGroup.add(radioButton);
                radioButtons.add(radioButton);

                yPos += 30;
            }

        }

        // Next button
        JButton submitButton = new JButton("Next >");
        submitButton.setBounds(250, 300, 100, 20);

        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                // Get selected checkboxes / radio buttons
                List<Integer> indexes = new ArrayList<>();

                if (question.multiple) {
                    for (int i=0; i<checkBoxes.size(); i++) {
                        if (checkBoxes.get(i).isSelected()) {
                            indexes.add(i);
                        }
                    }
                } else {
                    for(int i = 0; i < radioButtons.size(); i++) {
                        if (radioButtons.get(i).isSelected()) {
                            indexes.add(i);
                        }
                    }
                }

                // Show message in case of no selection
                if (indexes.isEmpty()) {
                    JOptionPane.showMessageDialog(frame, "Please select an answer to proceed!", "Please select an option!", JOptionPane.WARNING_MESSAGE);
                } else {
                    question.answer(indexes);
                }

                // Show recommendation if available
                List<CLIPSHandler.Recommendation> recommendations = handler.fetchRecommendations();
                if (!recommendations.isEmpty()) {
                    displayRecommendation(recommendations, 0);
                    return;
                }

                // Show question if available
                List<CLIPSHandler.Question> questions = handler.fetchQuestions();
                if (!questions.isEmpty()) {
                    CLIPSHandler.Question question = questions.get(0);
                    displayQuestion(question);
                    return;
                }

                // Show error message if cannot proceed
                displayFail();
            }
        });

        frame.add(submitButton);
        frame.revalidate();
        frame.repaint();
    }
}
