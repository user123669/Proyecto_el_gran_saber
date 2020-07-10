using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.ServiceModel.Security;

public partial class Login :  System.Web.UI.Page
{
    LibrosDataContext libros = new LibrosDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnIngresarLogin_Click(object sender, EventArgs e)
    {
        //string usuario = txtUsuario.Text.Trim();
        //string contrasena = txtContrasena.Text.Trim();
        //var consulta = from C in libros.spLoginUsuarioE(usuario,contrasena)
        //               select C;
        //byte codError = 0;
        //string mensaje = string.Empty;
        //foreach (var consultar in consulta)
        //{
        //    codError = Convert.ToByte(consultar.CodError);
        //    mensaje = consultar.Mensaje;
        //}
        //if (codError == 0)
        //    FormsAuthentication.RedirectFromLoginPage(usuario, true);
        //    Response.Write("<script>alert('" + mensaje + "')</script>");
    
}

    protected void Unnamed1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        byte codError = 0;
        string mensaje = string.Empty;
        string usuario = Login1.UserName;
        string contrasena = Login1.Password;
        var consulta = from C in libros.spLoginUsuarioE(usuario, contrasena)
                       select C;
        foreach (var consultar in consulta)
        {
            codError = Convert.ToByte(consultar.CodError);
            mensaje = consultar.Mensaje;

        }
        if (codError==0)
        {
            FormsAuthentication.RedirectFromLoginPage(usuario, true);
        }
        else
        {
            Response.Write("<script>alert('" + mensaje + "')</script>");
        }


        //byte codError = 0;
        //string mensaje = string.Empty;
        //foreach (var consultar in consulta)
        //{
        //    codError = Convert.ToByte(consultar.CodError);
        //    mensaje = consultar.Mensaje;
        //}
        //if (codError == 0)
        //    FormsAuthentication.RedirectFromLoginPage(usuario, true);
        //Response.Write("<script>alert('" + mensaje + "')</script>");
    }
}