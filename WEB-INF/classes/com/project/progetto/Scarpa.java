package com.project.progetto;

import java.sql.Date;
import java.time.LocalDate;

public class Scarpa {
    private String nome;
    private String marca; //options
    private String colore; //options
    private String genere; //options
    private int prezzo;
    private String offerta; //options
    private int prezzoOF; 
    private String immagine;


    public String getNome(){
        return nome;
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getColore() {
        return colore;
    }

    public void setColore(String colore) {
        this.colore = colore;
    }

    public String getGenere() {
        return genere;
    }

    public void setGenere(String genere) {
        this.genere = genere;
    }

    public int getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(int prezzo) {
        this.prezzo = prezzo;
    }

    public String getOfferta() {
        return offerta;
    }

    public void setOfferta(String offerta) {
        this.offerta = offerta;
    }

    public int getPrezzoOF() {
        return prezzoOF;
    }

    public void setPrezzoOF(int prezzoOF) {
        this.prezzoOF = prezzoOF;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

}

