package com.github.api_graficos.model;

import java.util.HashMap;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Relatorio {

    private String nome;
    private HashMap data;

    @Override
    public String toString() {
        return "Relatorio: " + "Nome: " + nome + " - data: " + data.toString();
    }

}
