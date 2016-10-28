/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.SQLException;
import java.util.List;
import model.Response;

/**
 *
 * @author winvm
 */
public class RepositoryResponse {

    public void insertAllResponses(List<Response> responses) throws SQLException  {
        try {
            CustomSqlMap.getInstance().startTransaction();
            CustomSqlMap.getInstance().startBatch();
            for (Response response : responses) {
                CustomSqlMap.getInstance().insert("insertResponse", response);
            }
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
