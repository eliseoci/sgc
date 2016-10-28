/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Question;

/**
 *
 * @author winvm
 */
public class RepositoryQuestion {

    public void save(Question question) throws SQLException {
        CustomSqlMap.getInstance().insert("saveQuestion", question);
    }

    public void delete(int id) throws SQLException {
        CustomSqlMap.getInstance().delete("deleteQuestion", Integer.valueOf(id));
    }

    public void update(Question question) throws SQLException {
        CustomSqlMap.getInstance().update("updateQuestion", question);
    }

    public List<Question> getAll() throws SQLException {
        return (List<Question>) CustomSqlMap.getInstance().queryForList("getAllQuestions");
    }

    public Question getById(int id) throws SQLException {
        return (Question) CustomSqlMap.getInstance().queryForObject("getById", Integer.valueOf(id));
    }
    
    public int getId(Question question) throws SQLException {
        return ((Question) CustomSqlMap.getInstance().queryForObject("selectIdQuestion", question)).getId();
    }
}
