/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Process;

/**
 *
 * @author winvm
 */
public class RepositoryProcess {

    public List<Process> getAllBySubcriteria(int id) throws SQLException {
        return (List<Process>) CustomSqlMap.getInstance().queryForList("getAllGroupsBySubcriteria", Integer.valueOf(id));
    }

    public List<Process> getAll() throws SQLException {
        return (List<Process>) CustomSqlMap.getInstance().queryForList("getAllProcess");
    }
    
    public List<Process> getAllProcess() throws SQLException {
        return (List<Process>) CustomSqlMap.getInstance().queryForList("getAllProcess");
    }

    public void save(Process process) throws SQLException {
        CustomSqlMap.getInstance().insert("saveProcess", process);
    }

    public Process getById(Integer id) throws SQLException {
        return (Process) CustomSqlMap.getInstance().queryForObject("getProcessById", id);
    }

    public void update(Process groups) throws SQLException {
        CustomSqlMap.getInstance().update("updateProcess", groups);
    }
    
    public void delete(Integer id) throws SQLException{
        CustomSqlMap.getInstance().delete("deleteProcess", id);
    }
}
