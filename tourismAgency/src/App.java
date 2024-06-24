
import business.UserManager;
import core.Helper;
import view.LoginView;

public class App {
    public static void main(String[] args) {

        // Tema ayarlarını uygular
        Helper.setTheme();

        // UserManager nesnesini oluşturur
        UserManager userManager = new UserManager();

        // LoginView nesnesini oluşturur ve görünür hale getirir
        LoginView loginView = new LoginView();
        loginView.setVisible(true);
    }
}