﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using INVI.Entity;
using INVI.DataAccess;
using INVI.Business;
using System.Collections.Specialized;
public partial class cp_ucTochucchungnhanDanhsachDangky : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //DropDownList ddlKetLuan = ucTochuccapphepDanhgia1.FindControl("ddlKetluan") as DropDownList;
        //if (ddlKetLuan != null)
        //{
        //    btnCapPhep.Visible = ddlKetLuan.SelectedValue == "1" ? true : false;
        //}
        if (!Page.IsPostBack)
        {
            List<DangkyHoatdongchungnhanEntity> lstDanhsachTochucchungnhan = DangkyHoatdongchungnhanBRL.GetAll();
            if (lstDanhsachTochucchungnhan != null && lstDanhsachTochucchungnhan.Count > 0)
                DanhsachTochucchungnhanDangky = lstDanhsachTochucchungnhan;
            napTochucchungnhanDangky();

            // Nếu có tham số truyền vào - nạp thông tin về Tổ chức chứng nhận
            if (Request.QueryString["iTochucchungnhanID"] != null)
            {
                Session["PK_iTochucchungnhanID"] = Request.QueryString["iTochucchungnhanID"].ToString();
                int PK_iDangkyChungnhanVietGapID = 0;
                if (Request.QueryString["PK_iDangkyChungnhanVietGapID"] != null)
                {
                    PK_iDangkyChungnhanVietGapID = Convert.ToInt32(Request.QueryString["PK_iDangkyChungnhanVietGapID"].ToString());
                    //-----------Check duyệts
                    DangkyHoatdongchungnhanEntity oDangky = DangkyHoatdongchungnhanBRL.GetOne(PK_iDangkyChungnhanVietGapID);
                    if (oDangky != null && oDangky.iTrangthaidangky == 2)
                    {
                        btnCapPhep.Visible = false;
                    }
                    else
                    {
                        btnCapPhep.Visible = true;
                    }
                }
                pnThongTin.Visible = true;
                NapForm(PK_iDangkyChungnhanVietGapID);
            }
        }
        
    }
    public List<DangkyHoatdongchungnhanEntity> DanhsachTochucchungnhanDangky
    {
        get
        {
            if (Cache["DanhsachTochucchungnhanDangky"] == null)
                return new List<DangkyHoatdongchungnhanEntity>();
            else
                return (List<DangkyHoatdongchungnhanEntity>)Cache["DanhsachTochucchungnhanDangky"];
        }
        set { Cache["DanhsachTochucchungnhanDangky"] = value; }
    }
    private void napTochucchungnhanDangky()
    {
        List<DangkyHoatdongchungnhanEntity> lstDanhsachTochucchungnhan = new List<DangkyHoatdongchungnhanEntity>();
        // Nếu có dữ liệu trong Cache thì đọc ra
        if (DanhsachTochucchungnhanDangky != null && DanhsachTochucchungnhanDangky.Count > 0)
            lstDanhsachTochucchungnhan = DanhsachTochucchungnhanDangky;
        else
            lstDanhsachTochucchungnhan = DangkyHoatdongchungnhanBRL.GetAll();
        // Lọc dữ liệu theo lần đăng ký
        if (ddlLandangky.SelectedIndex == 0) // lấy danh sách các tổ chức chứng nhận đăng ký lần đầu nhưng chưa được kiểm duyệt
            lstDanhsachTochucchungnhan = lstDanhsachTochucchungnhan.FindAll(delegate(DangkyHoatdongchungnhanEntity oDangkyhoatdongchungnhan)
            {
                return oDangkyhoatdongchungnhan.iLandangky == 1 && oDangkyhoatdongchungnhan.iTrangthaidangky < 2; // chỉ lấy ra các Tổ chức chứng nhận chưa được duyệt
            });
        else
            lstDanhsachTochucchungnhan = lstDanhsachTochucchungnhan.FindAll(delegate(DangkyHoatdongchungnhanEntity oDangkyhoatdongchungnhan)
            {
                return oDangkyhoatdongchungnhan.iLandangky > 1 && oDangkyhoatdongchungnhan.iTrangthaidangky <2; // nhưng phải xử lý thêm, vì 1 TCCN có thể đăng ký nhiều lần
            });
        grvTochuccapphep.DataSource = lstDanhsachTochucchungnhan;
        grvTochuccapphep.DataKeyNames = new String[] { "PK_iDangkyChungnhanVietGapID" };
        grvTochuccapphep.DataBind();
    }
    protected void btnSearchByID_Click(object sender, EventArgs e)
    {

    }
    protected void btnShowAll_Click(object sender, EventArgs e)
    {

    }
    protected void grvTochuccapphep_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void grvTochuccapphep_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Danhgia")
        {
            LinkButton lbtnDanhgia = (LinkButton) e.CommandSource;
            Int16 PK_iTochucchungnhanID = Int16.Parse(lbtnDanhgia.CommandArgument);
            Session["PK_iTochucchungnhanID"] = PK_iTochucchungnhanID;
            Response.Redirect("~/cp/Default.aspx?page=TochuccapphepDanhgia", true);
            //foreach (Control ctr in phDanhgia.Controls)
            //{
            //    phDanhgia.Controls.Remove(ctr);
            //}
            //Control ctrDanhgiaTochuc = LoadControl("~/cp/ucTochuccapphepDanhgia.ascx");
            //phDanhgia.Controls.Add(ctrDanhgiaTochuc);
            ////
            //pnThongTin.Visible = false;
            //pnDanhgia.Visible = true;
        }
    }


    //public void napGiaytoNopkemhoso(Int16 iDangkyChungnhanID)
    //{
    //    List<HosokemtheoTochucchungnhanEntity> lstHosonopkem = HosokemtheoTochucchungnhanBRL.GetByFK_iDangkyChungnhanVietGapID(iDangkyChungnhanID);
    //    List<GiaytoEntity> lstGiayto = GiaytoBRL.GetAll();
    //    lstGiayto = lstGiayto.FindAll(
    //        delegate(GiaytoEntity oGiaytoFound)
    //        {
    //            return (oGiaytoFound.bCSNT == false);
    //        }
    //        );
    //    cblGiaytonopkem.DataSource = lstGiayto;
    //    cblGiaytonopkem.DataTextField = "sTengiayto";
    //    cblGiaytonopkem.DataValueField = "PK_iGiaytoID";
    //    cblGiaytonopkem.DataBind();

    //    HosokemtheoTochucchungnhanEntity oHosoNopkem = null;
    //    if (lstHosonopkem != null && lstHosonopkem.Count > 0)
    //    {
    //        foreach (ListItem chk in cblGiaytonopkem.Items)
    //        {
    //            oHosoNopkem = null;
    //            oHosoNopkem = lstHosonopkem.Find(
    //                delegate(HosokemtheoTochucchungnhanEntity oHosoNopkemFound)
    //                {
    //                    return oHosoNopkemFound.FK_iGiaytoID.ToString().Equals(chk.Value);
    //                }
    //                );
    //            if (oHosoNopkem != null)
    //            {
    //                chk.Selected = true;
    //            }
    //        }
    //    }
    //    lstGiayto = null;
    //    lstHosonopkem = null;
    //}

    protected void grvTochuccapphep_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblTentochuc = (Label)e.Row.FindControl("lblTentochuc");
            Label lblQuanHuyen = (Label)e.Row.FindControl("lblQuanHuyen");
            Label lblTrangthai = (Label)e.Row.FindControl("lblTrangthai");
            if (lblTentochuc != null)
            {
                int iFK_tochucID = Convert.ToInt32(lblTentochuc.Text);
                TochucchungnhanEntity oTochucchungnhan = TochucchungnhanBRL.GetOne(iFK_tochucID);
                lblTentochuc.Text = oTochucchungnhan.sTochucchungnhan;
                lblQuanHuyen.Text = QuanHuyenBRL.GetOne(oTochucchungnhan.FK_iQuanHuyenID).sTen;
                int PK_iDangkyChungnhanVietGapID = Convert.ToInt32(lblTrangthai.Text);
                lblTrangthai.Text = getTrangthai((byte)DangkyHoatdongchungnhanBRL.GetOne(PK_iDangkyChungnhanVietGapID).iTrangthaidangky);
            }
        }
        
    }
    protected void grvTochuccapphep_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int DangKyID = Convert.ToInt32(grvTochuccapphep.DataKeys[e.NewSelectedIndex].Values["PK_iDangkyChungnhanVietGapID"]);
        pnThongTin.Visible = true;
        NapForm(DangKyID);
    }
    private void NapForm(int DangKyID)
    {
        //
        DangkyHoatdongchungnhanEntity oDangkyhd = DangkyHoatdongchungnhanBRL.GetOne(DangKyID);
        //Kiểm tra đã được duyệt hay chưa
        if(oDangkyhd.iTrangthaidangky == 2) //Nếu đã duyệt
        {
            btnCapPhep.Enabled = false;
        }
        else
            if(oDangkyhd.iTrangthaidangky == 0) //Đánh dấu là tổ chức chứng nhận đã xem
            {
                oDangkyhd.iTrangthaidangky = 1;
            }
        int idTochucchungnhan = oDangkyhd.FK_iTochucchungnhanID;
        Session["PK_iTochucchungnhanID"] = idTochucchungnhan;
        TochucchungnhanEntity oTCCN = TochucchungnhanBRL.GetOne(idTochucchungnhan);
        lblCoQuanCaptc.Text = oTCCN.sCoquancap;
        lblDiaChitc.Text = oTCCN.sDiachi;
        lblDienthoaitc.Text = oTCCN.sSodienthoai;
        lblEmailtc.Text = oTCCN.sEmail;
        lblFaxtc.Text = oTCCN.sFax;
        lblMaSotc.Text = oTCCN.sMaso;
        lblNoiCapdkkdtc.Text = oTCCN.sNoicapdangkykinhdoanh;
        lblNgayCapdkdtc.Text = oTCCN.dNgaycapdangkykinhdoanh.ToString("dd/MM/yyyy");
        lblSodangkykdtc.Text = oTCCN.sSodangkykinhdoanh;
        imgLogo.ImageUrl = "ViewImage.aspx?ID=" + oTCCN.PK_iTochucchungnhanID.ToString();
        lblTenTochuc.Text = oTCCN.sTochucchungnhan;
        //
        List<HosokemtheoTochucchungnhanEntity> lst = HosokemtheoTochucchungnhanBRL.GetByFK_iDangkyChungnhanVietGapID(DangKyID);
        rptHoSoKemTheo.DataSource = lst;
        rptHoSoKemTheo.DataBind();
        int iSodanhgiavien = 0;
        //Kiểm tra số đánh giá viên
        List<ChuyengiaEntity> lstChuyengia = ChuyengiaBRL.GetByFK_iTochucchungnhanID(oTCCN.PK_iTochucchungnhanID);
        if (lstChuyengia != null && lstChuyengia.Count > 2)
        {
            btnCapPhep.Enabled = true;
        }
        else
        {
            btnCapPhep.Enabled = false;
        }
        //if(Session["iSodanhgiavien"]!=null)
        //    iSodanhgiavien = Convert.ToInt32(Session["iSodanhgiavien"].ToString());
        //btnCapPhep.Enabled = iSodanhgiavien > 0 ? true : false;

        btnCapPhep.CommandArgument = DangKyID.ToString();
    
    }
    protected void grvTochuccapphep_Sorting(object sender, GridViewSortEventArgs e)
    {

    }
    protected void lbtnDelete_Click(object sender, EventArgs e)
    {

    }
    private String getTrangthai(byte iTrangthai)
    {
        switch (iTrangthai)
        {
            case 0:
                return "Chưa duyệt hồ sơ";
            case 1:
                return "Đã duyệt hồ sơ";
            case 2:
                return "Hồ sơ hoàn chỉnh";
            default:
                return "";
        }
    }
    protected void rptHoSoKemTheo_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblID = (Label)e.Item.FindControl("FK_iGiaytoID");
            Label lblTenGiayTo = (Label)e.Item.FindControl("lblTenGiayTo");
            GiaytoEntity oGiayTo = GiaytoBRL.GetOne(Convert.ToInt32(lblID.Text));
            lblTenGiayTo.Text = oGiayTo.sTengiayto;

        }
    }
    //public static string GetGuidHash()
    //{
    //    return Guid.NewGuid().ToString().GetHashCode().ToString("x");
    //}
    private String randomString(int iLeng)
    {
        string allowedChars = "";
        allowedChars += "1,2,3,4,5,6,7,8,9,0";

        char[] sep = { ',' };
        string[] arr = allowedChars.Split(sep);

        string passwordString = "";

        string temp = "";

        Random rand = new Random();
        for (int i = 0; i < iLeng; i++)
        {
            temp = arr[rand.Next(0, arr.Length)];
            passwordString += temp;
        }
        return passwordString;
    }
    protected void btnCapPhep_Click(object sender, EventArgs e)
    {
        try
        {
            
            int DangKyID = Convert.ToInt32(btnCapPhep.CommandArgument);
            DangkyHoatdongchungnhanEntity oDangkyhd = DangkyHoatdongchungnhanBRL.GetOne(DangKyID);
            int idTochucchungnhan = oDangkyhd.FK_iTochucchungnhanID;
            if (TochucchungnhanBRL.GetOne(idTochucchungnhan).sMaso.Trim().Length > 0 && TochucchungnhanBRL.GetOne(idTochucchungnhan).sKytuviettat.Trim()!="Chưa cấp")
            {
                lblThongbao.Text = "Tổ chức này đã được cấp phép.";
                return;
            }
            string maso = String.Empty;
            maso = "VietGAP-TS-";
            maso += DateTime.Now.Year.ToString().Substring(2, 2)+"-";
            
            // Theo cái mới thì không phải ngẫu nhiên mã số
            // mà con số sau là 2 con số của năm
            // và số lượng mã số được cấp
            //List<TochucchungnhanEntity> lstTochucchungnhan = new List<TochucchungnhanEntity>();
            //do
            //{
            //    maso = randomString(3);
            //    lstTochucchungnhan = TochucchungnhanBRL.GetAll().FindAll(delegate(TochucchungnhanEntity oTochucchungnhan)
            //    {
            //        return oTochucchungnhan.sKytuviettat == maso;
            //    }
            //    );
            //} while (lstTochucchungnhan.Count > 0);
            
            // Đếm số lượng tổ chức chứng nhận đã được chỉ định

            List<TochucchungnhanEntity> lstTochucchungnhan = new List<TochucchungnhanEntity>();
            TochucchungnhanEntity oTCCN = TochucchungnhanBRL.GetOne(idTochucchungnhan);
            TinhEntity oTinh = TinhBRL.GetOne(QuanHuyenBRL.GetOne(oTCCN.FK_iQuanHuyenID).FK_iTinhThanhID);
            // Lấy danh sách các ID tổ chức chứng nhận rồi lọc
            List<DangkyHoatdongchungnhanEntity> lstDanhsachTCCNDangky = DangkyHoatdongchungnhanBRL.GetAll();
            foreach (DangkyHoatdongchungnhanEntity oDanhsachTCCN in lstDanhsachTCCNDangky)
                if (!lstTochucchungnhan.Contains(TochucchungnhanBRL.GetOne(oDanhsachTCCN.FK_iTochucchungnhanID)) && oDanhsachTCCN.iTrangthaidangky==2)
                    //if((QuanHuyenBRL.GetOne(TochucchungnhanBRL.GetOne(oDanhsachTCCN.FK_iTochucchungnhanID).FK_iQuanHuyenID).FK_iTinhThanhID)==oTinh.PK_iTinhID)
                        lstTochucchungnhan.Add(TochucchungnhanBRL.GetOne(oDanhsachTCCN.FK_iTochucchungnhanID));
            // Sắp xếp lại Danh sách các tổ chức chứng nhận để lấy mã số của TCCN có giá trị lớn nhất + 1.
            lstTochucchungnhan.Sort(delegate(TochucchungnhanEntity firstEntity, TochucchungnhanEntity secondEntity)
            {
                return secondEntity.sMaso.CompareTo(firstEntity.sMaso);
            }
            );
            // Lấy thằng mới nhất
            int iStt=0;
            String sMasomoinhat = String.Empty;
            String[] sDulieutrongmaso = null;
            if (lstTochucchungnhan.Count > 0)
            {
                sMasomoinhat = lstTochucchungnhan[0].sMaso;
                sDulieutrongmaso = sMasomoinhat.Split('-');
                iStt = Convert.ToInt16(sDulieutrongmaso[sDulieutrongmaso.Length - 1]) + 1;

            }
            else
                iStt = 1;
            if (iStt < 10)
                maso += "0" + iStt;
            else
                maso += iStt + "";
            //maso += lstTochucchungnhan.Count + 1;
            oTCCN.sKytuviettat = DateTime.Now.Year.ToString().Substring(2, 2) + "-" + iStt;
            oTCCN.sMaso = maso;
            oTCCN.iTrangthai = 2;
            
            TochucchungnhanBRL.Edit(oTCCN);
            oDangkyhd.iTrangthaidangky = 2;
            
            DangkyHoatdongchungnhanBRL.Edit(oDangkyhd);
            pnThongTin.Visible = false;
            Response.Write("<script language=\"javascript\">alert('Tổ chức chứng nhận được cấp mã số:" + maso + "');location='Default.aspx?page=TochuccapphepQuanLy';</script>");
        }
        catch (Exception ex)
        {
            Response.Write("<script language=\"javascript\">alert('" + ex.Message + "');location='Default.aspx?page=TochucchungnhanDanhsachDangky';</script>");
        }
    }
    protected void ddlLandangky_SelectedIndexChanged(object sender, EventArgs e)
    {
        napTochucchungnhanDangky();
    }
    //protected void btnLuuGiaytonopkem_Click(object sender, EventArgs e)
    //{
    //    String sDangkyChungnhan = btnLuuGiaytonopkem.CommandArgument;
    //    if(sDangkyChungnhan != null)
    //    {
    //        Int16 iDangkyChungnhan = Int16.Parse(sDangkyChungnhan);
    //        List<HosokemtheoTochucchungnhanEntity> lstHosonopkem = HosokemtheoTochucchungnhanBRL.GetByFK_iDangkyChungnhanVietGapID(iDangkyChungnhan);
    //        HosokemtheoTochucchungnhanEntity oHosonopkem = null;
    //        foreach (ListItem chk in cblGiaytonopkem.Items)
    //        {
    //            oHosonopkem = null;
    //            oHosonopkem = lstHosonopkem.Find(
    //                delegate(HosokemtheoTochucchungnhanEntity oHosonopkemFound)
    //                {
    //                    return oHosonopkemFound.FK_iGiaytoID.ToString().Equals(chk.Value);
    //                }
    //                );
    //            if (oHosonopkem == null)
    //            {
    //                if (chk.Selected)
    //                {
    //                    HosokemtheoTochucchungnhanEntity oHosonopkemNew = new HosokemtheoTochucchungnhanEntity();
    //                    oHosonopkemNew.FK_iGiaytoID = int.Parse(chk.Value);
    //                    oHosonopkemNew.FK_iDangkyChungnhanVietGapID = iDangkyChungnhan;
    //                    HosokemtheoTochucchungnhanBRL.Add(oHosonopkemNew);
    //                }
    //            }
    //            else
    //            {
    //                if (!chk.Selected)
    //                {
    //                    HosokemtheoTochucchungnhanBRL.Remove(oHosonopkem.PK_iHosokemtheoID);
    //                }
    //                lstHosonopkem.Remove(oHosonopkem); //Loại bỏ phần tử đã tìm thấy để tối ưu
    //            }
    //        }
    //        lstHosonopkem = null;
    //        lblThongbao.Text = "Lưu thành công!";
    //    }
    //}
    //protected void btnHuygiaytonopkem_Click(object sender, EventArgs e)
    //{
    //    panGiayto.Visible = false;
    //}
    protected void btnAnChitiet_Click(object sender, EventArgs e)
    {
        pnThongTin.Visible = false;
        NameValueCollection filtered = new NameValueCollection(Request.QueryString);
        filtered.Remove("iTochucchungnhanID");
        filtered.Remove("PK_iDangkyChungnhanVietGapID");
    }
}