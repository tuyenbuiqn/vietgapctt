﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucImportCSNT.ascx.cs"
    Inherits="cp_ucImportCSNT" %>
<link href="../css/Grid_View.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    fieldset
    {
        -moz-border-radius: 7px;
        border: 1px #dddddd solid;
        margin-bottom: 20px;
        width: 550px;
    }
    
    fieldset legend
    {
        border: 1px #1a6f93 solid;
        color: black;
        font-weight: bold;
        font-family: Verdana;
        font-weight: none;
        font-size: 13px;
        padding-right: 5px;
        padding-left: 5px;
        padding-top: 2px;
        padding-bottom: 2px;
        -moz-border-radius: 3px;
    }
    
    /* Main DIV */
    .m
    {
        width: 560px;
        padding: 20px;
        height: auto;
    }
    
    /* Left DIV */
    .l
    {
        width: 140px;
        margin: 0px;
        padding: 0px;
        float: left;
        text-align: right;
    }
    
    
    /* Right DIV */
    .r
    {
        width: 300px;
        margin: 0px;
        padding: 0px;
        padding-left: 20px;
        float: left;
        text-align: left;
    }
    .rr
    {
        margin: 0px;
        padding: 0px;
        float: left;
        text-align: center;
    }
    .a
    {
        clear: both;
        width: 500px;
        padding: 10px;
    }
</style>
<h2>
    Import thông tin Cơ sở Trồng trọt từ tệp excel
</h2>
<asp:Panel ID="pnAdd" runat="server">
    <div class="m">
        <fieldset>
            <legend>Thao tác </legend>
            <div class="a">
                <asp:Label ID="lblLoi" runat="server" ForeColor="Red" Text=""></asp:Label>
            </div>
            <div class="a">
                <div class="l">
                </div>
                <div class="r">
                    <asp:FileUpload ID="fu" runat="server" />
                    <div style="display: none;">
                        <input id="FileInput" runat="server" type="file" />
                    </div>
                </div>
                <div class="rr">
                </div>
            </div>
            <div class="a">
                <div class="l">
                </div>
                <div class="r">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload file" OnClick="btnUpload_Click" />
                    <asp:Button ID="lbtImport" runat="server" Text="Import" OnClick="lbtImport_Click">
                    </asp:Button>
                </div>
                <div class="rr">
                </div>
            </div>
            <div class="a">
            </div>
        </fieldset>
    </div>
</asp:Panel>
<table style="width: 100%; margin-top: 20px; height: auto;">
    <tr>
        <td width="100%">
            <asp:Label ID="lblThongbao" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="grvCosonuoitrong" runat="server" AutoGenerateColumns="false" AlternatingRowStyle-CssClass="GridAltItem"
                HeaderStyle-CssClass="GridHeader" CssClass="Grid" EnableModelValidation="True"
                OnRowDataBound="grvCosonuoitrong_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Thứ tự">
                        <ItemTemplate>
                            <asp:Label ID="lblThuTu" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="sTencoso" HeaderText="Tên cơ sở" SortExpression="sTencoso" />
                    <asp:BoundField DataField="sTenchucoso" HeaderText="Tên chủ cơ sở" SortExpression="sTenchucoso" />
                    <asp:TemplateField HeaderText="Tên sử dụng" SortExpression="FK_iHinhthucnuoiID">
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" runat="server" Text='<%# Bind("FK_iUserID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quận" SortExpression="FK_iQuanHuyenID">
                        <ItemTemplate>
                            <asp:Label ID="lblIDQuanHuyen" runat="server" Text='<%# Bind("FK_iQuanHuyenID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tỉnh">
                        <ItemTemplate>
                            <asp:Label ID="lblTinhthanh" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Đối tượng trồng" SortExpression="FK_iDoituongnuoiID">
                        <ItemTemplate>
                            <asp:Label ID="lblDoituongnuoiID" runat="server" Text='<%# Bind("FK_iDoituongnuoiID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hình thức trồng" SortExpression="FK_iHinhthucnuoiID">
                        <ItemTemplate>
                            <asp:Label ID="lblHinhthucnuoiID" runat="server" Text='<%# Bind("FK_iHinhthucnuoiID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridHeader"></HeaderStyle>
                <AlternatingRowStyle CssClass="GridAltItem"></AlternatingRowStyle>
            </asp:GridView>
        </td>
    </tr>
</table>
<asp:Panel ID="pnLoi" runat="server">
    <div class="m">
        <fieldset>
            <legend>Danh sách lỗi khi import </legend>
            <asp:Repeater ID="rptLoi" runat="server">
                <HeaderTemplate>
                    <div class="a">
                        <div class="l">
                            Tên cơ sở
                        </div>
                        <div class="r">
                            Lỗi
                        </div>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="a">
                        <div class="l">
                            <%#Eval("sTenCoSo")%>
                        </div>
                        <div class="r">
                            <%#Eval("sLoi")%>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </fieldset>
    </div>
</asp:Panel>
