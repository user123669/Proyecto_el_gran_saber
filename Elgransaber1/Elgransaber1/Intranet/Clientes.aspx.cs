using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Intranet_Clientes :  System.Web.UI.Page
{
    LibrosDataContext libros = new LibrosDataContext();

    private void Listar()
    {
        gvCliente.DataSource = libros.spListarClientes();
        gvCliente.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            Listar();
    }

    protected void btnAgregarCliente_Click(object sender, EventArgs e)
    {

        string apellidos = txtApellidos.Text.Trim();
        string nombres = txtNombre.Text.Trim();
        string direccion = txtDireccion.Text.Trim();
        string telefono = txtTelefono.Text.Trim();
        
        var consulta = from C in libros.spAgregarCliente(apellidos, nombres, direccion, telefono)
                       select C;
        byte codError = 0;
        string mensaje = string.Empty;
        foreach (var consultar in consulta)
        {
            codError = Convert.ToByte(consultar.CodError);
            mensaje = consultar.Mensaje;
        }
        if (codError == 0)
            Listar();
        Response.Write("<script>alert('" + mensaje + "')</script>");
    }

    protected void btnEliminarCliente_Click(object sender, EventArgs e)
    {
        string codCliente = txtCodCliente.Text.Trim();

        var consulta = from C in libros.spEliminarCliente(codCliente)
                       select C;
        byte codError = 0;
        string mensaje = string.Empty;
        foreach (var consultar in consulta)
        {
            codError = Convert.ToByte(consultar.CodError);
            mensaje = consultar.Mensaje;
        }
        if (codError == 0)
            Listar();
        Response.Write("<script>alert('" + mensaje + "')</script>");
    }

    protected void btnActualizarCliente_Click(object sender, EventArgs e)
    {
        string codCliente = txtCodCliente.Text.Trim();
        string apellidos = txtApellidos.Text.Trim();
        string nombres = txtNombre.Text.Trim();
        string direccion = txtDireccion.Text.Trim();
        string telefono = txtTelefono.Text.Trim();

        var consulta = from C in libros.spActualizarCliente(codCliente, apellidos, nombres, direccion, telefono)
                       select C;
        byte codError = 0;
        string mensaje = string.Empty;
        foreach (var consultar in consulta)
        {
            codError = Convert.ToByte(consultar.CodError);
            mensaje = consultar.Mensaje;
        }
        if (codError == 0)
            Listar();
        Response.Write("<script>alert('" + mensaje + "')</script>");
    }

    protected void btnBuscarLibro_Click(object sender, EventArgs e)
    {
        string codPalabra = txtBuscarCliente.Text.Trim();

        var consulta = from C in libros.spBuscarCliente(codPalabra)
                       select C;

        gvCliente.DataSource = consulta;
        gvCliente.DataBind();
    }
}