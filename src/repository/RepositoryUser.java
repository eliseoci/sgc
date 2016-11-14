/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import model.User;

/**
 *
 * @author Cohen
 */
public class RepositoryUser {
    public User getUser(String username) throws SQLException{
        return (User) CustomSqlMap.getInstance().queryForObject("getUser", username);
    }

    public void createUser(User user) throws SQLException {
        CustomSqlMap.getInstance().insert("saveUser", user);
    }
}
