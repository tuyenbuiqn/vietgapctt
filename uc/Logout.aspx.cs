﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uc_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["UserID"] = "";
        string a = Session["UserID"].ToString();
        Session["UserName"] = "";
        Session.Abandon();
        Response.Redirect("../");
    }
}