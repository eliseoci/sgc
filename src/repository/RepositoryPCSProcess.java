/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import model.PCSProcess;

/**
 *
 * @author winvm
 */
public class RepositoryPCSProcess {
    public void save(PCSProcess periodCriteria) throws SQLException {
        CustomSqlMap.getInstance().insert("savePCSProcess", periodCriteria);
    }

    public int getId(PCSProcess periodCriteria) throws SQLException {
        return ((PCSProcess) CustomSqlMap.getInstance().queryForObject("selectIdPCSProcess", periodCriteria)).getIdpcsp();
    }
}
