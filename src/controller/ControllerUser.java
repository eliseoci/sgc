/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.User;
import org.apache.logging.log4j.LogManager;
import repository.RepositoryUser;
import view.NewPasswordForm;

/**
 *
 * @author Cohen
 */
public class ControllerUser {
    
    private static final org.apache.logging.log4j.Logger logger = LogManager.getLogger(ControllerUser.class);
    RepositoryUser repositoryUser;

    public ControllerUser() {
        repositoryUser = new RepositoryUser();
    }
    
    public void changePassword(NewPasswordForm form){
        try {
            if(!form.getNewPass().getText().isEmpty() && !form.getNewPass().getText().isEmpty() && !form.getRptNewPass().getText().isEmpty()){
                User user = repositoryUser.getUser("admin");
                if(user.getPass().equals(form.getOldPass().getText())){
                    if(form.getOldPass().getText().equals(form.getNewPass().getText())){
                       if(form.getNewPass().getText().equals(form.getRptNewPass().getText())){
                            user.setPass(form.getNewPass().getText());
                            repositoryUser.updateUser(user);
                            JOptionPane.showMessageDialog(null, "Contraseña actualizada con éxito", "Nueva contraseña", JOptionPane.INFORMATION_MESSAGE);
                            logger.trace("Se ha modificado la contraseña del Administrador");
                            form.dispose();
                        } else {
                            showErrorMessage("No coincide la nueva contraseña con la nueva contraseña repetida");
                        } 
                    } else {
                        showErrorMessage("La antigua contraseña y la nueva contraseña son iguales");
                    }  
                } else {
                    showErrorMessage("La contraseña actual no coincide con la contraseña ingresada");
                } 
            } else {
                showErrorMessage("Debe completar todos los campos");
            }   
        } catch (SQLException ex) {
            showErrorMessage("Error al interactuar con la Base de Datos");
            logger.error(ex);
        }
    }
    
    public void showErrorMessage(String message){
        JOptionPane.showMessageDialog(null, message, "Error", JOptionPane.ERROR_MESSAGE);
    }
    
}
