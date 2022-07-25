package com.github.api_graficos.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "spring.datasource")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class ConnectionFactory {

    private String url;
    private String username;
    private String password;

    public Connection getConnection() {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            return null;
        }
    }
}
