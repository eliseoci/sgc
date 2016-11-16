/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.sql.DataSource;
import org.apache.commons.dbcp.DriverManagerConnectionFactory;
import org.apache.commons.dbcp.PoolableConnectionFactory;
import org.apache.commons.dbcp.PoolingDataSource;
import org.apache.commons.pool.impl.GenericObjectPool;


public class ConnectionFactory {

    private static interface Singleton {

        final ConnectionFactory INSTANCE = new ConnectionFactory();
    }

    private final DataSource dataSource;

    private ConnectionFactory() {
        String env = System.getProperty("env");
        Properties properties = new Properties();
        GenericObjectPool pool = new GenericObjectPool();
        String DB_URI = "jdbc:mysql://localhost/sgc_efqm";
        System.out.println("Enviroment: " + env);
        if(env != null){
            DB_URI = "jdbc:mysql://c109a5c2-d016-4d93-bc7c-a6be01867c08.mysql.sequelizer.com/dbc109a5c2d0164d93bc7ca6be01867c08";
            properties.setProperty("user", "chyjcmdniuotzvoo");
            properties.setProperty("password", "nWZ82JFsW8NNRuBHuTrZK4UdckFDxGkbh2zC2wXDSMHhXCW8t7AjHR6rcV6Qdb3o");
        } else {
            properties.setProperty("user", "sgc");
            properties.setProperty("password", "sgc");
        }
        DriverManagerConnectionFactory connectionFactory = new DriverManagerConnectionFactory(
          DB_URI, properties);
        new PoolableConnectionFactory(connectionFactory, pool, null,
          "SELECT 1", 3, false, false,
          Connection.TRANSACTION_READ_COMMITTED);

        this.dataSource = new PoolingDataSource(pool);
    }

    public static Connection getDatabaseConnection() throws SQLException {
    return Singleton.INSTANCE.dataSource.getConnection();
    }
}
