using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Intranet_Libros :  System.Web.UI.Page
{
    // Llamar mapeado LINQ
    LibrosDataContext libros = new LibrosDataContext();

    private void Listar()
    {
        gvLibro.DataSource = libros.spListarLibro();
        gvLibro.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            Listar();
    }


    protected void btnAgregarLibro_Click(object sender, EventArgs e)
    {
        //Libro libro = new Libro();
        //libro.CodLibro = txtCodLibro.Text.Trim();
        //libro.Titulo = txtTitulo.Text.Trim();
        //libro.Autor = txtAutor.Text.Trim();
        //libro.Genero = txtGenero.Text.Trim();
        //libro.Resumen = txtResumen.Text.Trim();
        //libro.Precio = Convert.ToDecimal(txtPrecio.Text.Trim());
        //libro.Stock = Convert.ToInt32(txtStock.Text.Trim());
        //try
        //{
        //    libros.SubmitChanges();
        //    gvLibro.DataSource = Listar();
        //    gvLibro.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.Message);
        //}
        //------------------------------------------------------------------------------------------
        
        string titulo = txtTitulo.Text.Trim();
        string autor = txtAutor.Text.Trim();
        string genero = txtGenero.Text.Trim();
        string resumen = txtResumen.Text.Trim();
        decimal precio = Convert.ToDecimal(txtPrecio.Text.Trim());
        int stock = Convert.ToInt32(txtStock.Text.Trim());
        var consulta = from C in libros.spAgregarLibro(titulo, autor, genero, resumen, precio, stock)
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

    protected void btnEliminarLibro_Click(object sender, EventArgs e)
    {
        string codLibro = txtCodLibro.Text.Trim();

        var consulta = from C in libros.spEliminarLibro(codLibro)
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

    protected void btnActualizarLibro_Click(object sender, EventArgs e)
    {
        string codLibro = txtCodLibro.Text.Trim();
        string titulo = txtTitulo.Text.Trim();
        string autor = txtAutor.Text.Trim();
        string genero = txtGenero.Text.Trim();
        string resumen = txtResumen.Text.Trim();
        decimal precio = Convert.ToDecimal(txtPrecio.Text.Trim());
        int stock = Convert.ToInt32(txtStock.Text.Trim());
        var consulta = from C in libros.spActualizarLibro(codLibro, titulo, autor, genero, resumen, precio, stock)
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
        string codPalabra = txtBuscarLibro.Text.Trim();
       
        var consulta = from C in libros.spBuscarLibro(codPalabra)
                       select C;

        gvLibro.DataSource = consulta;
        gvLibro.DataBind();
 
    }

    private void ExportToExcel(string nameReport, GridView wControl)
    {
        HttpResponse response = Response;
        StringWriter sw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        Page pageToRender = new Page();
        HtmlForm form = new HtmlForm();
        form.Controls.Add(wControl);
        pageToRender.Controls.Add(form);
        response.Clear();
        response.Buffer = true;
        response.ContentType = "application/vnd.ms-excel";
        response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport);
        response.Charset = "UTF-8";
        response.ContentEncoding = Encoding.Default;
        pageToRender.RenderControl(htw);
        response.Write(sw.ToString());
        response.End();
    }


    protected void btnExportarExcel_Click(object sender, EventArgs e)
    {
        ExportToExcel("InformeLibros.xls", gvLibro);
    }
}