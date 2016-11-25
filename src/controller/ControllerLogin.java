/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.User;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import repository.RepositoryUser;
import view.LoginForm;
import view.WindowMain;

/**
 *
 * @author Cohen
 */
public class ControllerLogin {
    
    private static final Logger logger = LogManager.getLogger(ControllerLogin.class);
    RepositoryUser repositoryUser;

    public ControllerLogin() {
        repositoryUser = new RepositoryUser();
    }
    
    public void checkAdmin() throws SQLException {
        User user = repositoryUser.getUser("admin");
        if(user == null){
            repositoryUser.createUser(new User("admin","admin"));
            logger.trace("Admin creado.");
        }
    }
    
    public void authenticate(LoginForm view) throws SQLException{
        String username = view.getUser().getText();
        String pass = view.getPassword().getText();
        User user = repositoryUser.getUser(username);
        if(user == null){
            JOptionPane.showMessageDialog(view, "Credenciales inválidas", "Acceso no autorizado", JOptionPane.ERROR_MESSAGE);
        } else if(user.getPass().equals(pass)){
            logger.trace("User #" + user.getId() + " Entering application.");
            view.dispose();
            WindowMain windowMain = new WindowMain();
            windowMain.setVisible(true);
        } else {
            JOptionPane.showMessageDialog(view, "Credenciales inválidas", "Acceso no autorizado", JOptionPane.ERROR_MESSAGE);
        }
        
    }
}
