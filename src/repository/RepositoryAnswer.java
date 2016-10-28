/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package repository;

import java.sql.SQLException;
import java.util.List;
import model.Answer;

/**
 *
 * @author winvm
 */
public class RepositoryAnswer {
    public List<Answer> getAllAnswer(Integer id) throws SQLException{
        return (List<Answer>) CustomSqlMap.getInstance().queryForList("getAllAnswer", id);
    }
}
