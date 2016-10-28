/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Status;

/**
 *
 * @author winvm
 */
public class RepositoryStatus {

    public List<Status> getAll() throws SQLException {
        return (List<Status>) CustomSqlMap.getInstance().queryForList("getAllStatus");
    }
}
