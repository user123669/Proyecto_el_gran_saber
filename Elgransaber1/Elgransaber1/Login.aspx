<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageLog.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section id="feature" class="section-padding wow fadeIn delay-05s">
      <div class="container">
          <div class="row">
             <div class="container">
                <div class="col-md-4 text-center">
                <div class="login-form">
                <div class="main-div">
                    <div class="panel">
                   <h2>Login de Administrador</h2>
                   <p>Ingrese su usuario y contraseña</p>
                   
                   <asp:Login ID="Login1" runat="server" OnAuthenticate="Unnamed1_Authenticate" BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333">
                       <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                       <LayoutTemplate>
                           <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                               <tr>
                                   <td>
                                       <table cellpadding="0">
                                           <tr>
                                               <td align="center" colspan="2">Iniciar sesión</td>
                                           </tr>
                                           <tr>
                                               <td align="right">
                                                   <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                               </td>
                                               <td>
                                                   <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                               </td>
                                           </tr>
                                           <tr>
                                               <td align="right">
                                                   <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                               </td>
                                               <td>
                                                   <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                               </td>
                                           </tr>
                                           <tr>
                                               <td colspan="2">
                                                   <asp:CheckBox ID="RememberMe" runat="server" Text="Recordármelo la próxima vez." />
                                               </td>
                                           </tr>
                                           <tr>
                                               <td align="center" colspan="2" style="color:Red;">
                                                   <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                               </td>
                                           </tr>
                                           <tr>
                                               <td align="right" colspan="2">
                                                   <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Inicio de sesión" ValidationGroup="Login1" />
                                               </td>
                                           </tr>
                                       </table>
                                   </td>
                               </tr>
                           </table>
                       </LayoutTemplate>
                       <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                       <TextBoxStyle Font-Size="0.8em" />
                       <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                        </asp:Login>

                    <%--<div class="form-group">
                        <asp:TextBox ID="txtUsuario" runat="server" placeholder="usuario" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtContrasena" runat="server" placeholder="contraseña" class="form-control" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="forgot">
                    <a href="reset.html">Olvidaste tu contraseña?</a>
                    </div>
                    <asp:Button Text="Ingresar" runat="server" Id="btnIngresarLogin" class="btn btn-primary"/>--%>
                    
                
            <p class="botto-text"> </p>
                        </div></div>
            </div></div></div> </div>
          </div>      
     </section>
</asp:Content>

