/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import model.PCSPQuestion;

/**
 *
 * @author winvm
 */
public class RepositoryPCSPQuestion {

    public void save(PCSPQuestion pCSPQuestion) throws SQLException {
        CustomSqlMap.getInstance().insert("savePCSPQuestion", pCSPQuestion);
    }
}
