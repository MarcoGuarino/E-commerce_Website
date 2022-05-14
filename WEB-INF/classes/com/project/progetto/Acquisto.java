package com.project.progetto;

import java.sql.Date;
import java.time.LocalDate;
public class Acquisto {
    
    private String nome;
    private int id_utente; //options
    private int taglia; //options
    


    public String getNome(){
        return nome;
    }

    public void setNome(String n){
        this.nome = n;
    }

    public int get_idutente(){
        return id_utente;
    }

    public void setID_utente(int i){
        this.id_utente = i;
    }
    
    public int get_taglia(){
        return taglia;
    }

    public void setN_scarpa(int i){
        this.taglia = i;
    }


   
    
}
