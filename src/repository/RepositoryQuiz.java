/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package repository;

import java.sql.SQLException;
import java.util.List;
import model.Quiz;

/**
 *
 * @author winvm
 */
public class RepositoryQuiz {
    public List<Quiz> getAllQuiz(Integer period) throws SQLException{
        return (List<Quiz>) CustomSqlMap.getInstance().queryForList("getAllQuiz", period);
    }
}
