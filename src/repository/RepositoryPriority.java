/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Priority;

/**
 *
 * @author winvm
 */
public class RepositoryPriority {

    public List<Priority> getAll() throws SQLException {
        return (List<Priority>) CustomSqlMap.getInstance().queryForList("getAllPriority");
    }
}
