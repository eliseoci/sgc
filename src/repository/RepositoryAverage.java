/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.AverageByResponses;
import model.ResultCriteria;

/**
 *
 * @author winvm
 */
public class RepositoryAverage {

    public void averageByResponses(AverageByResponses abr) throws SQLException {
        CustomSqlMap.getInstance().insert("averageByResponses", abr);
    }
    
    public Object getCriteriaResultsFromPeriod(int period) throws SQLException {
        return (List<ResultCriteria>) CustomSqlMap.getInstance().queryForList("getCriteriaResultsFromPeriod", period);
    }

    public void processData(Integer period) throws SQLException {
        try {
            CustomSqlMap.getInstance().startTransaction();
            CustomSqlMap.getInstance().startBatch();

            CustomSqlMap.getInstance().insert("averageByProcess", period);
            CustomSqlMap.getInstance().insert("averageBySubcriteriaFacilitatingAgents", period);
            CustomSqlMap.getInstance().insert("averageBySubcriteriaResults", period);
            CustomSqlMap.getInstance().insert("averageByCriterioFacilitatingAgents", period);
            CustomSqlMap.getInstance().insert("averageByCriterioSubcriteriaResults", period);
            CustomSqlMap.getInstance().update("updateProcessPeriod", period);

            CustomSqlMap.getInstance().executeBatch();
            CustomSqlMap.getInstance().commitTransaction();
        } catch (SQLException e) {
            throw e;
        } finally {
            try {
                CustomSqlMap.getInstance().endTransaction();
            } catch (SQLException e) {
                throw e;
            }
        }
    }
}
