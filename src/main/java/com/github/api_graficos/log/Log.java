package com.github.api_graficos.log;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;

public class Log {

    private final File f;

    public Log(File f) {
        this.f = f;
    }

    public void log(String textToLog) {
        try {
            Files.write(f.toPath(), textToLog.getBytes(), StandardOpenOption.APPEND);
        } catch (Exception e) {
            System.out.println("Error when Logging!!" + e);
        }
    }
}
