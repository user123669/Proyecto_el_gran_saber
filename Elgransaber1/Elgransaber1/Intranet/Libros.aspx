<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageUsuario.master" AutoEventWireup="true" CodeFile="Libros.aspx.cs" Inherits="Intranet_Libros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="feature" class="section-padding wow fadeIn delay-05s">
      <div class="container">
          <div class="row">
              <h1><p style="color:#FDFEFE ";>Libros</h1>
       <div class="col-md-6">
           <body>
  <p style="color:white;">CodLibro: </p>
</body>
   <asp:TextBox runat="server" ID ="txtCodLibro"/></p>
            <body>
  <p style="color:white;">Titulo: </p>
</body>
   <asp:TextBox runat="server" ID ="txtTitulo"/></p>
           <body>
  <p style="color:white;">Autor: </p>
</body>
     <asp:TextBox runat="server" ID ="txtAutor"/></p>
        <body>
  <p style="color:white;">Genero: </p>
</body>
 <asp:TextBox runat="server" ID ="txtGenero"/></p>
     </div>
     <div class="col-md-6 ">
         <body>
  <p style="color:white;">Resumen:  </p>
</body>
     <asp:TextBox runat="server" ID ="txtResumen"/></p>
         <body>
  <p style="color:white;">Precio:   </p>
</body>
    <asp:TextBox runat="server" ID ="txtPrecio"/></p>
          <body>
  <p style="color:white;">Stock:    </p>
</body>
    <asp:TextBox runat="server" ID ="txtStock"/></p>
    
        </div>
              </div>
<div class="row">
       <div class="col-md-6 text-center">
    <p>
    <asp:Button Text="Agregar" runat="server" Id="btnAgregarLibro" OnClick="btnAgregarLibro_Click" />
    <asp:Button Text="Eliminar" runat="server" Id="btnEliminarLibro" OnClick="btnEliminarLibro_Click" />
    <asp:Button Text="Actualizar" runat="server" Id="btnActualizarLibro" OnClick="btnActualizarLibro_Click" />
    </p>
     </div>
</div>
          <div class="row">
              <div class="col-md-6">
              <body>
                  <p style="color:white;">Buscar: </p>
              </body>
                  <asp:TextBox runat="server" ID ="txtBuscarLibro"/>
                  <asp:Button Text="Buscar" runat="server" Id="btnBuscarLibro" OnClick="btnBuscarLibro_Click"/>
              </div>
          </div>
    <asp:GridView runat="server" ID="gvLibro" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
          </asp:GridView>  
          <asp:Button ID="btnExportarExcel" runat="server" Text="Exportar a Excel" OnClick="btnExportarExcel_Click" />
          <asp:Button ID="btnExportarPDF" runat="server" Text="Exportar a PDF" />
              </div>
        </section>
</asp:Content>

    