
package modelos;

import utilidades.ConexionBD;

public class Pais {
    private int idPais;
    private String nombrePais;
    private ConexionBD conexion;

    public Pais(int idPais, String nombrePais) {
        this.idPais = idPais;
        this.nombrePais = nombrePais;
        this.conexion = new ConexionBD();
    }
    
    public Pais(String nombrePais) {
        this.nombrePais = nombrePais;
        this.conexion = new ConexionBD();
    }
    
    
    
}
