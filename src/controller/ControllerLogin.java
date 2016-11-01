/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.User;
import repository.RepositoryUser;
import view.LoginForm;
import view.WindowMain;

/**
 *
 * @author Cohen
 */
public class ControllerLogin {
    
    RepositoryUser repositoryUser;

    public ControllerLogin() {
        repositoryUser = new RepositoryUser();
    }

    public void authenticate(LoginForm view) throws SQLException{
        String username = view.getUser().getText();
        String pass = view.getPassword().getText();
        User user = repositoryUser.getUser(username);
        if(user == null){
            JOptionPane.showMessageDialog(view, "Credenciales inválidas", "Acceso no autorizado", JOptionPane.ERROR_MESSAGE);
        } else if(user.getPass().equals(pass)){
            view.dispose();
            WindowMain windowMain = new WindowMain();
            windowMain.setVisible(true);
        } else {
            JOptionPane.showMessageDialog(view, "Credenciales inválidas", "Acceso no autorizado", JOptionPane.ERROR_MESSAGE);
        }
        
    }
}
