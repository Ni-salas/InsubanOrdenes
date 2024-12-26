
package modelos;

import utilidades.ConexionBD;

public class Proveedor {
    private int idProveedor, rutProv, telefonoProv;
    private String dvRutProv, nombreProv, direccionProv, emailProv, vendedor;
    private TipoVenta tipoVenta;
    private Comuna comuna;
    private ConexionBD conexion;

    public Proveedor(int idProveedor, int rutProv, String dvRutProv, String nombreProv, String direccionProv, String emailProv, int telefonoProv, String vendedor, TipoVenta tipoVenta, Comuna comuna) {
        this.idProveedor = idProveedor;
        this.rutProv = rutProv;
        this.dvRutProv = dvRutProv;
        this.nombreProv = nombreProv;
        this.direccionProv = direccionProv;
        this.emailProv = emailProv;
        this.telefonoProv = telefonoProv;
        this.vendedor = vendedor;
        this.tipoVenta = tipoVenta;
        this.comuna = comuna;
        this.conexion = new ConexionBD();
    }

    public Proveedor(int rutProv,  String dvRutProv, String nombreProv, String direccionProv, String emailProv, int telefonoProv, String vendedor, TipoVenta tipoVenta, Comuna comuna) {
        this.rutProv = rutProv;
        this.dvRutProv = dvRutProv;
        this.nombreProv = nombreProv;
        this.direccionProv = direccionProv;
        this.emailProv = emailProv;
        this.telefonoProv = telefonoProv;
        this.vendedor = vendedor;
        this.tipoVenta = tipoVenta;
        this.comuna = comuna;
        this.conexion = new ConexionBD();
    }
    
    
    
}
