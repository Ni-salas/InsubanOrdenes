package modelos;

import utilidades.ConexionBD;

public class TipoVenta {
    private int idTpVenta;
    private String descripTpVenta;
    private ConexionBD conexion; 

    public TipoVenta(int idTpVenta, String descripVenta) {
        this.idTpVenta = idTpVenta;
        this.descripTpVenta = descripVenta;
        this.conexion = new ConexionBD();
    }
    
    public TipoVenta(String descripVenta) {
        this.descripTpVenta = descripVenta;
        this.conexion = new ConexionBD();
    }
    
    
    
}
