using INVI.Business;
using INVI.Entity;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

public partial class uc_ucMostReadNews : System.Web.UI.UserControl
{
    private List<NewsEntity> lstNews = new List<NewsEntity>();        
    protected void Page_Load(object sender, EventArgs e)
    {
        bindCat();
    }

    private void bindCat()
    {
        int nhomtinID;
        string a = Session["Lang"].ToString();
        if (Session["Lang"].ToString() == "en-US")
        {
            nhomtinID = 4;
        }
        else
        {
            nhomtinID = 1;
        }
        lstNews = NewsBRL.GetMostViewByCategoryID(nhomtinID);

        rptrNewsInHome.DataSource = lstNews;
        rptrNewsInHome.DataBind();

    }  
    protected void rptrNewsInHome_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            {
                Label lblIDNews = e.Item.FindControl("lblIDNews") as Label;
                HyperLink lnkTitle = e.Item.FindControl("lnkTitle") as HyperLink;
                HyperLink lnkImage = e.Item.FindControl("lnkImage") as HyperLink;
                Image imgMinhhoa = e.Item.FindControl("imgMinhhoa") as Image;
                Label lblDesc = e.Item.FindControl("lblDesc") as Label;
                HyperLink lnkChitiet = e.Item.FindControl("lnkChitiet") as HyperLink;
                if (lnkTitle != null && imgMinhhoa != null && lnkChitiet != null && lnkImage != null && lblDesc != null)
                {
                    NewsEntity newsEntity = new NewsEntity();
                    newsEntity = NewsBRL.GetOne(Convert.ToInt32(lblIDNews.Text));
                    lnkTitle.NavigateUrl = "~/Content.aspx?newsID=" + newsEntity.iNewsID;
                    lnkChitiet.NavigateUrl = "~/Content.aspx?newsID=" + newsEntity.iNewsID;
                    lnkTitle.Text = INVI.INVILibrary.INVIString.GetCuttedString(newsEntity.sTitle, 70);
                    if (File.Exists(Server.MapPath(ConfigurationManager.AppSettings["UploadPath"] + newsEntity.sImage)))
                        imgMinhhoa.ImageUrl = ConfigurationManager.AppSettings["UploadPath"] + newsEntity.sImage;
                    else
                    {
                        Panel pnAnh = e.Item.FindControl("pnAnh") as Panel;
                        pnAnh.Visible = false;
                    }
                    lblDesc.Text = INVI.INVILibrary.INVIString.GetCuttedString(newsEntity.sDesc, 150);
                }


            }
        }
    }
    protected void rptrNewsInHome_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}