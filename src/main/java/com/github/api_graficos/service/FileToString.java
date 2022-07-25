package com.github.api_graficos.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

public class FileToString {

    private final File file;

    public FileToString(File file) {
        this.file = file;
    }

    public String fileToString() {
        StringBuilder sb = new StringBuilder();
        try {
            List<String> lines = Files.readAllLines(file.toPath());
            lines.forEach(l -> {
                sb.append(l);
            });
            return sb.toString();
        } catch (IOException ex) {
            System.out.println(ex);
            return null;
        }
    }
}
