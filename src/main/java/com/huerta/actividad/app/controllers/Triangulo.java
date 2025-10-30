package com.huerta.actividad.app.controllers;

public class Triangulo {
    private double base;
    private double altura;

    public Triangulo(double base, double altura) {
        this.base = base;
        this.altura = altura;
    }

    public double calcularArea() {
        return (base * altura) / 2;
    }

    public double calcularPerimetro() {
        double lado=Math.sqrt((Math.pow((base/2), 2))+(Math.pow(altura, 2)));
        return (2*lado)+base;
    }
}