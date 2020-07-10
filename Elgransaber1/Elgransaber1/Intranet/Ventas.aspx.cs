using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Intranet_Ventas :  System.Web.UI.Page
{
    LibrosDataContext libros = new LibrosDataContext();
    private void Listar()
    {
        gvVenta.DataSource = libros.spListarVentas();
        gvVenta.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            Listar();
    }


    protected void btnAgregarLibro_Click(object sender, EventArgs e)
    {
        string codcli = txtCodCliente.Text.Trim();
        string codlib = txtCodLibro.Text.Trim();
        int cant = Convert.ToInt32(txtCantidad.Text.Trim());
        var consulta = from C in libros.spRealizarVenta(codcli, codlib, cant)
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
}