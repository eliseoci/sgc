/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Criteria;

/**
 *
 * @author winvm
 */
public class RepositoryCriteria {

    public List<Criteria> getAll() throws SQLException {
        return (List<Criteria>) CustomSqlMap.getInstance().queryForList("getAllCriteria");
    }

    public void save(Criteria criteria) throws SQLException {
        CustomSqlMap.getInstance().insert("saveCriteria", criteria);
    }

    public Criteria getCriteriaById(Integer id) throws SQLException {
        return (Criteria) CustomSqlMap.getInstance().queryForObject("getCriteriaById", id);
    }
    
    public void update(Criteria criteria) throws SQLException{
        CustomSqlMap.getInstance().update("updateCriteria", criteria);
    }
    
    public void delete(Integer id) throws SQLException{
        CustomSqlMap.getInstance().delete("deleteCriteria", id);
    }
}
