package modelos;

import utilidades.ConexionBD;

public class Comuna {
    private int idComuna;
    private String nombreComuna;
    private Pais pais;
    private ConexionBD conexion;

    public Comuna(int idComuna, String nombreComuna, Pais pais) {
        this.idComuna = idComuna;
        this.nombreComuna = nombreComuna;
        this.pais = pais;
        this.conexion = new ConexionBD();
    }

    public Comuna(String nombreComuna, Pais pais) {
        this.nombreComuna = nombreComuna;
        this.pais = pais;
        this.conexion = new ConexionBD();
    } 
    
}
