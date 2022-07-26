package com.github.api_graficos.resources;

import com.github.api_graficos.log.Log;
import com.github.api_graficos.model.Relatorio;
import com.github.api_graficos.service.FileToString;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chart")
public class ChartResource {

    private final File[] setores;
    private final String path = "/home/jelastic/APP/sql";
    private Properties p;
    private Connection con;
    private final File logFile;

    public ChartResource() {
        String dbProperties = "/home/jelastic/db.properties";
        try {
            p = new Properties();
            p.load(new FileInputStream(dbProperties));
            this.con = DriverManager.getConnection(p.getProperty("url"),
                    p.getProperty("user"),
                    p.getProperty("pass"));
        } catch (Exception e) {
            System.out.println(e);
        }
        setores = new File(path).listFiles();
        logFile = new File("/home/jelastic/APP/log.txt");
    }

    @GetMapping("/setores/{nm_setor}")
    public List<String> getRelatorios(@PathVariable String nm_setor) {
        for (int i = 0; i < setores.length; i++) {
            File setor = setores[i];
            if (setor.getName().equals(nm_setor)) {
                return Arrays.asList(setor.list()).stream().map(s -> s.replaceAll(".sql", "")).collect(Collectors.toList());

            }
        }
        return null;

    }

    @GetMapping("/setores/relatorio/{nm_relatorio}")
    public Relatorio getRelatorio(@PathVariable String nm_relatorio) {
        try {
            for (int i = 0; i < setores.length; i++) {
                File setor = setores[i];
                File[] rels = setor.listFiles();
                for (int j = 0; j < rels.length; j++) {
                    File relatorio = rels[j];
                    if (relatorio.getName().replace(".sql", "").equals(nm_relatorio)) {
                        try {

                            FileToString fts = new FileToString(relatorio);
                            String query = fts.fileToString();
                            Relatorio rel = new Relatorio();

                            Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                            ResultSet rs = st.executeQuery(query);
                            HashMap<String, Object> map = new HashMap<>();
                            rs.first();
                            while (!rs.isAfterLast()) {
                                String ano = rs.getString(1);
                                double valor = rs.getDouble(2);
                                map.put(ano, valor);
                                rs.next();
                            }
                            rel.setData(map);
                            rel.setNome(relatorio.getName().replace(".sql", ""));
                            Log log = new Log(logFile);
                            log.log(rel.toString());
                            return rel;
                        } catch (Exception e) {
                            System.out.println("Error ao criar resultSet: " + e);
                        }
                    }

                }

            }
        } catch (Exception e) {
            System.out.println("Erro ao tentar gerar relatorio: " + e.getMessage());

        }
        return null;
    }

    @GetMapping("/setores")
    public List<String> getSetores() {
        try {
            List<File> files = Arrays.asList(setores);
            return files.stream().map(f -> f.getName()).collect(Collectors.toList());

        } catch (Exception e) {
            System.out.println("Erro ao encontrar Setores: " + e.getMessage());
            return null;
        }

    }

}
