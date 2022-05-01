package com.project.progetto;

import java.sql.Date;
import java.time.LocalDate;

public class Utente {
    private String nome;
    private String cognome;
    private String username;
    private String email;
    private String pwd;
    private Date datan;
    private String comunen;
    private String indirizzo;
    private String paese;
    private int cap;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Date getDatan() {
        return datan;
    }

    public void setDatan(Date datan) {
        this.datan = datan;
    }

    public String getComunen() {
        return comunen;
    }

    public void setComunen(String comunen) {
        this.comunen = comunen;
    }

    public String getIndirizzo() {
        return indirizzo;
    }

    public void setIndirizzo(String indirizzo) {
        this.indirizzo = indirizzo;
    }

    public String getPaese() {
        return paese;
    }

    public void setPaese(String paese) {
        this.paese = paese;
    }

    public int getCap() {
        return cap;
    }

    public void setCap(int cap) {
        this.cap = cap;
    }
}

