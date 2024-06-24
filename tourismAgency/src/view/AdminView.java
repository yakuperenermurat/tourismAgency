package view;

import business.UserManager;
import core.Helper;
import entity.Users;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;

public class AdminView extends Layout {
    private Users user;
    private JTabbedPane tabbedPane;
    private JPanel container;
    private JTable tbl_users;
    private JComboBox<Users.Role> cmb_user_role;
    private JButton btn_search;
    private JButton btn_clear;
    private JButton btn_exit;
    private JLabel lbl_user_role;
    private JPanel pnl_top;
    private JScrollPane scrl_users;
    private DefaultTableModel tmdl_user = new DefaultTableModel();
    private Object[] col_user;
    private JPopupMenu user_menu;
    private UserManager userManager;

    public AdminView(Users user) {
        this.userManager = new UserManager();
        this.user = user;
        this.add(container);
        initilizeGui(1000, 500); // GUI başlatma
        this.setTitle("Admin Paneli");

        // Genel bileşenleri yükleme
        loadComponent();

        // Kullanıcı bileşenleri yükleme
        loadUserTable(null);
        loadUserComponent();
        loadUserFilter();
    }

    // Kullanıcı bileşenlerini yükler
    private void loadUserComponent() {
        // Kullanıcı menüsünü oluşturur ve seçenekler ekler
        this.user_menu = new JPopupMenu();
        this.user_menu.add("Yeni Kullanıcı Ekle").addActionListener(e -> {
            UserView userView = new UserView(new Users());
            userView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadUserTable(null); // Pencere kapandığında tabloyu yeniler
                }
            });
        });
        this.user_menu.add("Güncelle").addActionListener(e -> {
            int selectModelId = this.getTableSelectedRow(tbl_users, 0);
            UserView userView = new UserView(this.userManager.getById(selectModelId));
            userView.addWindowListener(new WindowAdapter() {
                @Override
                public void windowClosed(WindowEvent e) {
                    loadUserTable(null); // Pencere kapandığında tabloyu yeniler
                }
            });
        });
        this.user_menu.add("Sil").addActionListener(e -> {
            if (Helper.confirm("sure")) {
                int selectedModelId = AdminView.this.getTableSelectedRow(tbl_users, 0);
                if (AdminView.this.userManager.delete(selectedModelId)) {
                    Helper.showMsg("done");
                    AdminView.this.loadUserTable(null);
                } else {
                    Helper.showMsg("error");
                }
            }
        });

        this.tbl_users.setComponentPopupMenu(user_menu);
        tableRowSelected(this.tbl_users, user_menu);

        // Arama butonu tıklama olayı
        this.btn_search.addActionListener(e -> {
            Users.Role selectedRole = (Users.Role) cmb_user_role.getSelectedItem();
            ArrayList<Users> userListBySearch = this.userManager.searchForTable(selectedRole != null ? selectedRole.name() : null);
            ArrayList<Object[]> userRowListBySearch = this.userManager.getForTable(this.col_user.length, userListBySearch);
            loadUserTable(userRowListBySearch);
        });

        // Temizle butonu tıklama olayı
        this.btn_clear.addActionListener(e -> {
            this.cmb_user_role.setSelectedItem(null);
            loadUserTable(null);
        });
    }

    // Kullanıcı tablosunu yükler
    public void loadUserTable(ArrayList<Object[]> userList) {
        this.col_user = new Object[]{"User ID", "User Name", "User Password", "User Role"};
        if (userList == null) {
            userList = this.userManager.getForTable(this.col_user.length, this.userManager.findAll());
        }
        this.createTable(this.tmdl_user, this.tbl_users, col_user, userList);
    }

    // Kullanıcı filtrelerini yükler
    public void loadUserFilter() {
        this.cmb_user_role.removeAllItems();
        for (Users.Role role : Users.Role.values()) {
            this.cmb_user_role.addItem(role);
        }
        this.cmb_user_role.setSelectedItem(null);
    }

    // Genel bileşenleri yükler
    private void loadComponent() {
        this.btn_exit.addActionListener(e -> {
            if (Helper.confirm("sure")) {
                dispose();
                LoginView loginView = new LoginView(); // Çıkış butonu tıklama olayı
            }
        });
    }
}