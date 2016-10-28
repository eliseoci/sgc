/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package repository;

import java.sql.SQLException;
import model.AreaPeriod;


/**
 *
 * @author Gaby
 */
public class RepositoryAreaPeriod {
    public void save(AreaPeriod areaPeriod) throws SQLException {
        CustomSqlMap.getInstance().insert("saveArea_Period", areaPeriod);
    }

    public int getId(AreaPeriod areaPeriod) throws SQLException {
        return ((AreaPeriod) CustomSqlMap.getInstance().queryForObject("selectIdArea_Period", areaPeriod)).getIdArea_Period();
    }
    
}
