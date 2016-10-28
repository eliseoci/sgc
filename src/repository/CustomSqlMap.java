/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package repository;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.IOException;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author winvm
 */
public class CustomSqlMap {    
    private static SqlMapClient sqlMapClient;
    private Reader reader;
    
    private CustomSqlMap() {
        try {
            reader = Resources.getResourceAsReader("config/ibatis-config.xml");
            sqlMapClient = SqlMapClientBuilder.buildSqlMapClient(reader);
        } catch (IOException ex) {
            Logger.getLogger(CustomSqlMap.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static SqlMapClient getInstance(){
        return sqlMapClient == null ? new CustomSqlMap().sqlMapClient : sqlMapClient;
    }
}
