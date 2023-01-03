package vn.edu.hcmuaf.fit.Database;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(DBProperties.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
    }

    public static String getDBHost() {
        return prop.get("db.host").toString();
    }

    public static String getDBPort() {
        return prop.get("db.port").toString();
    }

    public static String getUserName() {
        return prop.get("db.username").toString();
    }

    public static String getPassword() {
        return prop.get("db.password").toString();
    }

    public static String getOption() {
        return prop.get("db.option").toString();
    }

    public static String getDBName() {
        return prop.get("db.databaseName").toString();
    }
}
