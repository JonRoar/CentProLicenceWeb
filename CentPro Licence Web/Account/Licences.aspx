<%@ Page Title="CentPro - Lisenser" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Licences.aspx.cs" Inherits="CentPro_Licence_Web.Licences" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>CentPro Lisensweb</h1>
        <p class="lead">gir deg fullstendig oversikt over alle firmaets lisenser samtidig som vi sender varsler når abonnementene og avtalene er i ferd med å utløpe.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Les mer &raquo;</a></p>
    </div>

    <div class="row">
        <h2>
            
        </h2>
        <p>
            <asp:GridView ID="licenceGridView" runat="server" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" GridLines="None"
                Caption="Mine lisenser" CaptionAlign="Left" 
                DataKeyNames="lID"
                OnPageIndexChanging="licenceGridView_PageIndexChanging" 
                OnRowCancelingEdit="licenceGridView_RowCancelingEdit" 
                OnRowDeleting="licenceGridView_RowDeleting" 
                OnRowEditing="licenceGridView_RowEditing" 
                OnRowUpdating="licenceGridView_RowUpdating" Width="1200px"
                RowStyle-BackColor="White"
                AlternatingRowStyle-BackColor="#a6c8e6">

                <Columns>
                <asp:BoundField DataField="lID" HeaderText="lID" />
                <asp:BoundField DataField="Eier" HeaderText="Eier" />
                <asp:BoundField DataField="Avtale" HeaderText="Avtale" />
                <asp:BoundField DataField="Gyldig fra" HeaderText="Gyldig fra" />
                <asp:BoundField DataField="Gyldig til" HeaderText="Gyldig til" />
                <asp:BoundField DataField="Antall lisenser" HeaderText="Antall" />
                <asp:BoundField DataField="Varsel" HeaderText="Varsel" />
                <asp:BoundField DataField="Produsent" HeaderText="Produsent" />
                <asp:BoundField DataField="Kontaktperson" HeaderText="Kontaktperson" />
                <asp:CommandField ShowEditButton="true" />
                </Columns>
            </asp:GridView>
            <asp:LinkButton ID="lnkbExportToExcel" runat="server" OnClick="lnkbExportToExcel_Click">Export to Excel</asp:LinkButton>
        </p>

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
