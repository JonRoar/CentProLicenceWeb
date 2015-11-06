﻿<%@ Page Title="CentPro - Lisenser" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Licences.aspx.cs" Inherits="CentPro_Licence_Web.Licences" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Velkommen til MyCentPro</h1>
        <p class="lead">MyCentPro gir deg fullstendig oversikt over alle firmaets lisenser samtidig som vi sender varsler når abonnementene og avtalene er i ferd med å utløpe.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Les mer &raquo;</a> </p>
    </div>

        <ul id="eUl">
             <li id="eLi" style="text-align:left">
                 <span style="text-align:left;">Du (Jon Roar Odden) har <span style="color:#ff0000; text-decoration:double;">7</span> lisenser som utgår de nærmeste 3 månedene. [hardcoded]</span> 
                 <input type="checkbox" id="expandCB"/><label id="eLabel" for="expandCB">Se alle varsler&nbsp;&nbsp;</label>&nbsp;&nbsp;

                <p></p>
		        <ul style="text-align:left">
				    Her vil alle varsler for dine lisenser og avtale komme... med linker til hver enkelt av de. <a href="/" >Avtale xyz</a>
		        </ul>
                <ul>
				    Her vil alle varsler for dine lisenser og avtale komme... med linker til hver enkelt av de. <a href="/" >Avtale xyz</a>
		        </ul>
                 <ul class="expand">
				    Her vil alle varsler for dine lisenser og avtale komme... med linker til hver enkelt av de. <a href="/" >Avtale xyz</a>
		        </ul>
                 <ul class="expand">
				    Her vil alle varsler for dine lisenser og avtale komme... med linker til hver enkelt av de. <a href="/" >Avtale xyz</a>
		        </ul>
                 <ul class="expand">
				    Her vil alle varsler for dine lisenser og avtale komme... med linker til hver enkelt av de. <a href="/" >Avtale xyz</a>
		        </ul>
	        </li>
        </ul>


    <div class="row">
        <h4 style="background-color:lightgreen; text-align: center; padding-top:5px; padding-bottom:5px;">Mine lisenser</h4>
        <p>
            <asp:GridView ID="licenceGridView" runat="server" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" GridLines="None"
                Caption="" CaptionAlign="Left" Width="1200px"
                DataKeyNames="lID"
                OnPageIndexChanging="licenceGridView_PageIndexChanging" 
                OnRowCancelingEdit="licenceGridView_RowCancelingEdit" 
                OnRowDeleting="licenceGridView_RowDeleting" 
                OnRowEditing="licenceGridView_RowEditing" 
                OnRowUpdating="licenceGridView_RowUpdating"
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
    </div>

    </ul>
    </a></asp:Content>
