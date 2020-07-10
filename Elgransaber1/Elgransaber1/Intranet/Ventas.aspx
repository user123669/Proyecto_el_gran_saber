<%@ Page Title="" Language="C#" MasterPageFile="~/Intranet/MasterPageUsuario.master" AutoEventWireup="true" CodeFile="Ventas.aspx.cs" Inherits="Intranet_Ventas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="feature" class="section-padding wow fadeIn delay-05s">
      <div class="container">
          <div class="row">
              <h1><p style="color:#FDFEFE ";>Ventas</h1>
       <div class="col-md-6">
 
        <body>
  <p style="color:white;">NroPedido:</p>
</body>
         <p> <asp:TextBox runat="server" ID ="txtNroPedido"/></p>
    
           
  <body>
  <p style="color:white;">CodCliente.</p>
</body>  
    <asp:TextBox runat="server" ID ="txtCodCliente"/></p>
    
     </div>
     <div class="col-md-6">
         <body>
  <p style="color:white;">CodLibro:</p>
</body>
        <asp:TextBox runat="server" ID ="txtCodLibro"/></p>
           <body>
  <p style="color:white;">Cantidad:</p>
</body>
   <asp:TextBox runat="server" ID ="txtCantidad"/></p>

    
        </div>
              </div>
<div class="row">
       <div class="col-md-6 text-center">
    <p>
    <asp:Button Text="Registrar Venta" runat="server" Id="btnAgregarLibro" OnClick="btnAgregarLibro_Click" />
    <asp:Button Text="Eliminar" runat="server" Id="btnEliminarLibro" />
    </p>
     </div>
</div>
<div class="row">
              <div class="col-md-6">
              <body>
                  <p style="color:white;">Buscar: </p>
              </body>
                  <asp:TextBox runat="server" ID ="txtBuscarLibro"/>
                  <asp:Button Text="Buscar" runat="server" Id="btnBuscarLibro"/>
              </div>
          </div>

    <asp:GridView runat="server" ID="gvVenta" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
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
          
          <asp:Button ID="btnExportarExcel" runat="server" Text="Exportar a Excel" />
          <asp:Button ID="btnExportarPDF" runat="server" Text="Exportar a PDF" />
              </div>
        </section>
</asp:Content>

