using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using INVI.Business;
using INVI.INVILibrary;

public partial class uc_ucInfo : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadContent();
        }
    }
    private void loadContent()
    {
        try
        {
            lblContent.Text = ConfigBRL.GetOne(5).sValue;
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message);
        }
    }
}
