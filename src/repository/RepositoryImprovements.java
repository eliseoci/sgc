/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Improvements;

/**
 *
 * @author Gaby
 */
public class RepositoryImprovements {

    public List<Improvements> getAll(int period) throws SQLException {
        return (List<Improvements>) CustomSqlMap.getInstance().queryForList("getAllImprovements", period);
    }

    public void save(Improvements improvements) throws SQLException {
        CustomSqlMap.getInstance().insert("saveImprovement", improvements);
    }

    public void delete(Integer id) throws SQLException {
        CustomSqlMap.getInstance().delete("deleteImprovement", id);
    }

    public Improvements getByPk(int id) throws SQLException {
        return (Improvements) CustomSqlMap.getInstance().queryForObject("getByPkImprovement", id);
    }

    public void update(Improvements improvements) throws SQLException {
        CustomSqlMap.getInstance().insert("updateImprovement", improvements);
    }
}
