package vn.edu.hcmuaf.fit.Database;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.model.Product;

import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class JDBIConnector {
    private static Jdbi jdbi;

    public static Jdbi me() {
        if (jdbi == null) {
            makeConnect();
        }
        return jdbi;
    }

    private static void makeConnect() {
        try {
            MysqlDataSource source = new MysqlDataSource();
            source.setURL("jdbc:mysql://" + DBProperties.getDBHost() + ":" + DBProperties.getDBPort() + "/" + DBProperties.getDBName());
            source.setUser(DBProperties.getUserName());
            source.setPassword(DBProperties.getPassword());

            source.setAutoReconnect(true);
            source.setUseCompression(true);

            jdbi = jdbi.create(source);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void main(String[] args) {
        Jdbi me = JDBIConnector.me();
        List<Product> products = me.withHandle(handle -> {
            return handle.createQuery("select * from products").mapToBean(Product.class).stream().collect(Collectors.toList());
        });
    }
}
