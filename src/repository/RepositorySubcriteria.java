/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package repository;

import java.sql.SQLException;
import java.util.List;
import model.Subcriteria;

/**
 *
 * @author winvm
 */
public class RepositorySubcriteria {
    public List<Subcriteria> getByCriteria(int id) throws SQLException {
        return (List<Subcriteria>) CustomSqlMap.getInstance().queryForList("getAllSubcriteriaByCriteria", Integer.valueOf(id));
    }
    
    public List<Subcriteria> getAll() throws SQLException{
        return (List<Subcriteria>) CustomSqlMap.getInstance().queryForList("getAllSubcriteria");
    }
    
    public Subcriteria getById(Integer id) throws SQLException{
        return (Subcriteria) CustomSqlMap.getInstance().queryForObject("getSubcriteriaByCriteria", id);
    }
    
    public void save(Subcriteria subcriteria) throws SQLException{
        CustomSqlMap.getInstance().insert("saveSubCriteria", subcriteria);
    }
    
    public void update(Subcriteria subcriteria) throws SQLException{
        CustomSqlMap.getInstance().update("updateSubCriteria", subcriteria);
    }
    
    public void delete(Integer id) throws SQLException{
        CustomSqlMap.getInstance().delete("deleteSubCriteria", id);
    }
    
    public List<Subcriteria> getAllSubcriteria() throws SQLException{
        return (List<Subcriteria>) CustomSqlMap.getInstance().queryForList("getAllSubcriteria");
    }
}
