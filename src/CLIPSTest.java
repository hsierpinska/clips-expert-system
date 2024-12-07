import net.sf.clipsrules.jni.Environment;

public class CLIPSTest {
    public static void main(String[] args) {
        try {
            // Initialize the CLIPS environment
            Environment clips = new Environment();
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

}