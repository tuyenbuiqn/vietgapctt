﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uc_ucSearchByVietGAPID : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtVietGAPID.Value != "")
        {
            Session["VietGAPID"] = txtVietGAPID.Value.Trim();
            Response.Redirect("~/Content.aspx?mode=uc&page=DanhsachCosonuoitrong");
        }
    }
}