package modelos;

import utilidades.ConexionBD;

public class Solicitante {
    private int idSolicitante, telefonoSol;
    private String nombreSol, usuario, contrasena, email;
    private ConexionBD conexion;

    public Solicitante(int idSolicitante, String nombreSol, String usuario, String contrasena, int telefonoSol, String email) {
        this.idSolicitante = idSolicitante;
        this.nombreSol = nombreSol;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.telefonoSol = telefonoSol;
        this.email = email;
        this.conexion = new ConexionBD();
    }
    
    public Solicitante(String nombreSol, String usuario, String contrasena, int telefonoSol, String email) {
        this.nombreSol = nombreSol;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.telefonoSol = telefonoSol;
        this.email = email;
        this.conexion = new ConexionBD();
    }
    
    
}
