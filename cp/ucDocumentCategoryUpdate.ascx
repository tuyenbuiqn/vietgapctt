﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucDocumentCategoryUpdate.ascx.cs" Inherits="cp_ucDocumentCategoryUpdate" %>
<table style="width: 629px; vertical-align: top">
  
    <tr>
        <td colspan="3" style="text-align: center">
            Quản lý Loại Văn Bản
        </td>
    <tr>
        <td colspan="3">
            <asp:Label ID="lblThongbao" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Tên loại
        </td>
        <td>
            <asp:TextBox ID="txtTenLoai" runat="server" MaxLength="200"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                ControlToValidate="txtTenLoai" ValidationGroup="vgUpdateNews"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;
        </td>
        <td>
            <asp:Button ID="btnOK" runat="server" Text="Đồng ý" ValidationGroup="vgUpdateCategory"
                OnClick="btnOK_Click" />
            <asp:Button ID="btnReset" runat="server" Text="Hủy bỏ" CausesValidation="false" OnClick="btnReset_Click" />
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    
</table>