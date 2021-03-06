﻿<%@ Page Title="CentPro - Avtaler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="../Account/Agreements.aspx.cs" Inherits="CentPro_Licence_Web.Agreements" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Velkommen til MyCentPro</h1>
        <p class="lead">MyCentPro gir deg fullstendig oversikt over alle firmaets lisenser samtidig som vi sender varsler når abonnementene og avtalene er i ferd med å utløpe.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Les mer &raquo;</a></p>
    </div>

    <ul id="eUl">
	        <li id="eLi"><input type="checkbox" id="expandCB"/><label id="eLabel" for="expandCB" style="text-align:right;">Se alle varsler&nbsp;&nbsp;</label><br /><br />
                Du (Jon Roar Odden) har <span style="color:#ff0000; text-decoration:double;">2</span> avtaler som utgår de nærmeste 3 månedene. [hardcoded] 

                <p></p>
		        <ul>
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
        <h4 style="background-color:lightgreen; text-align: center; padding-top:5px; padding-bottom:5px;">Mine avtaler</h4>
        <p>
            <asp:GridView ID="agreementsGridView" runat="server" AllowPaging="true" AutoGenerateColumns="false" CellPadding="4" GridLines="None" CssClass="Grid" 
                Caption="" CaptionAlign="Left" Width="1200px"
                OnPageIndexChanging="licenceGridView_PageIndexChanging" 
                OnRowCancelingEdit="licenceGridView_RowCancelingEdit" 
                OnRowDeleting="licenceGridView_RowDeleting" 
                OnRowEditing="licenceGridView_RowEditing" 
                OnRowUpdating="licenceGridView_RowUpdating"
                RowStyle-BackColor="White"
                AlternatingRowStyle-BackColor="#a6c8e6">
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
</asp:Content>
