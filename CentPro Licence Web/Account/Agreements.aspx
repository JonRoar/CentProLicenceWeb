<%@ Page Title="CentPro - Avtaler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Agreements.aspx.cs" Inherits="CentPro_Licence_Web.Agreements" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>CentPro Lisensweb</h1>
        <p class="lead">gir deg fullstendig oversikt over alle firmaets lisenser samtidig som vi sender varsler når abonnementene og avtalene er i ferd med å utløpe.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Les mer &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2></h2>
            <p>
                <asp:GridView ID="agreementsGridView" runat="server" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="Grid" Item
                    Caption="Mine avtaler" CaptionAlign="Left" 
                    OnPageIndexChanging="licenceGridView_PageIndexChanging" 
                    OnRowCancelingEdit="licenceGridView_RowCancelingEdit" 
                    OnRowDeleting="licenceGridView_RowDeleting" 
                    OnRowEditing="licenceGridView_RowEditing" 
                    OnRowUpdating="licenceGridView_RowUpdating"
                    RowStyle-BackColor="White"
                    AlternatingRowStyle-BackColor="YellowGreen">
                    <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                    <Columns>
                    <asp:BoundField DataField="aID" HeaderText="aID" />
                    <asp:BoundField DataField="Avtale" HeaderText="Avtale" />
                    <asp:BoundField DataField="Avtaleeier" HeaderText="Avtaleeier" />
                    <asp:CommandField ShowEditButton="true" />
                    </Columns>
                </asp:GridView>
            </p>
        </div>

        <!--div class="col-md-4">
            <h2>SQL tilkoblingstest</h2>
            <p>
                Trykk her for å teste SQL connectionstring fra Web.config
            </p>
            <p>
                <asp:Button ID="sqltestbtn" runat="server" Text="Test" OnClick="sqltestbtn_Click" />
            </p>
        </!--div-->
    </div>

</asp:Content>
