/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package gestioncalidad;

import db.ConnectionFactory;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import de.javasoft.plaf.synthetica.SyntheticaBlackEyeLookAndFeel;
import java.awt.Dimension;
import java.awt.Toolkit;
import static java.lang.System.exit;
import java.sql.SQLException;
import java.text.ParseException;
import javax.swing.JOptionPane;
import view.LoginForm;

/**
 *
 * @author winvm
 */
public class main {
    
    /**
     * @param args the command line arguments
     * @throws java.text.ParseException
     */
    public static void main(String[] args) throws ParseException {
        try {
            try {
                ConnectionFactory.getDatabaseConnection();
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "No se pudo conectar con la BD.", "Error", JOptionPane.ERROR_MESSAGE);
                System.out.println("SQLException: " + ex);
                exit(1);
            }
            UIManager.setLookAndFeel(new SyntheticaBlackEyeLookAndFeel());
            LoginForm windowMain = new LoginForm();
            Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
            windowMain.setTitle(".:: Sistema EFQM - UTN-FRT ::.");
            windowMain.setLocation(dim.width/2-windowMain.getSize().width/2, dim.height/2-windowMain.getSize().height/2);
            windowMain.setVisible(true);
        } catch (UnsupportedLookAndFeelException ex) {
            System.out.println(ex);
        }
    }
    
}
