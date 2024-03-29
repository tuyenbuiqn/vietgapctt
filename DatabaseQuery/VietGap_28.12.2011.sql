USE [thanglongsport_VietGap]
GO
/****** Object:  Table [dbo].[tblNews]    Script Date: 12/28/2011 10:43:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNews](
	[iNewsID] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [nvarchar](200) NOT NULL,
	[sDesc] [nvarchar](500) NULL,
	[sContent] [ntext] NOT NULL,
	[sImage] [nvarchar](200) NULL,
	[tDate] [datetime] NOT NULL,
	[iViews] [int] NULL,
	[bVerified] [bit] NULL,
	[sTag] [nvarchar](200) NULL,
	[iUserID] [int] NOT NULL,
 CONSTRAINT [PK_tblNews] PRIMARY KEY CLUSTERED 
(
	[iNewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblTochucchungnhan_CheckByUserID]    Script Date: 12/28/2011 10:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblTochucchungnhan_CheckByUserID]
	@PK_iUserID int
as
begin
	select * FROM tblTochucchungnhan
	WHERE FK_iUserID = @PK_iUserID
END
GO
/****** Object:  Table [dbo].[tblNewsCategory]    Script Date: 12/28/2011 10:43:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNewsCategory](
	[iNewsCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[iCategoryID] [int] NOT NULL,
	[iNewsID] [int] NOT NULL,
 CONSTRAINT [PK_tblNewsCategory] PRIMARY KEY CLUSTERED 
(
	[iNewsCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPermission_Delete]    Script Date: 12/28/2011 10:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPermission_Delete]
    @iPermissionID int
AS
DELETE FROM tblPermission WHERE iPermissionID=@iPermissionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPermission_Get]    Script Date: 12/28/2011 10:39:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPermission_Get]
AS
SELECT * FROM tblPermission
GO
/****** Object:  Table [dbo].[tblPoll]    Script Date: 12/28/2011 10:43:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPoll](
	[iPollID] [int] IDENTITY(1,1) NOT NULL,
	[sQuestion] [nvarchar](500) NOT NULL,
	[iOrder] [smallint] NULL,
	[tDate] [datetime] NOT NULL,
	[bHomepage] [bit] NULL,
	[iNewsID] [int] NULL,
 CONSTRAINT [PK_tblPoll] PRIMARY KEY CLUSTERED 
(
	[iPollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPermission_GetByFK_iGroupID]    Script Date: 12/28/2011 10:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/7/2009 11:22:29 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPermission_GetByFK_iGroupID]
@iGroupID int
AS
SELECT * FROM tblPermission
WHERE iGroupID=@iGroupID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblCateFaq]    Script Date: 12/28/2011 10:44:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblCateFaq](
	[PK_iFaqCateID] [int] IDENTITY(1,1) NOT NULL,
	[sCateName] [nvarchar](100) NOT NULL,
	[sDesc] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblCateFaq] PRIMARY KEY CLUSTERED 
(
	[PK_iFaqCateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblGiayto]    Script Date: 12/28/2011 10:45:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblGiayto](
	[PK_iGiaytoID] [int] IDENTITY(1,1) NOT NULL,
	[sTengiayto] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tblGiayto] PRIMARY KEY CLUSTERED 
(
	[PK_iGiaytoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPermission_GetByPK]    Script Date: 12/28/2011 10:39:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPermission_GetByPK]
    @iPermissionID int
AS
    SELECT * FROM tblPermission
    WHERE iPermissionID=@iPermissionID
GO
/****** Object:  Table [dbo].[tblPollCategory]    Script Date: 12/28/2011 10:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPollCategory](
	[iPollCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[iPollID] [int] NOT NULL,
	[iCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_tblPollCategory] PRIMARY KEY CLUSTERED 
(
	[iPollCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPermission_Insert]    Script Date: 12/28/2011 10:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPermission_Insert]
    
@iPermissionID int Output,
@sName nvarchar(400),
@sDesc nvarchar(1000)
AS
    INSERT INTO tblPermission(sName,sDesc)
    VALUES(@sName,@sDesc)
    SELECT @iPermissionID=SCOPE_IDENTITY()
GO
/****** Object:  Table [dbo].[tblPosition]    Script Date: 12/28/2011 10:43:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosition](
	[iPositionID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tblPosition] PRIMARY KEY CLUSTERED 
(
	[iPositionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPermission_Update]    Script Date: 12/28/2011 10:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPermission_Update] 
    
@iPermissionID int Output,
@sName nvarchar(400),
@sDesc nvarchar(1000)
AS
UPDATE tblPermission
SET
    sName=@sName,sDesc=@sDesc
WHERE iPermissionID=@iPermissionID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblHinhthucnuoi]    Script Date: 12/28/2011 10:45:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblHinhthucnuoi](
	[PK_iHinhthucnuoiID] [int] IDENTITY(1,1) NOT NULL,
	[sTenhinhthuc] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_tblHinhthucnuoi] PRIMARY KEY CLUSTERED 
(
	[PK_iHinhthucnuoiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblToado]    Script Date: 12/28/2011 10:43:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblToado](
	[PK_iToadoID] [int] IDENTITY(1,1) NOT NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblToado] PRIMARY KEY CLUSTERED 
(
	[PK_iToadoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiahanMaso_Insert]    Script Date: 12/28/2011 10:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:58:39 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiahanMaso_Insert]
    
@PK_iGiahanID bigint Output,
@FK_iCosonuoitrongID bigint,
@FK_iMasovietgapID bigint,
@dNgaygiahan datetime,
@iThoihan smallint
AS
    INSERT INTO tblGiahanMaso(FK_iCosonuoitrongID,FK_iMasovietgapID,dNgaygiahan,iThoihan)
    VALUES(@FK_iCosonuoitrongID,@FK_iMasovietgapID,@dNgaygiahan,@iThoihan)
    SELECT @PK_iGiahanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiahanMaso_Update]    Script Date: 12/28/2011 10:38:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:58:39 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiahanMaso_Update] 
    
@PK_iGiahanID bigint Output,
@FK_iCosonuoitrongID bigint,
@FK_iMasovietgapID bigint,
@dNgaygiahan datetime,
@iThoihan smallint
AS
UPDATE tblGiahanMaso
SET
    FK_iCosonuoitrongID=@FK_iCosonuoitrongID,FK_iMasovietgapID=@FK_iMasovietgapID,dNgaygiahan=@dNgaygiahan,iThoihan=@iThoihan
WHERE PK_iGiahanID=@PK_iGiahanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiahanMaso_Get]    Script Date: 12/28/2011 10:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:58:39 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiahanMaso_Get]
AS
SELECT * FROM tblGiahanMaso
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiahanMaso_Delete]    Script Date: 12/28/2011 10:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:58:39 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiahanMaso_Delete]
    @PK_iGiahanID bigint
AS
DELETE FROM tblGiahanMaso WHERE PK_iGiahanID=@PK_iGiahanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiahanMaso_GetByPK]    Script Date: 12/28/2011 10:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:58:39 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiahanMaso_GetByPK]
    @PK_iGiahanID bigint
AS
    SELECT * FROM tblGiahanMaso
    WHERE PK_iGiahanID=@PK_iGiahanID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblPhongBan]    Script Date: 12/28/2011 10:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblPhongBan](
	[PK_iPhongBanID] [bigint] IDENTITY(1,1) NOT NULL,
	[sTenPhong] [nvarchar](100) NULL,
	[sDienThoai] [nvarchar](50) NULL,
	[sFax] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPhongBan] PRIMARY KEY CLUSTERED 
(
	[PK_iPhongBanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblCounter]    Script Date: 12/28/2011 10:44:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblCounter](
	[PK_iCounterID] [bigint] IDENTITY(1,1) NOT NULL,
	[sIP] [nvarchar](50) NULL,
	[tDate] [datetime] NULL,
 CONSTRAINT [PK_tblCounter] PRIMARY KEY CLUSTERED 
(
	[PK_iCounterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblChucVu]    Script Date: 12/28/2011 10:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblChucVu](
	[PK_iChucVuID] [bigint] IDENTITY(1,1) NOT NULL,
	[sTenChucVu] [nvarchar](200) NULL,
	[sCongviecphutrach] [nvarchar](250) NULL,
 CONSTRAINT [PK_tblChucVu] PRIMARY KEY CLUSTERED 
(
	[PK_iChucVuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUser_Delete]    Script Date: 12/28/2011 10:41:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:28 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUser_Delete]
    @iUserID int
AS
DELETE FROM tblUser WHERE iUserID=@iUserID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblUContact]    Script Date: 12/28/2011 10:47:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblUContact](
	[PK_iUContactID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iContactID] [bigint] NULL,
	[sEmail] [nvarchar](200) NULL,
	[sTitle] [nvarchar](500) NULL,
	[sContent] [nvarchar](max) NULL,
	[tDate] [datetime] NULL,
 CONSTRAINT [PK_tblUContact] PRIMARY KEY CLUSTERED 
(
	[PK_iUContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUser_Get]    Script Date: 12/28/2011 10:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:28 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUser_Get]
AS
SELECT * FROM tblUser
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUser_GetByFK_iGroupID]    Script Date: 12/28/2011 10:41:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:28 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUser_GetByFK_iGroupID]
@iGroupID int
AS
SELECT * FROM tblUser
WHERE iGroupID=@iGroupID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUser_Insert]    Script Date: 12/28/2011 10:41:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:28 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUser_Insert]
    
@iUserID int Output,
@sUsername nvarchar(400),
@sPassword nvarchar(400),
@sEmail nvarchar(400),
@bActive bit,
@tLastVisit datetime,
@sIP varchar(16),
@iGroupID int
AS
    INSERT INTO tblUser(sUsername,sPassword,sEmail,bActive,tLastVisit,sIP,iGroupID)
    VALUES(@sUsername,@sPassword,@sEmail,@bActive,@tLastVisit,@sIP,@iGroupID)
    SELECT @iUserID=SCOPE_IDENTITY()
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDichvu]    Script Date: 12/28/2011 10:45:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDichvu](
	[PK_iDichvuID] [int] IDENTITY(1,1) NOT NULL,
	[sTendichvu] [nvarchar](250) NOT NULL,
	[sNoidung] [ntext] NOT NULL,
	[iCategoryID] [int] NOT NULL,
	[iTrangthai] [smallint] NOT NULL,
 CONSTRAINT [PK_tblDichvu] PRIMARY KEY CLUSTERED 
(
	[PK_iDichvuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: không còn cung cấp, 1: vẫn tiếp tục được cung cấp' , @level0type=N'SCHEMA',@level0name=N'thanglongsport_VietGap', @level1type=N'TABLE',@level1name=N'tblDichvu', @level2type=N'COLUMN',@level2name=N'iTrangthai'
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUser_Update]    Script Date: 12/28/2011 10:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:28 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUser_Update] 
    
@iUserID int Output,
@sUsername nvarchar(400),
@sPassword nvarchar(400),
@sEmail nvarchar(400),
@bActive bit,
@tLastVisit datetime,
@sIP varchar(16),
@iGroupID int
AS
UPDATE tblUser
SET
    sUsername=@sUsername,sPassword=@sPassword,sEmail=@sEmail,bActive=@bActive,tLastVisit=@tLastVisit,sIP=@sIP,iGroupID=@iGroupID
WHERE iUserID=@iUserID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUser_GetByPK]    Script Date: 12/28/2011 10:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:28 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUser_GetByPK]
    @iUserID int
AS
    SELECT * FROM tblUser
    WHERE iUserID=@iUserID
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 12/28/2011 10:41:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[iCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [nvarchar](200) NOT NULL,
	[sDesc] [nvarchar](500) NULL,
	[iOrder] [tinyint] NULL,
	[iTopID] [int] NULL,
	[FK_iLanguageID] [int] NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[iCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPermission]    Script Date: 12/28/2011 10:43:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPermission](
	[iPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](200) NOT NULL,
	[sDesc] [nvarchar](500) NOT NULL,
	[iGroupID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblLanguage]    Script Date: 12/28/2011 10:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblLanguage](
	[PK_iLanguageID] [smallint] NOT NULL,
	[sLanguage] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblLanguage] PRIMARY KEY CLUSTERED 
(
	[PK_iLanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_getAllInformation]    Script Date: 12/28/2011 10:36:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrong_getAllInformation]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	SELECT     tblCosonuoitrong.PK_iCosonuoitrongID, tblCosonuoitrong.sMaso_vietgap, tblCosonuoitrong.sTencoso, tblCosonuoitrong.sTenchucoso, 
                      tblCosonuoitrong.sAp, tblCosonuoitrong.sXa, tblCosonuoitrong.sHuyen, tblTinh.sTentinh, tblDoituongnuoi.sTendoituong, tblToado.Latitude, 
                      tblToado.Longitude
	FROM         tblCosonuoitrong INNER JOIN
                      tblTinh ON tblCosonuoitrong.FK_iTinhID = tblTinh.PK_iTinhID INNER JOIN
                      tblDoituongnuoi ON tblCosonuoitrong.FK_iDoituongnuoiID = tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
                      tblToado ON tblCosonuoitrong.FK_iToadoID = tblToado.PK_iToadoID

	SET NOCOUNT ON;

    -- Insert statements for procedure here

END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_GetAll]    Script Date: 12/28/2011 10:39:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[spMasovietgap_GetAll]
as
begin
	SELECT PK_iMasoVietGapID, sMaso FROM tblMasovietgap
end
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrongThongketheoDoiTuongnuoi]    Script Date: 12/28/2011 10:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrongThongketheoDoiTuongnuoi]
	-- Add the parameters for the stored procedure here
(
	@FK_iDoituongnuoiID int,
	@FK_iTinhID int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @SQLQuery AS NVARCHAR(4000)
	Declare @ParamDefinition AS NVarchar(2000) 
    -- Insert statements for procedure here
	SET @SQLQuery='SELECT COUNT(dbo.tblCosonuoitrong.PK_iCosonuoitrongID) AS iSoho, SUM(dbo.tblCosonuoitrong.fTongdientich) AS fTongdientich, 
                      SUM(dbo.tblCosonuoitrong.fTongdientichmatnuoc) AS fTongdientichmatnuoc, SUM(dbo.tblCosonuoitrong.iSanluongdukien) AS iTongsanluongdukien, 
                      SUM(dbo.tblCosonuoitrong.fDientichAolang) AS fDientichAolang, dbo.tblCosonuoitrong.bDuyet, 
                      thanglongsport_VietGap.tblQuanHuyen.sTen AS sTenHuyen'
	IF(@FK_iDoituongnuoiID>0)
		SET @SQLQuery=@SQLQuery+', dbo.tblDoituongnuoi.PK_iDoituongnuoiID'
	IF (@FK_iTinhID>0)
		SET @SQLQuery=@SQLQuery+',  dbo.tblTinh.PK_iTinhID'
	SET @SQLQuery=@SQLQuery+' FROM dbo.tblCosonuoitrong INNER JOIN
						  dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
						  thanglongsport_VietGap.tblQuanHuyen ON dbo.tblCosonuoitrong.FK_iQuanHuyenID = thanglongsport_VietGap.tblQuanHuyen.PK_iQuanHuyenID INNER JOIN
						  dbo.tblTinh ON thanglongsport_VietGap.tblQuanHuyen.FK_iTinhThanhID = dbo.tblTinh.PK_iTinhID AND 
						  thanglongsport_VietGap.tblQuanHuyen.FK_iTinhThanhID = dbo.tblTinh.PK_iTinhID WHERE (1=1) AND (dbo.tblCosonuoitrong.bDuyet = 1)'
	IF(@FK_iDoituongnuoiID>0)
		SET @SQLQuery=@SQLQuery+' AND (dbo.tblDoituongnuoi.PK_iDoituongnuoiID=@FK_iDoituongnuoiID)'
	IF(@FK_iTinhID>0)
		SET @SQLQuery=@SQLQuery+' AND (dbo.tblTinh.PK_iTinhID=@FK_iTinhID)'
	SET @SQLQuery=@SQLQuery + ' GROUP BY thanglongsport_VietGap.tblQuanHuyen.sTen, dbo.tblCosonuoitrong.bDuyet'
	IF(@FK_iDoituongnuoiID>0)
		SET @SQLQuery=@SQLQuery+',dbo.tblDoituongnuoi.PK_iDoituongnuoiID'
	IF(@FK_iTinhID>0)
		SET @SQLQuery=@SQLQuery+',dbo.tblTinh.PK_iTinhID'
	Set @ParamDefinition ='@FK_iDoituongnuoiID int,@FK_iTinhID int'
	Execute sp_Executesql     @SQLQuery, 
                @ParamDefinition, @FK_iDoituongnuoiID, @FK_iTinhID
--	SELECT(@SQLQuery)	
END
GO
/****** Object:  Table [thanglongsport_VietGap].[tblContact]    Script Date: 12/28/2011 10:44:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblContact](
	[PK_iContactID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iPhongBanID] [bigint] NULL,
	[FK_iChucVuID] [bigint] NULL,
	[sHoTen] [nvarchar](200) NULL,
	[sDienThoai] [nvarchar](50) NULL,
	[sEmail] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[PK_iContactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblCosonuoi]    Script Date: 12/28/2011 10:44:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblCosonuoi](
	[PK_iCosonuoiID] [bigint] IDENTITY(1,1) NOT NULL,
	[sTencoso] [nvarchar](50) NOT NULL,
	[sDiachi] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_tblCosonuoi] PRIMARY KEY CLUSTERED 
(
	[PK_iCosonuoiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCategory_Delete]    Script Date: 12/28/2011 10:35:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:19 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCategory_Delete]
    @iCategoryID int
AS
DELETE FROM tblCategory WHERE iCategoryID=@iCategoryID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblLoaivanban]    Script Date: 12/28/2011 10:46:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblLoaivanban](
	[PK_iLoaivanbanID] [int] IDENTITY(1,1) NOT NULL,
	[sTenloai] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_tblLoaivanban] PRIMARY KEY CLUSTERED 
(
	[PK_iLoaivanbanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCategory_Get]    Script Date: 12/28/2011 10:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:19 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCategory_Get]
AS
SELECT * FROM tblCategory ORDER BY iOrder,sTitle
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCategory_GetByFK_iTopID]    Script Date: 12/28/2011 10:36:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:19 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCategory_GetByFK_iTopID]
@iTopID int
AS
SELECT * FROM tblCategory
WHERE iTopID=@iTopID ORDER BY iOrder,sTitle
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTinh_Insert]    Script Date: 12/28/2011 10:41:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/13/2011 11:39:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTinh_Insert]
    
@PK_iTinhID smallint Output,
@sTentinh nvarchar(200),
@sKyhieu varchar(20),
@ISO31662 nchar
AS
    INSERT INTO tblTinh(sTentinh,sKyhieu,ISO31662)
    VALUES(@sTentinh,@sKyhieu,@ISO31662)
    SELECT @PK_iTinhID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCategory_GetByPK]    Script Date: 12/28/2011 10:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:19 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCategory_GetByPK]
    @iCategoryID int
AS
    SELECT * FROM tblCategory
    WHERE iCategoryID=@iCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTinh_Update]    Script Date: 12/28/2011 10:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/13/2011 11:39:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTinh_Update] 
    
@PK_iTinhID smallint Output,
@sTentinh nvarchar(200),
@sKyhieu varchar(20),
@ISO31662 nchar
AS
UPDATE tblTinh
SET
    sTentinh=@sTentinh,sKyhieu=@sKyhieu,ISO31662=@ISO31662
WHERE PK_iTinhID=@PK_iTinhID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCategory_Insert]    Script Date: 12/28/2011 10:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:19 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCategory_Insert]
    
@iCategoryID int Output,
@sTitle nvarchar(400),
@sDesc nvarchar(1000),
@iOrder tinyint,
@iTopID int
AS
    INSERT INTO tblCategory(sTitle,sDesc,iOrder,iTopID)
    VALUES(@sTitle,@sDesc,@iOrder,@iTopID)
    SELECT @iCategoryID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTinh_Get]    Script Date: 12/28/2011 10:41:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/13/2011 11:39:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTinh_Get]
AS
SELECT * FROM tblTinh
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCategory_Update]    Script Date: 12/28/2011 10:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:19 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCategory_Update] 
    
@iCategoryID int Output,
@sTitle nvarchar(400),
@sDesc nvarchar(1000),
@iOrder tinyint,
@iTopID int
AS
UPDATE tblCategory
SET
    sTitle=@sTitle,sDesc=@sDesc,iOrder=@iOrder,iTopID=@iTopID
WHERE iCategoryID=@iCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTinh_Delete]    Script Date: 12/28/2011 10:40:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/13/2011 11:39:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTinh_Delete]
    @PK_iTinhID smallint
AS
DELETE FROM tblTinh WHERE PK_iTinhID=@PK_iTinhID
GO
/****** Object:  Table [dbo].[tblDoituongnuoi]    Script Date: 12/28/2011 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoituongnuoi](
	[PK_iDoituongnuoiID] [int] IDENTITY(1,1) NOT NULL,
	[sTendoituong] [nvarchar](150) NOT NULL,
	[sKytu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblDoituongnuoi] PRIMARY KEY CLUSTERED 
(
	[PK_iDoituongnuoiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ký tự đại diện' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblDoituongnuoi', @level2type=N'COLUMN',@level2name=N'sTendoituong'
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTinh_GetByPK]    Script Date: 12/28/2011 10:41:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/13/2011 11:39:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTinh_GetByPK]
    @PK_iTinhID smallint
AS
    SELECT * FROM tblTinh
    WHERE PK_iTinhID=@PK_iTinhID
GO
/****** Object:  Table [dbo].[tblTinh]    Script Date: 12/28/2011 10:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTinh](
	[PK_iTinhID] [smallint] IDENTITY(1,1) NOT NULL,
	[sTentinh] [nvarchar](100) NULL,
	[sKyhieu] [varchar](20) NULL,
	[ISO31662] [varchar](10) NULL,
 CONSTRAINT [PK_tblTinh] PRIMARY KEY CLUSTERED 
(
	[PK_iTinhID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_GetByFK_FK_iTochucID]    Script Date: 12/28/2011 10:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/24/2011 10:23:31 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_GetByFK_FK_iTochucID]
@FK_iTochucID int
AS
SELECT * FROM tblPhat
WHERE FK_iTochucID=@FK_iTochucID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDocument_GetByFK_iUserID]    Script Date: 12/28/2011 10:37:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:3/30/2009 7:01:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDocument_GetByFK_iUserID]
@iUserID int
AS
SELECT * FROM tblDocument
WHERE iUserID=@iUserID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDanhmucchitieu]    Script Date: 12/28/2011 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDanhmucchitieu](
	[PK_iDanhmucchitieuID] [int] IDENTITY(1,1) NOT NULL,
	[sTenchuyenmuc] [nvarchar](100) NOT NULL,
	[iThutu] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDanhmucchitieuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblMucdo]    Script Date: 12/28/2011 10:46:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblMucdo](
	[PK_iMucdoID] [int] IDENTITY(1,1) NOT NULL,
	[sTenmucdo] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iMucdoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [thanglongsport_VietGap].[tblPhuongphapkiemtra]    Script Date: 12/28/2011 10:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblPhuongphapkiemtra](
	[PK_iPhuongphapkiemtraID] [int] IDENTITY(1,1) NOT NULL,
	[sTenphuongphapkiemtra] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iPhuongphapkiemtraID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Update]    Script Date: 12/28/2011 10:37:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Update] 
    
@PK_iDoandanhgiatochucchungnhanID int Output,
@FK_iDanhgiatochucchungnhanID int,
@FK_iDanhgiavienID int
AS
UPDATE tblDoandanhgiatochucchungnhan
SET
    FK_iDanhgiatochucchungnhanID=@FK_iDanhgiatochucchungnhanID,FK_iDanhgiavienID=@FK_iDanhgiavienID
WHERE PK_iDoandanhgiatochucchungnhanID=@PK_iDoandanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Insert]    Script Date: 12/28/2011 10:37:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Insert]
    
@PK_iDoandanhgiatochucchungnhanID int Output,
@FK_iDanhgiatochucchungnhanID int,
@FK_iDanhgiavienID int
AS
    INSERT INTO tblDoandanhgiatochucchungnhan(FK_iDanhgiatochucchungnhanID,FK_iDanhgiavienID)
    VALUES(@FK_iDanhgiatochucchungnhanID,@FK_iDanhgiavienID)
    SELECT @PK_iDoandanhgiatochucchungnhanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Get]    Script Date: 12/28/2011 10:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Get]
AS
SELECT * FROM tblDoandanhgiatochucchungnhan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Delete]    Script Date: 12/28/2011 10:37:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_Delete]
    @PK_iDoandanhgiatochucchungnhanID int
AS
DELETE FROM tblDoandanhgiatochucchungnhan WHERE PK_iDoandanhgiatochucchungnhanID=@PK_iDoandanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_GetByPK]    Script Date: 12/28/2011 10:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_GetByPK]
    @PK_iDoandanhgiatochucchungnhanID int
AS
    SELECT * FROM tblDoandanhgiatochucchungnhan
    WHERE PK_iDoandanhgiatochucchungnhanID=@PK_iDoandanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoi_Insert]    Script Date: 12/28/2011 10:36:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:18 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoi_Insert]
    
@PK_iCosonuoiID int Output,
@sTencoso nvarchar(100),
@sDiachi nvarchar(300)
AS
    INSERT INTO tblCosonuoi(sTencoso,sDiachi)
    VALUES(@sTencoso,@sDiachi)
    SELECT @PK_iCosonuoiID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_GetByFK_FK_iDanhgiatochucchungnhanID]    Script Date: 12/28/2011 10:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_GetByFK_FK_iDanhgiatochucchungnhanID]
@FK_iDanhgiatochucchungnhanID int
AS
SELECT * FROM tblDoandanhgiatochucchungnhan
WHERE FK_iDanhgiatochucchungnhanID=@FK_iDanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoi_Update]    Script Date: 12/28/2011 10:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:18 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoi_Update] 
    
@PK_iCosonuoiID int Output,
@sTencoso nvarchar(100),
@sDiachi nvarchar(300)
AS
UPDATE tblCosonuoi
SET
    sTencoso=@sTencoso,sDiachi=@sDiachi
WHERE PK_iCosonuoiID=@PK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_GetByFK_FK_iDanhgiavienID]    Script Date: 12/28/2011 10:37:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/25/2011 10:29:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoandanhgiatochucchungnhan_GetByFK_FK_iDanhgiavienID]
@FK_iDanhgiavienID int
AS
SELECT * FROM tblDoandanhgiatochucchungnhan
WHERE FK_iDanhgiavienID=@FK_iDanhgiavienID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoi_Get]    Script Date: 12/28/2011 10:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:18 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoi_Get]
AS
SELECT * FROM tblCosonuoi
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoi_Delete]    Script Date: 12/28/2011 10:36:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:18 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoi_Delete]
    @PK_iCosonuoiID int
AS
DELETE FROM tblCosonuoi WHERE PK_iCosonuoiID=@PK_iCosonuoiID
GO
/****** Object:  Table [thanglongsport_VietGap].[tblFaq]    Script Date: 12/28/2011 10:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblFaq](
	[PK_iFaqID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iFaqCateID] [int] NOT NULL,
	[sQuestion] [nvarchar](500) NOT NULL,
	[dDate] [datetime] NOT NULL,
	[iViews] [bigint] NULL,
	[FK_iUserID] [bigint] NOT NULL,
 CONSTRAINT [PK_tblFaq] PRIMARY KEY CLUSTERED 
(
	[PK_iFaqID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoi_GetByPK]    Script Date: 12/28/2011 10:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:18 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoi_GetByPK]
    @PK_iCosonuoiID int
AS
    SELECT * FROM tblCosonuoi
    WHERE PK_iCosonuoiID=@PK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToadoCosonuoi_Insert]    Script Date: 12/28/2011 10:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:28 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToadoCosonuoi_Insert]
    
@PK_iToadocosonuoiID bigint Output,
@FK_iCosonuoiID int,
@sLat nvarchar(100),
@sLon nvarchar(100)
AS
    INSERT INTO tblToadoCosonuoi(FK_iCosonuoiID,sLat,sLon)
    VALUES(@FK_iCosonuoiID,@sLat,@sLon)
    SELECT @PK_iToadocosonuoiID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToadoCosonuoi_Update]    Script Date: 12/28/2011 10:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:28 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToadoCosonuoi_Update] 
    
@PK_iToadocosonuoiID bigint Output,
@FK_iCosonuoiID int,
@sLat nvarchar(100),
@sLon nvarchar(100)
AS
UPDATE tblToadoCosonuoi
SET
    FK_iCosonuoiID=@FK_iCosonuoiID,sLat=@sLat,sLon=@sLon
WHERE PK_iToadocosonuoiID=@PK_iToadocosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToadoCosonuoi_Get]    Script Date: 12/28/2011 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:28 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToadoCosonuoi_Get]
AS
SELECT * FROM tblToadoCosonuoi
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToadoCosonuoi_Delete]    Script Date: 12/28/2011 10:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:28 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToadoCosonuoi_Delete]
    @PK_iToadocosonuoiID bigint
AS
DELETE FROM tblToadoCosonuoi WHERE PK_iToadocosonuoiID=@PK_iToadocosonuoiID
GO
/****** Object:  Table [dbo].[tblAdv]    Script Date: 12/28/2011 10:41:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdv](
	[iAdvID] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [nvarchar](200) NOT NULL,
	[sLink] [nvarchar](200) NOT NULL,
	[sDesc] [nvarchar](500) NULL,
	[sMedia] [nvarchar](200) NOT NULL,
	[iType] [tinyint] NULL,
	[iOrder] [tinyint] NULL,
	[iPositionID] [int] NULL,
	[iWidth] [smallint] NULL,
	[iHeight] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToadoCosonuoi_GetByPK]    Script Date: 12/28/2011 10:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:28 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToadoCosonuoi_GetByPK]
    @PK_iToadocosonuoiID bigint
AS
    SELECT * FROM tblToadoCosonuoi
    WHERE PK_iToadocosonuoiID=@PK_iToadocosonuoiID
GO
/****** Object:  Table [dbo].[tblAdvCategory]    Script Date: 12/28/2011 10:41:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdvCategory](
	[iAdvCategory] [int] IDENTITY(1,1) NOT NULL,
	[iAdvID] [int] NOT NULL,
	[iCategoryID] [int] NOT NULL,
 CONSTRAINT [PK_tblAdvCategory] PRIMARY KEY CLUSTERED 
(
	[iAdvCategory] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToadoCosonuoi_GetByFK_FK_iCosonuoiID]    Script Date: 12/28/2011 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/19/2011 10:50:28 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToadoCosonuoi_GetByFK_FK_iCosonuoiID]
@FK_iCosonuoiID int
AS
SELECT * FROM tblToadoCosonuoi
WHERE FK_iCosonuoiID=@FK_iCosonuoiID
GO
/****** Object:  Table [dbo].[tblConfig]    Script Date: 12/28/2011 10:42:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblConfig](
	[iConfigID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](200) NOT NULL,
	[sValue] [nvarchar](4000) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFeedback]    Script Date: 12/28/2011 10:42:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFeedback](
	[iFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[iNewsID] [int] NOT NULL,
	[sName] [nvarchar](200) NOT NULL,
	[sEmail] [nvarchar](200) NOT NULL,
	[sTitle] [nvarchar](200) NOT NULL,
	[sContent] [ntext] NOT NULL,
	[tDate] [datetime] NULL,
	[bVerified] [bit] NULL,
 CONSTRAINT [PK_tblFeedback] PRIMARY KEY CLUSTERED 
(
	[iFeedbackID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGroup]    Script Date: 12/28/2011 10:42:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroup](
	[iGroupID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](200) NOT NULL,
	[sDesc] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblGroup] PRIMARY KEY CLUSTERED 
(
	[iGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_Search]    Script Date: 12/28/2011 10:39:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [thanglongsport_VietGap].[spNews_Search]  
(
@sTieude nvarchar(30),
@FK_CategoryID int,
@sUsername nvarchar(30),
@tNgaydang1 datetime,
@tNgaydang2 datetime
)
AS

DECLARE @sql nvarchar(1000)
SET DATEFORMAT dmy

SELECT @sql='SELECT tblNews.iNewsID, tblNews.sTitle, tblNews.tDate, tblNews.bVerified, sUsername
FROM tblNews INNER JOIN
tblNewsCategory ON tblNews.iNewsID = tblNewsCategory.iNewsID INNER JOIN tblUser ON tblNews.iUserID = tblUser.iUserID WHERE ' + 
'tblNews.sTitle like ''%'+ltrim(rtrim(@sTieude))+'%'''+
' AND tblNewsCategory.iCategoryID='+ltrim(rtrim(@FK_CategoryID))+
' AND tblUser.sUsername like ''%'+ltrim(rtrim(@sUsername))+'%'''+
' AND tblNews.tDate>='+''''+convert(varchar(10),@tNgaydang1,103)+''''+' AND tDate<'+''''+convert(varchar(10),@tNgaydang2,103)+''''
GO
/****** Object:  Table [dbo].[tblRate]    Script Date: 12/28/2011 10:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRate](
	[iRateID] [int] IDENTITY(1,1) NOT NULL,
	[iNewsID] [int] NULL,
	[iRate] [int] NULL,
	[iCount] [int] NULL,
 CONSTRAINT [PK_tblRate] PRIMARY KEY CLUSTERED 
(
	[iRateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPollAnswer]    Script Date: 12/28/2011 10:43:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPollAnswer](
	[iAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[sAnswer] [nvarchar](200) NOT NULL,
	[iCount] [int] NULL,
	[iPollID] [int] NOT NULL,
 CONSTRAINT [PK_tblPollAnswer] PRIMARY KEY CLUSTERED 
(
	[iAnswerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblFaqCategory]    Script Date: 12/28/2011 10:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblFaqCategory](
	[PK_iFaqCategoryID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iFaqID] [bigint] NOT NULL,
	[iCateFaqID] [int] NOT NULL,
 CONSTRAINT [PK_tblFaqCategory] PRIMARY KEY CLUSTERED 
(
	[PK_iFaqCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblGiaytonopkemhoso]    Script Date: 12/28/2011 10:45:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblGiaytonopkemhoso](
	[PK_iGiaytoguikemID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iGiaytoID] [int] NOT NULL,
	[bTrangthai] [bit] NOT NULL,
	[PK_iHosodangkychungnhanID] [bigint] NOT NULL,
 CONSTRAINT [PK_tblGiaytonopkemhoso] PRIMARY KEY CLUSTERED 
(
	[PK_iGiaytoguikemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblHosokemtheoTochucchungnhan]    Script Date: 12/28/2011 10:46:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblHosokemtheoTochucchungnhan](
	[PK_iHosokemtheoID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iGiaytoID] [int] NOT NULL,
	[FK_iDangkyChungnhanVietGapID] [int] NOT NULL,
 CONSTRAINT [PK_tblHosokemtheoTochucchungnhan] PRIMARY KEY CLUSTERED 
(
	[PK_iHosokemtheoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCosonuoitrong]    Script Date: 12/28/2011 10:42:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCosonuoitrong](
	[PK_iCosonuoitrongID] [bigint] IDENTITY(1,1) NOT NULL,
	[sMaso_vietgap] [nvarchar](50) NULL,
	[sTencoso] [nvarchar](50) NOT NULL,
	[sTenchucoso] [nvarchar](50) NOT NULL,
	[sAp] [nvarchar](150) NULL,
	[sXa] [nvarchar](150) NULL,
	[FK_iQuanHuyenID] [bigint] NULL,
	[sDienthoai] [varchar](20) NULL,
	[fTongdientich] [float] NULL,
	[fTongdientichmatnuoc] [float] NULL,
	[FK_iToadoID] [int] NULL,
	[sSodoaonuoi] [nvarchar](100) NULL,
	[FK_iDoituongnuoiID] [int] NULL,
	[iNamsanxuat] [int] NULL,
	[iChukynuoi] [int] NULL,
	[dNgaydangky] [datetime] NULL,
	[bDuyet] [bit] NULL CONSTRAINT [DF_tblCosonuoitrong_bDuyet]  DEFAULT ((0)),
	[FK_iUserID] [bigint] NOT NULL,
	[sMasocoso] [nvarchar](50) NULL,
	[iSanluongdukien] [int] NULL,
	[fDientichAolang] [float] NULL,
	[FK_iHinhthucnuoiID] [int] NULL,
 CONSTRAINT [PK_tblCosonuoitrong] PRIMARY KEY CLUSTERED 
(
	[PK_iCosonuoitrongID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [thanglongsport_VietGap].[tblTochucchungnhan]    Script Date: 12/28/2011 10:47:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblTochucchungnhan](
	[PK_iTochucchungnhanID] [int] IDENTITY(1,1) NOT NULL,
	[sTochucchungnhan] [nvarchar](150) NOT NULL,
	[sKytuviettat] [nvarchar](50) NOT NULL,
	[sDiachi] [nvarchar](150) NOT NULL,
	[FK_iQuanHuyenID] [bigint] NOT NULL,
	[sSodienthoai] [varchar](20) NULL,
	[FK_iUserID] [bigint] NULL,
	[imgLogo] [image] NULL,
	[sFax] [nvarchar](20) NULL,
	[sEmail] [nvarchar](150) NULL,
	[sSodangkykinhdoanh] [nvarchar](150) NULL,
	[sCoquancap] [nvarchar](150) NULL,
	[dNgaycapdangkykinhdoanh] [datetime] NULL,
	[sNoicapdangkykinhdoanh] [nvarchar](150) NULL,
	[iTrangthai] [smallint] NULL,
	[bDuyet] [bit] NULL,
 CONSTRAINT [PK_tblTochucchungnhan] PRIMARY KEY CLUSTERED 
(
	[PK_iTochucchungnhanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [thanglongsport_VietGap].[tblToadoCosonuoi]    Script Date: 12/28/2011 10:47:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblToadoCosonuoi](
	[PK_iToadocosonuoiID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iCosonuoiID] [bigint] NOT NULL,
	[sLat] [nvarchar](50) NOT NULL,
	[sLon] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblToadoCosonuoi] PRIMARY KEY CLUSTERED 
(
	[PK_iToadocosonuoiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblHosodangkychungnhan]    Script Date: 12/28/2011 10:46:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblHosodangkychungnhan](
	[PK_iHosodangkychungnhanID] [bigint] IDENTITY(1,1) NOT NULL,
	[dNgaydangky] [datetime] NOT NULL,
	[FK_iCosonuoiID] [bigint] NOT NULL,
	[bLandau] [bit] NOT NULL,
 CONSTRAINT [PK_tblHosodangkychungnhan] PRIMARY KEY CLUSTERED 
(
	[PK_iHosodangkychungnhanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblBaocaokhacphucloi]    Script Date: 12/28/2011 10:44:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblBaocaokhacphucloi](
	[PK_iBaocaokhacphucloiID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iCosonuoiID] [bigint] NOT NULL,
	[sTailieukiemtheo] [nvarchar](max) NULL,
	[dNgaykiemtra] [datetime] NOT NULL,
	[sDoankiemtra] [nvarchar](1000) NULL,
 CONSTRAINT [PK_tblBaocaokhacphucloi] PRIMARY KEY CLUSTERED 
(
	[PK_iBaocaokhacphucloiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblAonuoi]    Script Date: 12/28/2011 10:43:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblAonuoi](
	[PK_iAonuoiID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iCosonuoitrongID] [bigint] NOT NULL,
	[fDientich] [float] NOT NULL,
	[sMasoAo] [nvarchar](50) NOT NULL,
	[dNgaythagiong] [datetime] NOT NULL,
	[sMatdotha] [nvarchar](50) NULL,
	[fCogiong] [float] NULL,
 CONSTRAINT [PK_tblAonuoi] PRIMARY KEY CLUSTERED 
(
	[PK_iAonuoiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDanhgiaketqua]    Script Date: 12/28/2011 10:44:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDanhgiaketqua](
	[PK_iDanhgiaketquaID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iChitieuID] [int] NOT NULL,
	[FK_iPhuongphapkiemtraID] [int] NOT NULL,
	[FK_iCosonuoiID] [bigint] NOT NULL,
	[iKetqua] [smallint] NOT NULL,
 CONSTRAINT [PK_tbDanhgiaketqua] PRIMARY KEY CLUSTERED 
(
	[PK_iDanhgiaketquaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblMasovietgap]    Script Date: 12/28/2011 10:46:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblMasovietgap](
	[PK_iMasoVietGapID] [bigint] IDENTITY(1,1) NOT NULL,
	[sMaso] [nvarchar](50) NOT NULL,
	[FK_iTochucchungnhanID] [int] NOT NULL,
	[FK_iCosonuoitrongID] [bigint] NOT NULL,
	[dNgaycap] [datetime] NOT NULL,
	[dNgayhethan] [datetime] NOT NULL,
	[iThoihan] [smallint] NOT NULL,
	[iTrangthai] [smallint] NULL,
	[iSanluongdukienmoi] [bigint] NULL,
	[fDientichmorong] [float] NULL,
 CONSTRAINT [PK_tblMasovietgap] PRIMARY KEY CLUSTERED 
(
	[PK_iMasoVietGapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblPhat]    Script Date: 12/28/2011 10:46:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblPhat](
	[PK_iPhatDinhchiID] [int] IDENTITY(1,1) NOT NULL,
	[sLydo] [nvarchar](500) NOT NULL,
	[iMucdo] [smallint] NOT NULL,
	[FK_iCosonuoiID] [bigint] NOT NULL,
	[dNgaythuchien] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPhat] PRIMARY KEY CLUSTERED 
(
	[PK_iPhatDinhchiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: cảnh cáo, 1: đình chỉ, 2: thu hồi' , @level0type=N'SCHEMA',@level0name=N'thanglongsport_VietGap', @level1type=N'TABLE',@level1name=N'tblPhat', @level2type=N'COLUMN',@level2name=N'iMucdo'
GO
/****** Object:  Table [thanglongsport_VietGap].[tblNhatkyAonuoi]    Script Date: 12/28/2011 10:46:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblNhatkyAonuoi](
	[PK_iNhatkyAonuoiID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iAonuoiID] [bigint] NOT NULL,
	[dNgaythang] [datetime] NOT NULL,
	[iSoluong] [int] NOT NULL,
	[sTinhtrang] [nvarchar](150) NOT NULL,
	[fThetich] [float] NOT NULL,
	[iSoluongchet] [int] NULL,
	[sGhichu] [nvarchar](350) NULL,
 CONSTRAINT [PK_tblNhatkyAonuoi] PRIMARY KEY CLUSTERED 
(
	[PK_iNhatkyAonuoiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDoandanhgiatochucchungnhan]    Script Date: 12/28/2011 10:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDoandanhgiatochucchungnhan](
	[PK_iDoandanhgiatochucchungnhanID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iDanhgiatochucchungnhanID] [int] NOT NULL,
	[FK_iDanhgiavienID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDoandanhgiatochucchungnhanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDanhgiatochucchungnhan]    Script Date: 12/28/2011 10:45:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDanhgiatochucchungnhan](
	[PK_iDanhgiatochucchungnhanID] [int] IDENTITY(1,1) NOT NULL,
	[sPhamvinghidinh] [ntext] NOT NULL,
	[tGiodanhgia] [datetime] NOT NULL,
	[dNgaydanhgia] [datetime] NOT NULL,
	[sCancudanhgia] [ntext] NOT NULL,
	[sNoidungdanhgia] [ntext] NOT NULL,
	[sKetquadanhgia] [ntext] NOT NULL,
	[iKetquadanhgia] [smallint] NOT NULL,
	[sKiennghi] [ntext] NULL,
	[FK_iTochucchungnhanID] [int] NOT NULL,
	[FK_iTruongdoandanhgiaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PK_iDanhgiatochucchungnhanID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblBaocaokhacphucloiChitiet]    Script Date: 12/28/2011 10:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblBaocaokhacphucloiChitiet](
	[PK_iBaocaokhacphucloiChitietID] [bigint] IDENTITY(1,1) NOT NULL,
	[sLoisai] [nvarchar](50) NOT NULL,
	[sBienphapkhacphuc] [nvarchar](700) NOT NULL,
	[iKetqua] [smallint] NOT NULL,
	[FK_iBaocaokhacphucloiID] [bigint] NOT NULL,
 CONSTRAINT [PK_tblBaocaokhacphucloiChitiet] PRIMARY KEY CLUSTERED 
(
	[PK_iBaocaokhacphucloiChitietID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocument]    Script Date: 12/28/2011 10:42:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocument](
	[PK_iDocumentID] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [nvarchar](500) NOT NULL,
	[sDesc] [nvarchar](1000) NULL,
	[sImage] [nvarchar](500) NULL,
	[iDownloadTime] [int] NULL,
	[iUserID] [int] NOT NULL,
	[sLinkFile] [nvarchar](500) NOT NULL,
	[tDate] [datetime] NOT NULL,
	[sAuthor] [nvarchar](50) NOT NULL,
	[sCoquanbanhanh] [nvarchar](150) NOT NULL,
	[FK_iLoaivanbanID] [int] NOT NULL,
	[dNgaybanhanh] [datetime] NOT NULL,
	[dNgaydangcongbao] [datetime] NOT NULL,
	[dNgaycohieuluc] [datetime] NOT NULL,
	[dNgayhethieuluc] [datetime] NOT NULL,
	[sPhamvi] [nvarchar](50) NOT NULL,
	[sSokyhieu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblDocument] PRIMARY KEY CLUSTERED 
(
	[PK_iDocumentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblQuanHuyen]    Script Date: 12/28/2011 10:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblQuanHuyen](
	[PK_iQuanHuyenID] [bigint] IDENTITY(1,1) NOT NULL,
	[sTen] [nvarchar](150) NOT NULL,
	[bQuanHuyen] [bit] NOT NULL,
	[sKytuviettat] [nvarchar](50) NOT NULL,
	[FK_iTinhThanhID] [smallint] NOT NULL,
 CONSTRAINT [PK_tblQuanHuyen] PRIMARY KEY CLUSTERED 
(
	[PK_iQuanHuyenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblChitieu]    Script Date: 12/28/2011 10:44:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblChitieu](
	[PK_iChitieuID] [int] IDENTITY(1,1) NOT NULL,
	[sNoidung] [ntext] NOT NULL,
	[sYeucauvietgap] [ntext] NULL,
	[iThuthu] [smallint] NULL,
	[FK_iMucdoID] [int] NOT NULL,
	[sGhichu] [ntext] NULL,
	[FK_iDanhmucchitieuID] [int] NOT NULL,
 CONSTRAINT [PK__tblChitieu__6D823440] PRIMARY KEY CLUSTERED 
(
	[PK_iChitieuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblFaqAnswers]    Script Date: 12/28/2011 10:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblFaqAnswers](
	[PK_iFaqAnswerID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_iFaqID] [bigint] NOT NULL,
	[sContent] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_tblFaqAnswers] PRIMARY KEY CLUSTERED 
(
	[PK_iFaqAnswerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDangkyHoatdongchungnhan]    Script Date: 12/28/2011 10:44:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDangkyHoatdongchungnhan](
	[PK_iDangkyChungnhanVietGapID] [int] IDENTITY(1,1) NOT NULL,
	[FK_iTochucchungnhanID] [int] NOT NULL,
	[iTrangthaidangky] [smallint] NOT NULL,
 CONSTRAINT [PK_tblDangkyHoatdongchungnhan] PRIMARY KEY CLUSTERED 
(
	[PK_iDangkyChungnhanVietGapID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [thanglongsport_VietGap].[tblDanhgiavien]    Script Date: 12/28/2011 10:45:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [thanglongsport_VietGap].[tblDanhgiavien](
	[PK_iDanhgiavienID] [int] IDENTITY(1,1) NOT NULL,
	[sHoten] [nvarchar](30) NOT NULL,
	[FK_iTochucchungnhanID] [int] NOT NULL,
	[sTrinhdo] [nvarchar](50) NOT NULL,
	[iNamkinhnghiem] [smallint] NOT NULL,
	[bTCVN190112003] [bit] NOT NULL,
	[bISO190112002] [bit] NOT NULL,
	[bVietGapCer] [bit] NOT NULL,
 CONSTRAINT [PK_tblDanhgiavien] PRIMARY KEY CLUSTERED 
(
	[PK_iDanhgiavienID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 12/28/2011 10:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUser](
	[iUserID] [bigint] IDENTITY(1,1) NOT NULL,
	[sUsername] [nvarchar](200) NOT NULL,
	[sPassword] [nvarchar](200) NOT NULL,
	[sEmail] [nvarchar](200) NOT NULL,
	[bActive] [bit] NULL,
	[tLastVisit] [datetime] NULL,
	[sIP] [varchar](16) NULL,
	[iGroupID] [int] NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[iUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblGroupPermission]    Script Date: 12/28/2011 10:42:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGroupPermission](
	[iGroupPermissionID] [int] IDENTITY(1,1) NOT NULL,
	[iGroupID] [int] NOT NULL,
	[iPermissionID] [int] NOT NULL,
	[sValue] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblGroupPermission] PRIMARY KEY CLUSTERED 
(
	[iGroupPermissionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_Insert]    Script Date: 12/28/2011 10:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:23 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNews_Insert]
    
@iNewsID int Output,
@sTitle nvarchar(400),
@sDesc nvarchar(1000),
@sContent ntext,
@sImage nvarchar(400),
@tDate datetime,
@iViews int,
@bVerified bit,
@sTag nvarchar(400),
@iUserID int
AS
    INSERT INTO tblNews(sTitle,sDesc,sContent,sImage,tDate,iViews,bVerified,sTag,iUserID)
    VALUES(@sTitle,@sDesc,@sContent,@sImage,@tDate,@iViews,@bVerified,@sTag,@iUserID)
    SELECT @iNewsID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_GetByFK_iUserID]    Script Date: 12/28/2011 10:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:23 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNews_GetByFK_iUserID]
@iUserID int
AS
SELECT * FROM tblNews
WHERE iUserID=@iUserID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_GetByPK]    Script Date: 12/28/2011 10:39:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:23 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNews_GetByPK]
    @iNewsID int
AS
    SELECT * FROM tblNews
    WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_Delete]    Script Date: 12/28/2011 10:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:23 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNews_Delete]
    @iNewsID int
AS
DELETE FROM tblNews WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_Get]    Script Date: 12/28/2011 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:23 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNews_Get]
AS
SELECT * FROM tblNews
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNews_Update]    Script Date: 12/28/2011 10:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:23 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNews_Update] 
    
@iNewsID int Output,
@sTitle nvarchar(400),
@sDesc nvarchar(1000),
@sContent ntext,
@sImage nvarchar(400),
@tDate datetime,
@iViews int,
@bVerified bit,
@sTag nvarchar(400),
@iUserID int
AS
UPDATE tblNews
SET
    sTitle=@sTitle,sDesc=@sDesc,sContent=@sContent,sImage=@sImage,tDate=@tDate,iViews=@iViews,bVerified=@bVerified,sTag=@sTag,iUserID=@iUserID
WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_Insert]    Script Date: 12/28/2011 10:39:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_Insert]
    
@iNewsCategoryID int Output,
@iCategoryID int,
@iNewsID int
AS
    INSERT INTO tblNewsCategory(iCategoryID,iNewsID)
    VALUES(@iCategoryID,@iNewsID)
    SELECT @iNewsCategoryID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_Update]    Script Date: 12/28/2011 10:39:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_Update] 
    
@iNewsCategoryID int Output,
@iCategoryID int,
@iNewsID int
AS
UPDATE tblNewsCategory
SET
    iCategoryID=@iCategoryID,iNewsID=@iNewsID
WHERE iNewsCategoryID=@iNewsCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_GetByPK]    Script Date: 12/28/2011 10:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_GetByPK]
    @iNewsCategoryID int
AS
    SELECT * FROM tblNewsCategory
    WHERE iNewsCategoryID=@iNewsCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_GetByFK_iNewsID]    Script Date: 12/28/2011 10:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_GetByFK_iNewsID]
@iNewsID int
AS
SELECT * FROM tblNewsCategory
WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_GetByFK_iCategoryID]    Script Date: 12/28/2011 10:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_GetByFK_iCategoryID]
@iCategoryID int
AS
SELECT * FROM tblNewsCategory
WHERE iCategoryID=@iCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_Get]    Script Date: 12/28/2011 10:39:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_Get]
AS
SELECT * FROM tblNewsCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spNewsCategory_Delete]    Script Date: 12/28/2011 10:39:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:25 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spNewsCategory_Delete]
    @iNewsCategoryID int
AS
DELETE FROM tblNewsCategory WHERE iNewsCategoryID=@iNewsCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPoll_Update]    Script Date: 12/28/2011 10:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 6:14:04 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPoll_Update] 
    
@iPollID int Output,
@sQuestion nvarchar(1000),
@iOrder smallint,
@tDate datetime,
@bHomepage bit,
@iNewsID int
AS
UPDATE tblPoll
SET
    sQuestion=@sQuestion,iOrder=@iOrder,tDate=@tDate,bHomepage=@bHomepage,iNewsID=@iNewsID
WHERE iPollID=@iPollID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPoll_Insert]    Script Date: 12/28/2011 10:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 6:14:04 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPoll_Insert]
    
@iPollID int Output,
@sQuestion nvarchar(1000),
@iOrder smallint,
@tDate datetime,
@bHomepage bit,
@iNewsID int
AS
    INSERT INTO tblPoll(sQuestion,iOrder,tDate,bHomepage,iNewsID)
    VALUES(@sQuestion,@iOrder,@tDate,@bHomepage,@iNewsID)
    SELECT @iPollID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPoll_GetByPK]    Script Date: 12/28/2011 10:40:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 6:14:04 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPoll_GetByPK]
    @iPollID int
AS
    SELECT * FROM tblPoll
    WHERE iPollID=@iPollID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPoll_GetByFK_iNewsID]    Script Date: 12/28/2011 10:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 6:14:04 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPoll_GetByFK_iNewsID]
@iNewsID int
AS
SELECT * FROM tblPoll
WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPoll_Delete]    Script Date: 12/28/2011 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 6:14:04 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPoll_Delete]
    @iPollID int
AS
DELETE FROM tblPoll WHERE iPollID=@iPollID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPoll_Get]    Script Date: 12/28/2011 10:40:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 6:14:04 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPoll_Get]
AS
SELECT * FROM tblPoll
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCateFaq_Insert]    Script Date: 12/28/2011 10:35:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCateFaq_Insert]
    
@PK_iFaqCateID int Output,
@sCateName nvarchar(200),
@sDesc nvarchar(300)
AS
    INSERT INTO tblCateFaq(sCateName,sDesc)
    VALUES(@sCateName,@sDesc)
    SELECT @PK_iFaqCateID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCateFaq_Update]    Script Date: 12/28/2011 10:35:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCateFaq_Update] 
    
@PK_iFaqCateID int Output,
@sCateName nvarchar(200),
@sDesc nvarchar(300)
AS
UPDATE tblCateFaq
SET
    sCateName=@sCateName,sDesc=@sDesc
WHERE PK_iFaqCateID=@PK_iFaqCateID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCateFaq_Get]    Script Date: 12/28/2011 10:35:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCateFaq_Get]
AS
SELECT * FROM tblCateFaq
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCateFaq_Delete]    Script Date: 12/28/2011 10:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCateFaq_Delete]
    @PK_iFaqCateID int
AS
DELETE FROM tblCateFaq WHERE PK_iFaqCateID=@PK_iFaqCateID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCateFaq_GetByPK]    Script Date: 12/28/2011 10:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:49 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCateFaq_GetByPK]
    @PK_iFaqCateID int
AS
    SELECT * FROM tblCateFaq
    WHERE PK_iFaqCateID=@PK_iFaqCateID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollAnswer_Update]    Script Date: 12/28/2011 10:40:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:26 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollAnswer_Update] 
    
@iAnswerID int Output,
@sAnswer nvarchar(400),
@iCount int,
@iPollID int
AS
UPDATE tblPollAnswer
SET
    sAnswer=@sAnswer,iCount=@iCount,iPollID=@iPollID
WHERE iAnswerID=@iAnswerID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollAnswer_Insert]    Script Date: 12/28/2011 10:40:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:26 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollAnswer_Insert]
    
@iAnswerID int Output,
@sAnswer nvarchar(400),
@iCount int,
@iPollID int
AS
    INSERT INTO tblPollAnswer(sAnswer,iCount,iPollID)
    VALUES(@sAnswer,@iCount,@iPollID)
    SELECT @iAnswerID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollAnswer_GetByFK_iPollID]    Script Date: 12/28/2011 10:40:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:26 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollAnswer_GetByFK_iPollID]
@iPollID int
AS
SELECT * FROM tblPollAnswer
WHERE iPollID=@iPollID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollAnswer_Get]    Script Date: 12/28/2011 10:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:26 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollAnswer_Get]
AS
SELECT * FROM tblPollAnswer
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollAnswer_GetByPK]    Script Date: 12/28/2011 10:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:26 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollAnswer_GetByPK]
    @iAnswerID int
AS
    SELECT * FROM tblPollAnswer
    WHERE iAnswerID=@iAnswerID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollAnswer_Delete]    Script Date: 12/28/2011 10:40:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:26 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollAnswer_Delete]
    @iAnswerID int
AS
DELETE FROM tblPollAnswer WHERE iAnswerID=@iAnswerID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiayto_Update]    Script Date: 12/28/2011 10:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:08 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiayto_Update] 
    
@PK_iGiaytoID int Output,
@sTengiayto nvarchar(1000)
AS
UPDATE tblGiayto
SET
    sTengiayto=@sTengiayto
WHERE PK_iGiaytoID=@PK_iGiaytoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiayto_Insert]    Script Date: 12/28/2011 10:38:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:08 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiayto_Insert]
    
@PK_iGiaytoID int Output,
@sTengiayto nvarchar(1000)
AS
    INSERT INTO tblGiayto(sTengiayto)
    VALUES(@sTengiayto)
    SELECT @PK_iGiaytoID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiayto_Delete]    Script Date: 12/28/2011 10:38:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:08 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiayto_Delete]
    @PK_iGiaytoID int
AS
DELETE FROM tblGiayto WHERE PK_iGiaytoID=@PK_iGiaytoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiayto_Get]    Script Date: 12/28/2011 10:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:08 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiayto_Get]
AS
SELECT * FROM tblGiayto
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiayto_GetByPK]    Script Date: 12/28/2011 10:38:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:08 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiayto_GetByPK]
    @PK_iGiaytoID int
AS
    SELECT * FROM tblGiayto
    WHERE PK_iGiaytoID=@PK_iGiaytoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_GetByFK_iCategoryID]    Script Date: 12/28/2011 10:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_GetByFK_iCategoryID]
@iCategoryID int
AS
SELECT * FROM tblPollCategory
WHERE iCategoryID=@iCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_GetByFK_iPollID]    Script Date: 12/28/2011 10:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_GetByFK_iPollID]
@iPollID int
AS
SELECT * FROM tblPollCategory
WHERE iPollID=@iPollID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_Delete]    Script Date: 12/28/2011 10:40:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_Delete]
    @iPollCategoryID int
AS
DELETE FROM tblPollCategory WHERE iPollCategoryID=@iPollCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_Get]    Script Date: 12/28/2011 10:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_Get]
AS
SELECT * FROM tblPollCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_GetByPK]    Script Date: 12/28/2011 10:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_GetByPK]
    @iPollCategoryID int
AS
    SELECT * FROM tblPollCategory
    WHERE iPollCategoryID=@iPollCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_Insert]    Script Date: 12/28/2011 10:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_Insert]
    
@iPollCategoryID int Output,
@iPollID int,
@iCategoryID int
AS
    INSERT INTO tblPollCategory(iPollID,iCategoryID)
    VALUES(@iPollID,@iCategoryID)
    SELECT @iPollCategoryID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPollCategory_Update]    Script Date: 12/28/2011 10:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPollCategory_Update] 
    
@iPollCategoryID int Output,
@iPollID int,
@iCategoryID int
AS
UPDATE tblPollCategory
SET
    iPollID=@iPollID,iCategoryID=@iCategoryID
WHERE iPollCategoryID=@iPollCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPosition_Get]    Script Date: 12/28/2011 10:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:27 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPosition_Get]
AS
SELECT * FROM tblPosition
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPosition_Insert]    Script Date: 12/28/2011 10:40:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:27 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPosition_Insert]
    
@iPositionID int Output,
@sName nvarchar(400)
AS
    INSERT INTO tblPosition(sName)
    VALUES(@sName)
    SELECT @iPositionID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPosition_GetByPK]    Script Date: 12/28/2011 10:40:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:27 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPosition_GetByPK]
    @iPositionID int
AS
    SELECT * FROM tblPosition
    WHERE iPositionID=@iPositionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPosition_Delete]    Script Date: 12/28/2011 10:40:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:27 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPosition_Delete]
    @iPositionID int
AS
DELETE FROM tblPosition WHERE iPositionID=@iPositionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPosition_Update]    Script Date: 12/28/2011 10:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:27 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPosition_Update] 
    
@iPositionID int Output,
@sName nvarchar(400)
AS
UPDATE tblPosition
SET
    sName=@sName
WHERE iPositionID=@iPositionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_Get]    Script Date: 12/28/2011 10:38:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_Get]
AS
SELECT * FROM tblGiaytonopkemhoso
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_Delete]    Script Date: 12/28/2011 10:38:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_Delete]
    @PK_iGiaytoguikemID bigint
AS
DELETE FROM tblGiaytonopkemhoso WHERE PK_iGiaytoguikemID=@PK_iGiaytoguikemID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_GetByFK_FK_iGiaytoID]    Script Date: 12/28/2011 10:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_GetByFK_FK_iGiaytoID]
@FK_iGiaytoID int
AS
SELECT * FROM tblGiaytonopkemhoso
WHERE FK_iGiaytoID=@FK_iGiaytoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_GetByFK_PK_iHosodangkychungnhanID]    Script Date: 12/28/2011 10:38:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_GetByFK_PK_iHosodangkychungnhanID]
@PK_iHosodangkychungnhanID bigint
AS
SELECT * FROM tblGiaytonopkemhoso
WHERE PK_iHosodangkychungnhanID=@PK_iHosodangkychungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_GetByPK]    Script Date: 12/28/2011 10:38:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_GetByPK]
    @PK_iGiaytoguikemID bigint
AS
    SELECT * FROM tblGiaytonopkemhoso
    WHERE PK_iGiaytoguikemID=@PK_iGiaytoguikemID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_Insert]    Script Date: 12/28/2011 10:38:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_Insert]
    
@PK_iGiaytoguikemID bigint Output,
@FK_iGiaytoID int,
@bTrangthai bit,
@PK_iHosodangkychungnhanID bigint
AS
    INSERT INTO tblGiaytonopkemhoso(FK_iGiaytoID,bTrangthai,PK_iHosodangkychungnhanID)
    VALUES(@FK_iGiaytoID,@bTrangthai,@PK_iHosodangkychungnhanID)
    SELECT @PK_iGiaytoguikemID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGiaytonopkemhoso_Update]    Script Date: 12/28/2011 10:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:15 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGiaytonopkemhoso_Update] 
    
@PK_iGiaytoguikemID bigint Output,
@FK_iGiaytoID int,
@bTrangthai bit,
@PK_iHosodangkychungnhanID bigint
AS
UPDATE tblGiaytonopkemhoso
SET
    FK_iGiaytoID=@FK_iGiaytoID,bTrangthai=@bTrangthai,PK_iHosodangkychungnhanID=@PK_iHosodangkychungnhanID
WHERE PK_iGiaytoguikemID=@PK_iGiaytoguikemID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spRate_Get]    Script Date: 12/28/2011 10:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/23/2009 8:49:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spRate_Get]
AS
SELECT * FROM tblRate
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spRate_Delete]    Script Date: 12/28/2011 10:40:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/23/2009 8:49:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spRate_Delete]
    @iRateID int
AS
DELETE FROM tblRate WHERE iRateID=@iRateID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spRate_Update]    Script Date: 12/28/2011 10:40:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/23/2009 8:49:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spRate_Update] 
    
@iRateID int Output,
@iNewsID int,
@iRate int,
@iCount int
AS
UPDATE tblRate
SET
    iNewsID=@iNewsID,iRate=@iRate,iCount=@iCount
WHERE iRateID=@iRateID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spRate_GetByPK]    Script Date: 12/28/2011 10:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/23/2009 8:49:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spRate_GetByPK]
    @iRateID int
AS
    SELECT * FROM tblRate
    WHERE iRateID=@iRateID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spRate_GetByFK_iNewsID]    Script Date: 12/28/2011 10:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/23/2009 8:49:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spRate_GetByFK_iNewsID]
@iNewsID int
AS
SELECT * FROM tblRate
WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spRate_Insert]    Script Date: 12/28/2011 10:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/23/2009 8:49:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spRate_Insert]
    
@iRateID int Output,
@iNewsID int,
@iRate int,
@iCount int
AS
    INSERT INTO tblRate(iNewsID,iRate,iCount)
    VALUES(@iNewsID,@iRate,@iCount)
    SELECT @iRateID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHinhthucnuoi_Get]    Script Date: 12/28/2011 10:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:01 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHinhthucnuoi_Get]
AS
SELECT * FROM tblHinhthucnuoi
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHinhthucnuoi_Delete]    Script Date: 12/28/2011 10:39:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:01 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHinhthucnuoi_Delete]
    @PK_iHinhthucnuoiID int
AS
DELETE FROM tblHinhthucnuoi WHERE PK_iHinhthucnuoiID=@PK_iHinhthucnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHinhthucnuoi_GetByPK]    Script Date: 12/28/2011 10:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:01 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHinhthucnuoi_GetByPK]
    @PK_iHinhthucnuoiID int
AS
    SELECT * FROM tblHinhthucnuoi
    WHERE PK_iHinhthucnuoiID=@PK_iHinhthucnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHinhthucnuoi_Update]    Script Date: 12/28/2011 10:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:01 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHinhthucnuoi_Update] 
    
@PK_iHinhthucnuoiID int Output,
@sTenhinhthuc nvarchar(300)
AS
UPDATE tblHinhthucnuoi
SET
    sTenhinhthuc=@sTenhinhthuc
WHERE PK_iHinhthucnuoiID=@PK_iHinhthucnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHinhthucnuoi_Insert]    Script Date: 12/28/2011 10:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:01 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHinhthucnuoi_Insert]
    
@PK_iHinhthucnuoiID int Output,
@sTenhinhthuc nvarchar(300)
AS
    INSERT INTO tblHinhthucnuoi(sTenhinhthuc)
    VALUES(@sTenhinhthuc)
    SELECT @PK_iHinhthucnuoiID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_getAllInfoCross]    Script Date: 12/28/2011 10:36:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrong_getAllInfoCross]
	@FK_iQuanHuyenID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT     dbo.tblCosonuoitrong.sTencoso, dbo.tblCosonuoitrong.sAp, dbo.tblCosonuoitrong.sXa, dbo.tblCosonuoitrong.sMasocoso, dbo.tblCosonuoitrong.iSanluongdukien, dbo.tblCosonuoitrong.fTongdientich,
                      thanglongsport_VietGap.tblMasovietgap.dNgaycap, thanglongsport_VietGap.tblMasovietgap.dNgayhethan, dbo.tblDoituongnuoi.sTendoituong, 
                      thanglongsport_VietGap.tblTochucchungnhan.sTochucchungnhan, thanglongsport_VietGap.tblMasovietgap.sMaso, dbo.tblToado.Latitude, dbo.tblToado.Longitude, 
                      thanglongsport_VietGap.tblTochucchungnhan.FK_iQuanHuyenID, dbo.tblCosonuoitrong.sSodoaonuoi
FROM         dbo.tblCosonuoitrong INNER JOIN
                      dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
                      thanglongsport_VietGap.tblMasovietgap ON dbo.tblCosonuoitrong.PK_iCosonuoitrongID = thanglongsport_VietGap.tblMasovietgap.FK_iCosonuoitrongID INNER JOIN
                      thanglongsport_VietGap.tblTochucchungnhan ON 
                      thanglongsport_VietGap.tblMasovietgap.FK_iTochucchungnhanID = thanglongsport_VietGap.tblTochucchungnhan.PK_iTochucchungnhanID AND 
                      thanglongsport_VietGap.tblMasovietgap.FK_iTochucchungnhanID = thanglongsport_VietGap.tblTochucchungnhan.PK_iTochucchungnhanID INNER JOIN
                      dbo.tblToado ON dbo.tblCosonuoitrong.FK_iToadoID = dbo.tblToado.PK_iToadoID
    -- Insert statements for procedure here
	WHERE thanglongsport_VietGap.tblTochucchungnhan.FK_iQuanHuyenID=@FK_iQuanHuyenID
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToado_Insert]    Script Date: 12/28/2011 10:41:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:04/11/2011 4:04:10 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToado_Insert]
    
@PK_iToadoID int Output,
@Latitude nvarchar(100),
@Longitude nvarchar(100)
AS
    INSERT INTO tblToado(Latitude,Longitude)
    VALUES(@Latitude,@Longitude)
    SELECT @PK_iToadoID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToado_Get]    Script Date: 12/28/2011 10:41:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:04/11/2011 4:04:10 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToado_Get]
AS
SELECT * FROM tblToado
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToado_Update]    Script Date: 12/28/2011 10:41:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:04/11/2011 4:04:10 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToado_Update] 
    
@PK_iToadoID int Output,
@Latitude nvarchar(100),
@Longitude nvarchar(100)
AS
UPDATE tblToado
SET
    Latitude=@Latitude,Longitude=@Longitude
WHERE PK_iToadoID=@PK_iToadoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToado_GetByPK]    Script Date: 12/28/2011 10:41:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:04/11/2011 4:04:10 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToado_GetByPK]
    @PK_iToadoID int
AS
    SELECT * FROM tblToado
    WHERE PK_iToadoID=@PK_iToadoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spToado_Delete]    Script Date: 12/28/2011 10:41:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:04/11/2011 4:04:10 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spToado_Delete]
    @PK_iToadoID int
AS
DELETE FROM tblToado WHERE PK_iToadoID=@PK_iToadoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_thongketheoFK_FK_iQuanHuyenID]    Script Date: 12/28/2011 10:36:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrong_thongketheoFK_FK_iQuanHuyenID]
	-- Add the parameters for the stored procedure here
	(@FK_iQuanHuyenID int)
AS
BEGIN
	SELECT     COUNT(thanglongsport_VietGap.tblMasovietgap.sMaso) AS iSoho, thanglongsport_VietGap.tblTochucchungnhan.FK_iQuanHuyenID, 
                      SUM(dbo.tblCosonuoitrong.fTongdientich) AS fTongdientich, SUM(dbo.tblCosonuoitrong.fTongdientichmatnuoc) AS fTongdientichmatnuoc, 
                      SUM(dbo.tblCosonuoitrong.iSanluongdukien) AS iTongsanluongdukien
	FROM         dbo.tblCosonuoitrong INNER JOIN
						  dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
						  thanglongsport_VietGap.tblMasovietgap ON dbo.tblCosonuoitrong.PK_iCosonuoitrongID = thanglongsport_VietGap.tblMasovietgap.FK_iCosonuoitrongID INNER JOIN
						  thanglongsport_VietGap.tblTochucchungnhan ON 
						  thanglongsport_VietGap.tblMasovietgap.FK_iTochucchungnhanID = thanglongsport_VietGap.tblTochucchungnhan.PK_iTochucchungnhanID AND 
						  thanglongsport_VietGap.tblMasovietgap.FK_iTochucchungnhanID = thanglongsport_VietGap.tblTochucchungnhan.PK_iTochucchungnhanID INNER JOIN
						  dbo.tblToado ON dbo.tblCosonuoitrong.FK_iToadoID = dbo.tblToado.PK_iToadoID
	GROUP BY thanglongsport_VietGap.tblTochucchungnhan.FK_iQuanHuyenID
	HAVING      (thanglongsport_VietGap.tblTochucchungnhan.FK_iQuanHuyenID = @FK_iQuanHuyenID)
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iHinhthucnuoiID]    Script Date: 12/28/2011 10:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iHinhthucnuoiID]
@FK_iHinhthucnuoiID int
AS
SELECT * FROM tblCosonuoitrong
WHERE FK_iHinhthucnuoiID=@FK_iHinhthucnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iToadoID]    Script Date: 12/28/2011 10:36:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iToadoID]
@FK_iToadoID int
AS
SELECT * FROM tblCosonuoitrong
WHERE FK_iToadoID=@FK_iToadoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iDoituongnuoiID]    Script Date: 12/28/2011 10:36:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iDoituongnuoiID]
@FK_iDoituongnuoiID int
AS
SELECT * FROM tblCosonuoitrong
WHERE FK_iDoituongnuoiID=@FK_iDoituongnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iUserID]    Script Date: 12/28/2011 10:36:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iUserID]
@FK_iUserID bigint
AS
SELECT * FROM tblCosonuoitrong
WHERE FK_iUserID=@FK_iUserID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_GetByPK]    Script Date: 12/28/2011 10:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_GetByPK]
    @PK_iCosonuoitrongID bigint
AS
    SELECT * FROM tblCosonuoitrong
    WHERE PK_iCosonuoitrongID=@PK_iCosonuoitrongID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iQuanHuyenID]    Script Date: 12/28/2011 10:36:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_GetByFK_FK_iQuanHuyenID]
@FK_iQuanHuyenID bigint
AS
SELECT * FROM tblCosonuoitrong
WHERE FK_iQuanHuyenID=@FK_iQuanHuyenID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_Get]    Script Date: 12/28/2011 10:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_Get]
AS
SELECT * FROM tblCosonuoitrong
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_Delete]    Script Date: 12/28/2011 10:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_Delete]
    @PK_iCosonuoitrongID bigint
AS
DELETE FROM tblCosonuoitrong WHERE PK_iCosonuoitrongID=@PK_iCosonuoitrongID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoiThongkeDulieuTrungbinhTheoDoituongnuoi]    Script Date: 12/28/2011 10:36:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoiThongkeDulieuTrungbinhTheoDoituongnuoi]
	-- Add the parameters for the stored procedure here
(
	@FK_iDoituongnuoiID int
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     COUNT(dbo.tblCosonuoitrong.PK_iCosonuoitrongID) AS Expr1, AVG(dbo.tblCosonuoitrong.fTongdientich) AS Expr2, AVG(dbo.tblCosonuoitrong.fTongdientichmatnuoc) 
                      AS Expr3, AVG(dbo.tblCosonuoitrong.iSanluongdukien) AS Expr4, AVG(dbo.tblCosonuoitrong.fDientichAolang) AS Expr5, dbo.tblDoituongnuoi.sTendoituong, 
                      dbo.tblDoituongnuoi.PK_iDoituongnuoiID, dbo.tblCosonuoitrong.bDuyet
	FROM         dbo.tblCosonuoitrong INNER JOIN
						  dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID
	GROUP BY dbo.tblDoituongnuoi.sTendoituong, dbo.tblDoituongnuoi.PK_iDoituongnuoiID, dbo.tblCosonuoitrong.bDuyet
	HAVING      (dbo.tblDoituongnuoi.PK_iDoituongnuoiID = 1) AND (dbo.tblCosonuoitrong.bDuyet = 1)
	END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_GetAllInforByID]    Script Date: 12/28/2011 10:39:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spMasovietgap_GetAllInforByID]
	-- Add the parameters for the stored procedure here
	(@PK_iMasovietgapID bigint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT       dbo.tblCosonuoitrong.sTencoso,dbo.tblCosonuoitrong.PK_iCosonuoitrongID,tblCosonuoitrong.iSanluongdukien, dbo.tblCosonuoitrong.sAp, 
	dbo.tblCosonuoitrong.sXa, dbo.tblCosonuoitrong.sMasocoso, 
                         tblMasovietgap.dNgaycap, tblMasovietgap.dNgayhethan, dbo.tblDoituongnuoi.sTendoituong,
                         tblTochucchungnhan.PK_iTochucchungnhanID, tblTochucchungnhan.sTochucchungnhan, tblMasovietgap.sMaso,
					tblCosonuoitrong.fTongdientich, tblCosonuoitrong.fTongdientichmatnuoc
	FROM            dbo.tblCosonuoitrong INNER JOIN
                         dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
                         tblMasovietgap ON dbo.tblCosonuoitrong.PK_iCosonuoitrongID = tblMasovietgap.FK_iCosonuoitrongID INNER JOIN
                         tblTochucchungnhan ON tblMasovietgap.FK_iTochucchungnhanID = tblTochucchungnhan.PK_iTochucchungnhanID AND 
                         tblMasovietgap.FK_iTochucchungnhanID = tblTochucchungnhan.PK_iTochucchungnhanID
	WHERE tblMasovietgap.PK_iMasoVietGapID = @PK_iMasovietgapID
    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_Update]    Script Date: 12/28/2011 10:36:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_Update] 
    
@PK_iCosonuoitrongID bigint Output,
@sMaso_vietgap nvarchar(100),
@sTencoso nvarchar(100),
@sTenchucoso nvarchar(100),
@sAp nvarchar(300),
@sXa nvarchar(300),
@FK_iQuanHuyenID bigint,
@sDienthoai varchar(20),
@fTongdientich float,
@fTongdientichmatnuoc float,
@FK_iToadoID int,
@sSodoaonuoi nvarchar(200),
@FK_iDoituongnuoiID int,
@iNamsanxuat int,
@iChukynuoi int,
@dNgaydangky datetime,
@bDuyet bit,
@FK_iUserID bigint,
@sMasocoso nvarchar(100),
@iSanluongdukien int,
@fDientichAolang float,
@FK_iHinhthucnuoiID int
AS
UPDATE tblCosonuoitrong
SET
    sMaso_vietgap=@sMaso_vietgap,sTencoso=@sTencoso,sTenchucoso=@sTenchucoso,sAp=@sAp,sXa=@sXa,FK_iQuanHuyenID=@FK_iQuanHuyenID,sDienthoai=@sDienthoai,fTongdientich=@fTongdientich,fTongdientichmatnuoc=@fTongdientichmatnuoc,FK_iToadoID=@FK_iToadoID,sSodoaonuoi=@sSodoaonuoi,FK_iDoituongnuoiID=@FK_iDoituongnuoiID,iNamsanxuat=@iNamsanxuat,iChukynuoi=@iChukynuoi,dNgaydangky=@dNgaydangky,bDuyet=@bDuyet,FK_iUserID=@FK_iUserID,sMasocoso=@sMasocoso,iSanluongdukien=@iSanluongdukien,fDientichAolang=@fDientichAolang,FK_iHinhthucnuoiID=@FK_iHinhthucnuoiID
WHERE PK_iCosonuoitrongID=@PK_iCosonuoitrongID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_Insert]    Script Date: 12/28/2011 10:36:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 11:52:08 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCosonuoitrong_Insert]
    
@PK_iCosonuoitrongID bigint Output,
@sMaso_vietgap nvarchar(100),
@sTencoso nvarchar(100),
@sTenchucoso nvarchar(100),
@sAp nvarchar(300),
@sXa nvarchar(300),
@FK_iQuanHuyenID bigint,
@sDienthoai varchar(20),
@fTongdientich float,
@fTongdientichmatnuoc float,
@FK_iToadoID int,
@sSodoaonuoi nvarchar(200),
@FK_iDoituongnuoiID int,
@iNamsanxuat int,
@iChukynuoi int,
@dNgaydangky datetime,
@bDuyet bit,
@FK_iUserID bigint,
@sMasocoso nvarchar(100),
@iSanluongdukien int,
@fDientichAolang float,
@FK_iHinhthucnuoiID int
AS
    INSERT INTO tblCosonuoitrong(sMaso_vietgap,sTencoso,sTenchucoso,sAp,sXa,FK_iQuanHuyenID,sDienthoai,fTongdientich,fTongdientichmatnuoc,FK_iToadoID,sSodoaonuoi,FK_iDoituongnuoiID,iNamsanxuat,iChukynuoi,dNgaydangky,bDuyet,FK_iUserID,sMasocoso,iSanluongdukien,fDientichAolang,FK_iHinhthucnuoiID)
    VALUES(@sMaso_vietgap,@sTencoso,@sTenchucoso,@sAp,@sXa,@FK_iQuanHuyenID,@sDienthoai,@fTongdientich,@fTongdientichmatnuoc,@FK_iToadoID,@sSodoaonuoi,@FK_iDoituongnuoiID,@iNamsanxuat,@iChukynuoi,@dNgaydangky,@bDuyet,@FK_iUserID,@sMasocoso,@iSanluongdukien,@fDientichAolang,@FK_iHinhthucnuoiID)
    SELECT @PK_iCosonuoitrongID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblCoconuoitrong_GetAllByUserID]    Script Date: 12/28/2011 10:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblCoconuoitrong_GetAllByUserID]
	@FK_iUserID int
as
begin
	select * FROM dbo.tblCosonuoitrong WHERE FK_iUserID = @FK_iUserID
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_getThongtinTonghoptheoDoituongnuoiByISO3166]    Script Date: 12/28/2011 10:36:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrong_getThongtinTonghoptheoDoituongnuoiByISO3166]
(
	@sISO31662 nvarchar(10)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT     COUNT(dbo.tblCosonuoitrong.PK_iCosonuoitrongID) AS iSoho, SUM(dbo.tblCosonuoitrong.fTongdientich) AS fTongdientich, SUM(dbo.tblCosonuoitrong.fTongdientichmatnuoc) 
						  AS fTongdientichmatnuoic, SUM(dbo.tblCosonuoitrong.iSanluongdukien) AS iSanluongdukien, SUM(dbo.tblCosonuoitrong.fDientichAolang) AS fTongdientichAolang, dbo.tblDoituongnuoi.sTendoituong, 
						  dbo.tblTinh.ISO31662
	FROM         dbo.tblCosonuoitrong INNER JOIN
						  dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
						  thanglongsport_VietGap.tblQuanHuyen ON dbo.tblCosonuoitrong.FK_iQuanHuyenID = thanglongsport_VietGap.tblQuanHuyen.PK_iQuanHuyenID INNER JOIN
						  dbo.tblTinh ON thanglongsport_VietGap.tblQuanHuyen.FK_iTinhThanhID = dbo.tblTinh.PK_iTinhID AND 
						  thanglongsport_VietGap.tblQuanHuyen.FK_iTinhThanhID = dbo.tblTinh.PK_iTinhID
	GROUP BY dbo.tblDoituongnuoi.sTendoituong, dbo.tblTinh.ISO31662
	HAVING      (dbo.tblTinh.ISO31662 = @sISO31662)
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Insert]    Script Date: 12/28/2011 10:39:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Insert]
    
@PK_iHosokemtheoID bigint Output,
@FK_iGiaytoID int,
@FK_iDangkyChungnhanVietGapID int
AS
    INSERT INTO tblHosokemtheoTochucchungnhan(FK_iGiaytoID,FK_iDangkyChungnhanVietGapID)
    VALUES(@FK_iGiaytoID,@FK_iDangkyChungnhanVietGapID)
    SELECT @PK_iHosokemtheoID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Get]    Script Date: 12/28/2011 10:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Get]
AS
SELECT * FROM tblHosokemtheoTochucchungnhan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Update]    Script Date: 12/28/2011 10:39:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Update] 
    
@PK_iHosokemtheoID bigint Output,
@FK_iGiaytoID int,
@FK_iDangkyChungnhanVietGapID int
AS
UPDATE tblHosokemtheoTochucchungnhan
SET
    FK_iGiaytoID=@FK_iGiaytoID,FK_iDangkyChungnhanVietGapID=@FK_iDangkyChungnhanVietGapID
WHERE PK_iHosokemtheoID=@PK_iHosokemtheoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_GetByPK]    Script Date: 12/28/2011 10:39:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_GetByPK]
    @PK_iHosokemtheoID bigint
AS
    SELECT * FROM tblHosokemtheoTochucchungnhan
    WHERE PK_iHosokemtheoID=@PK_iHosokemtheoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Delete]    Script Date: 12/28/2011 10:39:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_Delete]
    @PK_iHosokemtheoID bigint
AS
DELETE FROM tblHosokemtheoTochucchungnhan WHERE PK_iHosokemtheoID=@PK_iHosokemtheoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_GetByFK_FK_iDangkyChungnhanVietGapID]    Script Date: 12/28/2011 10:39:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_GetByFK_FK_iDangkyChungnhanVietGapID]
@FK_iDangkyChungnhanVietGapID int
AS
SELECT * FROM tblHosokemtheoTochucchungnhan
WHERE FK_iDangkyChungnhanVietGapID=@FK_iDangkyChungnhanVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_GetByFK_FK_iGiaytoID]    Script Date: 12/28/2011 10:39:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:51:58 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosokemtheoTochucchungnhan_GetByFK_FK_iGiaytoID]
@FK_iGiaytoID int
AS
SELECT * FROM tblHosokemtheoTochucchungnhan
WHERE FK_iGiaytoID=@FK_iGiaytoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhongBan_Insert]    Script Date: 12/28/2011 10:40:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:24 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhongBan_Insert]
    
@PK_iPhongBanID bigint Output,
@sTenPhong nvarchar(200),
@sDienThoai nvarchar(100),
@sFax nvarchar(100)
AS
    INSERT INTO tblPhongBan(sTenPhong,sDienThoai,sFax)
    VALUES(@sTenPhong,@sDienThoai,@sFax)
    SELECT @PK_iPhongBanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhongBan_Get]    Script Date: 12/28/2011 10:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:24 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhongBan_Get]
AS
SELECT * FROM tblPhongBan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhongBan_Update]    Script Date: 12/28/2011 10:40:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:24 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhongBan_Update] 
    
@PK_iPhongBanID bigint Output,
@sTenPhong nvarchar(200),
@sDienThoai nvarchar(100),
@sFax nvarchar(100)
AS
UPDATE tblPhongBan
SET
    sTenPhong=@sTenPhong,sDienThoai=@sDienThoai,sFax=@sFax
WHERE PK_iPhongBanID=@PK_iPhongBanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhongBan_Delete]    Script Date: 12/28/2011 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:24 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhongBan_Delete]
    @PK_iPhongBanID bigint
AS
DELETE FROM tblPhongBan WHERE PK_iPhongBanID=@PK_iPhongBanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhongBan_GetByPK]    Script Date: 12/28/2011 10:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:24 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhongBan_GetByPK]
    @PK_iPhongBanID bigint
AS
    SELECT * FROM tblPhongBan
    WHERE PK_iPhongBanID=@PK_iPhongBanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCounter_getPerday]    Script Date: 12/28/2011 10:36:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCounter_getPerday]
	-- Add the parameters for the stored procedure here
	(
	@tDate1 datetime,
	@tDate2 datetime
)
AS
BEGIN
	SELECT DISTINCT CONVERT(varchar, tDate, 111) AS thedate, COUNT(*) AS perday
	FROM         thanglongsport_VietGap.tblCounter
	GROUP BY CONVERT(varchar, tDate, 111)
	HAVING      (CONVERT(varchar, tDate, 111) >=CONVERT(varchar, @tDate1, 111)) 
	AND (CONVERT(varchar, tDate, 111) <= CONVERT(varchar, @tDate2, 111))
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCounter_GetByPK]    Script Date: 12/28/2011 10:36:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:28/10/2011 4:31:09 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCounter_GetByPK]
    @PK_iCounterID bigint
AS
    SELECT * FROM tblCounter
    WHERE PK_iCounterID=@PK_iCounterID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCounter_Get]    Script Date: 12/28/2011 10:36:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:28/10/2011 4:31:09 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCounter_Get]
AS
SELECT * FROM tblCounter
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCounter_Delete]    Script Date: 12/28/2011 10:36:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:28/10/2011 4:31:09 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCounter_Delete]
    @PK_iCounterID bigint
AS
DELETE FROM tblCounter WHERE PK_iCounterID=@PK_iCounterID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCounter_Insert]    Script Date: 12/28/2011 10:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:28/10/2011 4:31:09 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCounter_Insert]
    
@PK_iCounterID bigint Output,
@sIP nvarchar(100),
@tDate datetime
AS
    INSERT INTO tblCounter(sIP,tDate)
    VALUES(@sIP,@tDate)
    SELECT @PK_iCounterID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCounter_Update]    Script Date: 12/28/2011 10:37:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:28/10/2011 4:31:09 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spCounter_Update] 
    
@PK_iCounterID bigint Output,
@sIP nvarchar(100),
@tDate datetime
AS
UPDATE tblCounter
SET
    sIP=@sIP,tDate=@tDate
WHERE PK_iCounterID=@PK_iCounterID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChucVu_GetByPK]    Script Date: 12/28/2011 10:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:34 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChucVu_GetByPK]
    @PK_iChucVuID bigint
AS
    SELECT * FROM tblChucVu
    WHERE PK_iChucVuID=@PK_iChucVuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChucVu_Get]    Script Date: 12/28/2011 10:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:34 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChucVu_Get]
AS
SELECT * FROM tblChucVu
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChucVu_Delete]    Script Date: 12/28/2011 10:36:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:34 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChucVu_Delete]
    @PK_iChucVuID bigint
AS
DELETE FROM tblChucVu WHERE PK_iChucVuID=@PK_iChucVuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChucVu_Insert]    Script Date: 12/28/2011 10:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:34 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChucVu_Insert]
    
@PK_iChucVuID bigint Output,
@sTenChucVu nvarchar(400),
@sCongviecphutrach nvarchar(500)
AS
    INSERT INTO tblChucVu(sTenChucVu,sCongviecphutrach)
    VALUES(@sTenChucVu,@sCongviecphutrach)
    SELECT @PK_iChucVuID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChucVu_Update]    Script Date: 12/28/2011 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:34 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChucVu_Update] 
    
@PK_iChucVuID bigint Output,
@sTenChucVu nvarchar(400),
@sCongviecphutrach nvarchar(500)
AS
UPDATE tblChucVu
SET
    sTenChucVu=@sTenChucVu,sCongviecphutrach=@sCongviecphutrach
WHERE PK_iChucVuID=@PK_iChucVuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUContact_Insert]    Script Date: 12/28/2011 10:41:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUContact_Insert]
    
@PK_iUContactID bigint Output,
@FK_iContactID bigint,
@sEmail nvarchar(400),
@sTitle nvarchar(1000),
@sContent ntext,
@tDate datetime
AS
    INSERT INTO tblUContact(FK_iContactID,sEmail,sTitle,sContent,tDate)
    VALUES(@FK_iContactID,@sEmail,@sTitle,@sContent,@tDate)
    SELECT @PK_iUContactID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUContact_Update]    Script Date: 12/28/2011 10:41:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUContact_Update] 
    
@PK_iUContactID bigint Output,
@FK_iContactID bigint,
@sEmail nvarchar(400),
@sTitle nvarchar(1000),
@sContent ntext,
@tDate datetime
AS
UPDATE tblUContact
SET
    FK_iContactID=@FK_iContactID,sEmail=@sEmail,sTitle=@sTitle,sContent=@sContent,tDate=@tDate
WHERE PK_iUContactID=@PK_iUContactID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUContact_Get]    Script Date: 12/28/2011 10:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUContact_Get]
AS
SELECT * FROM tblUContact
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUContact_Delete]    Script Date: 12/28/2011 10:41:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUContact_Delete]
    @PK_iUContactID bigint
AS
DELETE FROM tblUContact WHERE PK_iUContactID=@PK_iUContactID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spUContact_GetByPK]    Script Date: 12/28/2011 10:41:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 4:41:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spUContact_GetByPK]
    @PK_iUContactID bigint
AS
    SELECT * FROM tblUContact
    WHERE PK_iUContactID=@PK_iUContactID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_GetByFK_FK_iChitieuID]    Script Date: 12/28/2011 10:37:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_GetByFK_FK_iChitieuID]
@FK_iChitieuID int
AS
SELECT * FROM tblDanhgiaketqua
WHERE FK_iChitieuID=@FK_iChitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_GetByPK]    Script Date: 12/28/2011 10:37:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_GetByPK]
    @PK_iDanhgiaketquaID int
AS
    SELECT * FROM tblDanhgiaketqua
    WHERE PK_iDanhgiaketquaID=@PK_iDanhgiaketquaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_GetByFK_FK_iPhuongphapkiemtraID]    Script Date: 12/28/2011 10:37:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_GetByFK_FK_iPhuongphapkiemtraID]
@FK_iPhuongphapkiemtraID int
AS
SELECT * FROM tblDanhgiaketqua
WHERE FK_iPhuongphapkiemtraID=@FK_iPhuongphapkiemtraID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_GetByFK_FK_iCosonuoiID]    Script Date: 12/28/2011 10:37:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_GetByFK_FK_iCosonuoiID]
@FK_iCosonuoiID bigint
AS
SELECT * FROM tblDanhgiaketqua
WHERE FK_iCosonuoiID=@FK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_Get]    Script Date: 12/28/2011 10:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_Get]
AS
SELECT * FROM tblDanhgiaketqua
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_Delete]    Script Date: 12/28/2011 10:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_Delete]
    @PK_iDanhgiaketquaID int
AS
DELETE FROM tblDanhgiaketqua WHERE PK_iDanhgiaketquaID=@PK_iDanhgiaketquaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_Update]    Script Date: 12/28/2011 10:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_Update] 
    
@PK_iDanhgiaketquaID int Output,
@FK_iChitieuID int,
@FK_iPhuongphapkiemtraID int,
@FK_iCosonuoiID bigint,
@iKetqua smallint
AS
UPDATE tblDanhgiaketqua
SET
    FK_iChitieuID=@FK_iChitieuID,FK_iPhuongphapkiemtraID=@FK_iPhuongphapkiemtraID,FK_iCosonuoiID=@FK_iCosonuoiID,iKetqua=@iKetqua
WHERE PK_iDanhgiaketquaID=@PK_iDanhgiaketquaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiaketqua_Insert]    Script Date: 12/28/2011 10:37:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:26:52 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiaketqua_Insert]
    
@PK_iDanhgiaketquaID int Output,
@FK_iChitieuID int,
@FK_iPhuongphapkiemtraID int,
@FK_iCosonuoiID bigint,
@iKetqua smallint
AS
    INSERT INTO tblDanhgiaketqua(FK_iChitieuID,FK_iPhuongphapkiemtraID,FK_iCosonuoiID,iKetqua)
    VALUES(@FK_iChitieuID,@FK_iPhuongphapkiemtraID,@FK_iCosonuoiID,@iKetqua)
    SELECT @PK_iDanhgiaketquaID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByFK_FK_iCosonuoiID]    Script Date: 12/28/2011 10:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByFK_FK_iCosonuoiID]
@FK_iCosonuoiID bigint
AS
SELECT * FROM tbDanhgiaketqua
WHERE FK_iCosonuoiID=@FK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByFK_FK_iChitieuID]    Script Date: 12/28/2011 10:40:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByFK_FK_iChitieuID]
@FK_iChitieuID int
AS
SELECT * FROM tbDanhgiaketqua
WHERE FK_iChitieuID=@FK_iChitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByFK_FK_iPhuongphapkiemtraID]    Script Date: 12/28/2011 10:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByFK_FK_iPhuongphapkiemtraID]
@FK_iPhuongphapkiemtraID int
AS
SELECT * FROM tbDanhgiaketqua
WHERE FK_iPhuongphapkiemtraID=@FK_iPhuongphapkiemtraID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_Insert]    Script Date: 12/28/2011 10:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_Insert]
    
@PK_iDanhgiaketquaID int Output,
@FK_iChitieuID int,
@FK_iPhuongphapkiemtraID int,
@FK_iCosonuoiID bigint,
@iKetqua smallint
AS
    INSERT INTO tbDanhgiaketqua(FK_iChitieuID,FK_iPhuongphapkiemtraID,FK_iCosonuoiID,iKetqua)
    VALUES(@FK_iChitieuID,@FK_iPhuongphapkiemtraID,@FK_iCosonuoiID,@iKetqua)
    SELECT @PK_iDanhgiaketquaID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_Get]    Script Date: 12/28/2011 10:40:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_Get]
AS
SELECT * FROM tbDanhgiaketqua
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_Update]    Script Date: 12/28/2011 10:40:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_Update] 
    
@PK_iDanhgiaketquaID int Output,
@FK_iChitieuID int,
@FK_iPhuongphapkiemtraID int,
@FK_iCosonuoiID bigint,
@iKetqua smallint
AS
UPDATE tbDanhgiaketqua
SET
    FK_iChitieuID=@FK_iChitieuID,FK_iPhuongphapkiemtraID=@FK_iPhuongphapkiemtraID,FK_iCosonuoiID=@FK_iCosonuoiID,iKetqua=@iKetqua
WHERE PK_iDanhgiaketquaID=@PK_iDanhgiaketquaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByPK]    Script Date: 12/28/2011 10:40:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_GetByPK]
    @PK_iDanhgiaketquaID int
AS
    SELECT * FROM tbDanhgiaketqua
    WHERE PK_iDanhgiaketquaID=@PK_iDanhgiaketquaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sptbDanhgiaketqua_Delete]    Script Date: 12/28/2011 10:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 10:24:14 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[sptbDanhgiaketqua_Delete]
    @PK_iDanhgiaketquaID int
AS
DELETE FROM tbDanhgiaketqua WHERE PK_iDanhgiaketquaID=@PK_iDanhgiaketquaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblDanhgiaketqua_GetOneByCosoAndChitieu]    Script Date: 12/28/2011 10:35:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblDanhgiaketqua_GetOneByCosoAndChitieu]
	@FK_iCosonuoitrongID int, @FK_iChitieuID int
as
begin
	select * FROM tblDanhgiaketqua
	WHERE FK_iCosonuoiID = @FK_iCosonuoitrongID AND FK_iChitieuID = @FK_iChitieuID
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblDanhgiaketqua_CheckAvaiableByFK_Csnt]    Script Date: 12/28/2011 10:35:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblDanhgiaketqua_CheckAvaiableByFK_Csnt]
	@FK_iCosonuoitrongID int
as
begin
	select top 1 * FROM tblDanhgiaketqua WHERE FK_iCosonuoiID = @FK_iCosonuoitrongID
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblDanhgiaketqua_DellByCosonuoitrong]    Script Date: 12/28/2011 10:35:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblDanhgiaketqua_DellByCosonuoitrong]
	@FK_iCosonuoitrongID int
as
begin
	delete FROM tblDanhgiaketqua WHERE FK_iCosonuoiID = @FK_iCosonuoitrongID
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblDanhgiaketqua_CountTrue]    Script Date: 12/28/2011 10:35:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblDanhgiaketqua_CountTrue]
	@FK_iCosonuoitrongID int
as
begin
	select *
	FROM tblDanhgiaketqua 
	WHERE FK_iCosonuoiID = @FK_iCosonuoitrongID AND iKetqua = 1
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDichvu_GetByPK]    Script Date: 12/28/2011 10:37:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 10:39:12 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDichvu_GetByPK]
    @PK_iDichvuID int
AS
    SELECT * FROM tblDichvu
    WHERE PK_iDichvuID=@PK_iDichvuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDichvu_Delete]    Script Date: 12/28/2011 10:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 10:39:12 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDichvu_Delete]
    @PK_iDichvuID int
AS
DELETE FROM tblDichvu WHERE PK_iDichvuID=@PK_iDichvuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDichvu_Insert]    Script Date: 12/28/2011 10:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 10:39:12 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDichvu_Insert]
    
@PK_iDichvuID int Output,
@sTendichvu nvarchar(500),
@sNoidung ntext,
@iCategoryID int,
@iTrangthai smallint
AS
    INSERT INTO tblDichvu(sTendichvu,sNoidung,iCategoryID,iTrangthai)
    VALUES(@sTendichvu,@sNoidung,@iCategoryID,@iTrangthai)
    SELECT @PK_iDichvuID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDichvu_Update]    Script Date: 12/28/2011 10:37:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 10:39:12 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDichvu_Update] 
    
@PK_iDichvuID int Output,
@sTendichvu nvarchar(500),
@sNoidung ntext,
@iCategoryID int,
@iTrangthai smallint
AS
UPDATE tblDichvu
SET
    sTendichvu=@sTendichvu,sNoidung=@sNoidung,iCategoryID=@iCategoryID,iTrangthai=@iTrangthai
WHERE PK_iDichvuID=@PK_iDichvuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDichvu_Get]    Script Date: 12/28/2011 10:37:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 10:39:12 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDichvu_Get]
AS
SELECT * FROM tblDichvu
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_tblHosokemtheoTochucchungnhan_GetAllByUserID]    Script Date: 12/28/2011 10:35:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_tblHosokemtheoTochucchungnhan_GetAllByUserID]
	@PK_iUserID int
as
begin
	select * FROM tblHosokemtheoTochucchungnhan 
	WHERE FK_iDangkyChungnhanVietGapID IN(SELECT PK_iDangkyChungnhanVietGapID as FK_iDangkyChungnhanVietGapID FROM tblDangkyHoatdongchungnhan 
	WHERE FK_iTochucchungnhanID IN(SELECT PK_iTochucchungnhanID as FK_iTochucchungnhanID FROM tblTochucchungnhan
	WHERE FK_iUserID = @PK_iUserID))
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Get]    Script Date: 12/28/2011 10:37:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:28:48 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Get]
AS
SELECT * FROM tblDangkyHoatdongchungnhan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_GetByFK_FK_iTochucchungnhanID]    Script Date: 12/28/2011 10:37:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:28:48 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_GetByFK_FK_iTochucchungnhanID]
@FK_iTochucchungnhanID int
AS
SELECT * FROM tblDangkyHoatdongchungnhan
WHERE FK_iTochucchungnhanID=@FK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_GetByPK]    Script Date: 12/28/2011 10:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:28:48 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_GetByPK]
    @PK_iDangkyChungnhanVietGapID int
AS
    SELECT * FROM tblDangkyHoatdongchungnhan
    WHERE PK_iDangkyChungnhanVietGapID=@PK_iDangkyChungnhanVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Delete]    Script Date: 12/28/2011 10:37:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:28:48 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Delete]
    @PK_iDangkyChungnhanVietGapID int
AS
DELETE FROM tblDangkyHoatdongchungnhan WHERE PK_iDangkyChungnhanVietGapID=@PK_iDangkyChungnhanVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Update]    Script Date: 12/28/2011 10:37:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:28:48 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Update] 
    
@PK_iDangkyChungnhanVietGapID int Output,
@FK_iTochucchungnhanID int,
@iTrangthaidangky smallint
AS
UPDATE tblDangkyHoatdongchungnhan
SET
    FK_iTochucchungnhanID=@FK_iTochucchungnhanID,iTrangthaidangky=@iTrangthaidangky
WHERE PK_iDangkyChungnhanVietGapID=@PK_iDangkyChungnhanVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Insert]    Script Date: 12/28/2011 10:37:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:28:48 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDangkyHoatdongchungnhan_Insert]
    
@PK_iDangkyChungnhanVietGapID int Output,
@FK_iTochucchungnhanID int,
@iTrangthaidangky smallint
AS
    INSERT INTO tblDangkyHoatdongchungnhan(FK_iTochucchungnhanID,iTrangthaidangky)
    VALUES(@FK_iTochucchungnhanID,@iTrangthaidangky)
    SELECT @PK_iDangkyChungnhanVietGapID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spContact_Insert]    Script Date: 12/28/2011 10:36:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 8:50:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spContact_Insert]
    
@PK_iContactID bigint Output,
@FK_iPhongBanID bigint,
@FK_iChucVuID bigint,
@sHoTen nvarchar(400),
@sDienThoai nvarchar(100),
@sEmail nvarchar(400)
AS
    INSERT INTO tblContact(FK_iPhongBanID,FK_iChucVuID,sHoTen,sDienThoai,sEmail)
    VALUES(@FK_iPhongBanID,@FK_iChucVuID,@sHoTen,@sDienThoai,@sEmail)
    SELECT @PK_iContactID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spContact_Update]    Script Date: 12/28/2011 10:36:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 8:50:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spContact_Update] 
    
@PK_iContactID bigint Output,
@FK_iPhongBanID bigint,
@FK_iChucVuID bigint,
@sHoTen nvarchar(400),
@sDienThoai nvarchar(100),
@sEmail nvarchar(400)
AS
UPDATE tblContact
SET
    FK_iPhongBanID=@FK_iPhongBanID,FK_iChucVuID=@FK_iChucVuID,sHoTen=@sHoTen,sDienThoai=@sDienThoai,sEmail=@sEmail
WHERE PK_iContactID=@PK_iContactID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spContact_Get]    Script Date: 12/28/2011 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 8:50:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spContact_Get]
AS
SELECT * FROM tblContact
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spContact_Delete]    Script Date: 12/28/2011 10:36:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 8:50:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spContact_Delete]
    @PK_iContactID bigint
AS
DELETE FROM tblContact WHERE PK_iContactID=@PK_iContactID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spContact_GetByPK]    Script Date: 12/28/2011 10:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/2/2011 8:50:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spContact_GetByPK]
    @PK_iContactID bigint
AS
    SELECT * FROM tblContact
    WHERE PK_iContactID=@PK_iContactID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_tongHopthongtinTheoTinh]    Script Date: 12/28/2011 10:36:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrong_tongHopthongtinTheoTinh]
(
	@FK_iTinhID int=0
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF(@FK_iTinhID>0)
    -- Insert statements for procedure here
	SELECT     dbo.tblTinh.ISO31662, dbo.tblTinh.sTentinh, COUNT(dbo.tblCosonuoitrong.PK_iCosonuoitrongID) AS iSohonuoitrong, dbo.tblTinh.PK_iTinhID,
                      SUM(dbo.tblCosonuoitrong.fTongdientich) AS fTongdientich, SUM(dbo.tblCosonuoitrong.fTongdientichmatnuoc) AS fTongdientichmatnuoc, SUM(dbo.tblCosonuoitrong.iSanluongdukien) 
                      AS iTongsanluongdukien
	FROM         dbo.tblCosonuoitrong INNER JOIN
						  thanglongsport_VietGap.tblQuanHuyen ON dbo.tblCosonuoitrong.FK_iQuanHuyenID = thanglongsport_VietGap.tblQuanHuyen.PK_iQuanHuyenID INNER JOIN
						  dbo.tblTinh ON thanglongsport_VietGap.tblQuanHuyen.FK_iTinhThanhID = dbo.tblTinh.PK_iTinhID
	GROUP BY dbo.tblTinh.PK_iTinhID, dbo.tblTinh.sTentinh, dbo.tblTinh.ISO31662
	HAVING      (dbo.tblTinh.PK_iTinhID = @FK_iTinhID)
	
	ELSE
	SELECT    dbo.tblTinh.ISO31662, dbo.tblTinh.sTentinh,  COUNT(dbo.tblCosonuoitrong.PK_iCosonuoitrongID) AS iSohonuoitrong, dbo.tblTinh.PK_iTinhID, 
                      SUM(dbo.tblCosonuoitrong.fTongdientich) AS fTongdientich, SUM(dbo.tblCosonuoitrong.fTongdientichmatnuoc) AS fTongdientichmatnuoc, SUM(dbo.tblCosonuoitrong.iSanluongdukien) 
                      AS iTongsanluongdukien
	FROM         dbo.tblCosonuoitrong INNER JOIN
						  thanglongsport_VietGap.tblQuanHuyen ON dbo.tblCosonuoitrong.FK_iQuanHuyenID = thanglongsport_VietGap.tblQuanHuyen.PK_iQuanHuyenID INNER JOIN
						  dbo.tblTinh ON thanglongsport_VietGap.tblQuanHuyen.FK_iTinhThanhID = dbo.tblTinh.PK_iTinhID
	GROUP BY dbo.tblTinh.PK_iTinhID, dbo.tblTinh.sTentinh, dbo.tblTinh.ISO31662
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spQuanHuyen_Update]    Script Date: 12/28/2011 10:40:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:13:49 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spQuanHuyen_Update] 
    
@PK_iQuanHuyenID bigint Output,
@sTen nvarchar(300),
@bQuanHuyen bit,
@sKytuviettat nvarchar(100),
@FK_iTinhThanhID smallint
AS
UPDATE tblQuanHuyen
SET
    sTen=@sTen,bQuanHuyen=@bQuanHuyen,sKytuviettat=@sKytuviettat,FK_iTinhThanhID=@FK_iTinhThanhID
WHERE PK_iQuanHuyenID=@PK_iQuanHuyenID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spQuanHuyen_Insert]    Script Date: 12/28/2011 10:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:13:49 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spQuanHuyen_Insert]
    
@PK_iQuanHuyenID bigint Output,
@sTen nvarchar(300),
@bQuanHuyen bit,
@sKytuviettat nvarchar(100),
@FK_iTinhThanhID smallint
AS
    INSERT INTO tblQuanHuyen(sTen,bQuanHuyen,sKytuviettat,FK_iTinhThanhID)
    VALUES(@sTen,@bQuanHuyen,@sKytuviettat,@FK_iTinhThanhID)
    SELECT @PK_iQuanHuyenID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spQuanHuyen_Get]    Script Date: 12/28/2011 10:40:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:13:49 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spQuanHuyen_Get]
AS
SELECT * FROM tblQuanHuyen
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spQuanHuyen_Delete]    Script Date: 12/28/2011 10:40:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:13:49 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spQuanHuyen_Delete]
    @PK_iQuanHuyenID bigint
AS
DELETE FROM tblQuanHuyen WHERE PK_iQuanHuyenID=@PK_iQuanHuyenID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spQuanHuyen_GetByFK_FK_iTinhThanhID]    Script Date: 12/28/2011 10:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:13:49 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spQuanHuyen_GetByFK_FK_iTinhThanhID]
@FK_iTinhThanhID smallint
AS
SELECT * FROM tblQuanHuyen
WHERE FK_iTinhThanhID=@FK_iTinhThanhID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spQuanHuyen_GetByPK]    Script Date: 12/28/2011 10:40:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:13:49 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spQuanHuyen_GetByPK]
    @PK_iQuanHuyenID bigint
AS
    SELECT * FROM tblQuanHuyen
    WHERE PK_iQuanHuyenID=@PK_iQuanHuyenID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosodangkychungnhan_GetByPK]    Script Date: 12/28/2011 10:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:26 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosodangkychungnhan_GetByPK]
    @PK_iHosodangkychungnhanID bigint
AS
    SELECT * FROM tblHosodangkychungnhan
    WHERE PK_iHosodangkychungnhanID=@PK_iHosodangkychungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosodangkychungnhan_GetByFK_FK_iCosonuoiID]    Script Date: 12/28/2011 10:39:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:26 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosodangkychungnhan_GetByFK_FK_iCosonuoiID]
@FK_iCosonuoiID bigint
AS
SELECT * FROM tblHosodangkychungnhan
WHERE FK_iCosonuoiID=@FK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosodangkychungnhan_Insert]    Script Date: 12/28/2011 10:39:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:26 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosodangkychungnhan_Insert]
    
@PK_iHosodangkychungnhanID bigint Output,
@dNgaydangky datetime,
@FK_iCosonuoiID bigint,
@bLandau bit
AS
    INSERT INTO tblHosodangkychungnhan(dNgaydangky,FK_iCosonuoiID,bLandau)
    VALUES(@dNgaydangky,@FK_iCosonuoiID,@bLandau)
    SELECT @PK_iHosodangkychungnhanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosodangkychungnhan_Update]    Script Date: 12/28/2011 10:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:26 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosodangkychungnhan_Update] 
    
@PK_iHosodangkychungnhanID bigint Output,
@dNgaydangky datetime,
@FK_iCosonuoiID bigint,
@bLandau bit
AS
UPDATE tblHosodangkychungnhan
SET
    dNgaydangky=@dNgaydangky,FK_iCosonuoiID=@FK_iCosonuoiID,bLandau=@bLandau
WHERE PK_iHosodangkychungnhanID=@PK_iHosodangkychungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosodangkychungnhan_Get]    Script Date: 12/28/2011 10:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:26 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosodangkychungnhan_Get]
AS
SELECT * FROM tblHosodangkychungnhan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spHosodangkychungnhan_Delete]    Script Date: 12/28/2011 10:39:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/22/2011 5:31:26 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spHosodangkychungnhan_Delete]
    @PK_iHosodangkychungnhanID bigint
AS
DELETE FROM tblHosodangkychungnhan WHERE PK_iHosodangkychungnhanID=@PK_iHosodangkychungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Insert]    Script Date: 12/28/2011 10:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Insert]
    
@PK_iDanhgiatochucchungnhanID int Output,
@sPhamvinghidinh ntext,
@tGiodanhgia datetime,
@dNgaydanhgia datetime,
@sCancudanhgia ntext,
@sNoidungdanhgia ntext,
@sKetquadanhgia ntext,
@iKetquadanhgia smallint,
@sKiennghi ntext,
@FK_iTochucchungnhanID int,
@FK_iTruongdoandanhgiaID int
AS
    INSERT INTO tblDanhgiatochucchungnhan(sPhamvinghidinh,tGiodanhgia,dNgaydanhgia,sCancudanhgia,sNoidungdanhgia,sKetquadanhgia,iKetquadanhgia,sKiennghi,FK_iTochucchungnhanID,FK_iTruongdoandanhgiaID)
    VALUES(@sPhamvinghidinh,@tGiodanhgia,@dNgaydanhgia,@sCancudanhgia,@sNoidungdanhgia,@sKetquadanhgia,@iKetquadanhgia,@sKiennghi,@FK_iTochucchungnhanID,@FK_iTruongdoandanhgiaID)
    SELECT @PK_iDanhgiatochucchungnhanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Update]    Script Date: 12/28/2011 10:37:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Update] 
    
@PK_iDanhgiatochucchungnhanID int Output,
@sPhamvinghidinh ntext,
@tGiodanhgia datetime,
@dNgaydanhgia datetime,
@sCancudanhgia ntext,
@sNoidungdanhgia ntext,
@sKetquadanhgia ntext,
@iKetquadanhgia smallint,
@sKiennghi ntext,
@FK_iTochucchungnhanID int,
@FK_iTruongdoandanhgiaID int
AS
UPDATE tblDanhgiatochucchungnhan
SET
    sPhamvinghidinh=@sPhamvinghidinh,tGiodanhgia=@tGiodanhgia,dNgaydanhgia=@dNgaydanhgia,sCancudanhgia=@sCancudanhgia,sNoidungdanhgia=@sNoidungdanhgia,sKetquadanhgia=@sKetquadanhgia,iKetquadanhgia=@iKetquadanhgia,sKiennghi=@sKiennghi,FK_iTochucchungnhanID=@FK_iTochucchungnhanID,FK_iTruongdoandanhgiaID=@FK_iTruongdoandanhgiaID
WHERE PK_iDanhgiatochucchungnhanID=@PK_iDanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Get]    Script Date: 12/28/2011 10:37:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Get]
AS
SELECT * FROM tblDanhgiatochucchungnhan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Delete]    Script Date: 12/28/2011 10:37:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_Delete]
    @PK_iDanhgiatochucchungnhanID int
AS
DELETE FROM tblDanhgiatochucchungnhan WHERE PK_iDanhgiatochucchungnhanID=@PK_iDanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_GetByPK]    Script Date: 12/28/2011 10:37:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_GetByPK]
    @PK_iDanhgiatochucchungnhanID int
AS
    SELECT * FROM tblDanhgiatochucchungnhan
    WHERE PK_iDanhgiatochucchungnhanID=@PK_iDanhgiatochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_GetByFK_FK_iTochucchungnhanID]    Script Date: 12/28/2011 10:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_GetByFK_FK_iTochucchungnhanID]
@FK_iTochucchungnhanID int
AS
SELECT * FROM tblDanhgiatochucchungnhan
WHERE FK_iTochucchungnhanID=@FK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiatochucchungnhan_GetByFK_FK_iTruongdoandanhgiaID]    Script Date: 12/28/2011 10:37:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:53:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiatochucchungnhan_GetByFK_FK_iTruongdoandanhgiaID]
@FK_iTruongdoandanhgiaID int
AS
SELECT * FROM tblDanhgiatochucchungnhan
WHERE FK_iTruongdoandanhgiaID=@FK_iTruongdoandanhgiaID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiavien_Insert]    Script Date: 12/28/2011 10:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:29:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiavien_Insert]
    
@PK_iDanhgiavienID int Output,
@sHoten nvarchar(60),
@FK_iTochucchungnhanID int,
@sTrinhdo nvarchar(100),
@iNamkinhnghiem smallint,
@bTCVN190112003 bit,
@bISO190112002 bit,
@bVietGapCer bit
AS
    INSERT INTO tblDanhgiavien(sHoten,FK_iTochucchungnhanID,sTrinhdo,iNamkinhnghiem,bTCVN190112003,bISO190112002,bVietGapCer)
    VALUES(@sHoten,@FK_iTochucchungnhanID,@sTrinhdo,@iNamkinhnghiem,@bTCVN190112003,@bISO190112002,@bVietGapCer)
    SELECT @PK_iDanhgiavienID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiavien_Get]    Script Date: 12/28/2011 10:37:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:29:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiavien_Get]
AS
SELECT * FROM tblDanhgiavien
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiavien_Delete]    Script Date: 12/28/2011 10:37:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:29:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiavien_Delete]
    @PK_iDanhgiavienID int
AS
DELETE FROM tblDanhgiavien WHERE PK_iDanhgiavienID=@PK_iDanhgiavienID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiavien_Update]    Script Date: 12/28/2011 10:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:29:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiavien_Update] 
    
@PK_iDanhgiavienID int Output,
@sHoten nvarchar(60),
@FK_iTochucchungnhanID int,
@sTrinhdo nvarchar(100),
@iNamkinhnghiem smallint,
@bTCVN190112003 bit,
@bISO190112002 bit,
@bVietGapCer bit
AS
UPDATE tblDanhgiavien
SET
    sHoten=@sHoten,FK_iTochucchungnhanID=@FK_iTochucchungnhanID,sTrinhdo=@sTrinhdo,iNamkinhnghiem=@iNamkinhnghiem,bTCVN190112003=@bTCVN190112003,bISO190112002=@bISO190112002,bVietGapCer=@bVietGapCer
WHERE PK_iDanhgiavienID=@PK_iDanhgiavienID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiavien_GetByPK]    Script Date: 12/28/2011 10:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:29:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiavien_GetByPK]
    @PK_iDanhgiavienID int
AS
    SELECT * FROM tblDanhgiavien
    WHERE PK_iDanhgiavienID=@PK_iDanhgiavienID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhgiavien_GetByFK_FK_iTochucchungnhanID]    Script Date: 12/28/2011 10:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/18/2011 10:29:18 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhgiavien_GetByFK_FK_iTochucchungnhanID]
@FK_iTochucchungnhanID int
AS
SELECT * FROM tblDanhgiavien
WHERE FK_iTochucchungnhanID=@FK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Update]    Script Date: 12/28/2011 10:35:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:16 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Update] 
    
@PK_iBaocaokhacphucloiChitietID bigint Output,
@sLoisai nvarchar(100),
@sBienphapkhacphuc nvarchar(1400),
@iKetqua smallint,
@FK_iBaocaokhacphucloiID bigint
AS
UPDATE tblBaocaokhacphucloiChitiet
SET
    sLoisai=@sLoisai,sBienphapkhacphuc=@sBienphapkhacphuc,iKetqua=@iKetqua,FK_iBaocaokhacphucloiID=@FK_iBaocaokhacphucloiID
WHERE PK_iBaocaokhacphucloiChitietID=@PK_iBaocaokhacphucloiChitietID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Get]    Script Date: 12/28/2011 10:35:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:16 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Get]
AS
SELECT * FROM tblBaocaokhacphucloiChitiet
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_GetByPK]    Script Date: 12/28/2011 10:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:16 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_GetByPK]
    @PK_iBaocaokhacphucloiChitietID bigint
AS
    SELECT * FROM tblBaocaokhacphucloiChitiet
    WHERE PK_iBaocaokhacphucloiChitietID=@PK_iBaocaokhacphucloiChitietID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_GetByFK_FK_iBaocaokhacphucloiID]    Script Date: 12/28/2011 10:35:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:16 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_GetByFK_FK_iBaocaokhacphucloiID]
@FK_iBaocaokhacphucloiID bigint
AS
SELECT * FROM tblBaocaokhacphucloiChitiet
WHERE FK_iBaocaokhacphucloiID=@FK_iBaocaokhacphucloiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Delete]    Script Date: 12/28/2011 10:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:16 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Delete]
    @PK_iBaocaokhacphucloiChitietID bigint
AS
DELETE FROM tblBaocaokhacphucloiChitiet WHERE PK_iBaocaokhacphucloiChitietID=@PK_iBaocaokhacphucloiChitietID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Insert]    Script Date: 12/28/2011 10:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:16 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloiChitiet_Insert]
    
@PK_iBaocaokhacphucloiChitietID bigint Output,
@sLoisai nvarchar(100),
@sBienphapkhacphuc nvarchar(1400),
@iKetqua smallint,
@FK_iBaocaokhacphucloiID bigint
AS
    INSERT INTO tblBaocaokhacphucloiChitiet(sLoisai,sBienphapkhacphuc,iKetqua,FK_iBaocaokhacphucloiID)
    VALUES(@sLoisai,@sBienphapkhacphuc,@iKetqua,@FK_iBaocaokhacphucloiID)
    SELECT @PK_iBaocaokhacphucloiChitietID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloi_Get]    Script Date: 12/28/2011 10:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:30 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloi_Get]
AS
SELECT * FROM tblBaocaokhacphucloi
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloi_Delete]    Script Date: 12/28/2011 10:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:30 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloi_Delete]
    @PK_iBaocaokhacphucloiID bigint
AS
DELETE FROM tblBaocaokhacphucloi WHERE PK_iBaocaokhacphucloiID=@PK_iBaocaokhacphucloiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloi_GetByPK]    Script Date: 12/28/2011 10:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:30 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloi_GetByPK]
    @PK_iBaocaokhacphucloiID bigint
AS
    SELECT * FROM tblBaocaokhacphucloi
    WHERE PK_iBaocaokhacphucloiID=@PK_iBaocaokhacphucloiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloi_Insert]    Script Date: 12/28/2011 10:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:30 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloi_Insert]
    
@PK_iBaocaokhacphucloiID bigint Output,
@FK_iCosonuoiID bigint,
@sTailieukiemtheo ntext,
@dNgaykiemtra datetime,
@sDoankiemtra nvarchar(2000)
AS
    INSERT INTO tblBaocaokhacphucloi(FK_iCosonuoiID,sTailieukiemtheo,dNgaykiemtra,sDoankiemtra)
    VALUES(@FK_iCosonuoiID,@sTailieukiemtheo,@dNgaykiemtra,@sDoankiemtra)
    SELECT @PK_iBaocaokhacphucloiID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloi_Update]    Script Date: 12/28/2011 10:35:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:30 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloi_Update] 
    
@PK_iBaocaokhacphucloiID bigint Output,
@FK_iCosonuoiID bigint,
@sTailieukiemtheo ntext,
@dNgaykiemtra datetime,
@sDoankiemtra nvarchar(2000)
AS
UPDATE tblBaocaokhacphucloi
SET
    FK_iCosonuoiID=@FK_iCosonuoiID,sTailieukiemtheo=@sTailieukiemtheo,dNgaykiemtra=@dNgaykiemtra,sDoankiemtra=@sDoankiemtra
WHERE PK_iBaocaokhacphucloiID=@PK_iBaocaokhacphucloiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spBaocaokhacphucloi_GetByFK_FK_iCosonuoiID]    Script Date: 12/28/2011 10:35:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/17/2011 9:32:30 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spBaocaokhacphucloi_GetByFK_FK_iCosonuoiID]
@FK_iCosonuoiID bigint
AS
SELECT * FROM tblBaocaokhacphucloi
WHERE FK_iCosonuoiID=@FK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spLoaivanban_Insert]    Script Date: 12/28/2011 10:39:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 4:39:29 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spLoaivanban_Insert]
    
@PK_iLoaivanbanID int Output,
@sTenloai nvarchar(300)
AS
    INSERT INTO tblLoaivanban(sTenloai)
    VALUES(@sTenloai)
    SELECT @PK_iLoaivanbanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spLoaivanban_Update]    Script Date: 12/28/2011 10:39:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 4:39:29 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spLoaivanban_Update] 
    
@PK_iLoaivanbanID int Output,
@sTenloai nvarchar(300)
AS
UPDATE tblLoaivanban
SET
    sTenloai=@sTenloai
WHERE PK_iLoaivanbanID=@PK_iLoaivanbanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spLoaivanban_Get]    Script Date: 12/28/2011 10:39:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 4:39:29 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spLoaivanban_Get]
AS
SELECT * FROM tblLoaivanban
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spLoaivanban_Delete]    Script Date: 12/28/2011 10:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 4:39:29 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spLoaivanban_Delete]
    @PK_iLoaivanbanID int
AS
DELETE FROM tblLoaivanban WHERE PK_iLoaivanbanID=@PK_iLoaivanbanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spLoaivanban_GetByPK]    Script Date: 12/28/2011 10:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 4:39:29 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spLoaivanban_GetByPK]
    @PK_iLoaivanbanID int
AS
    SELECT * FROM tblLoaivanban
    WHERE PK_iLoaivanbanID=@PK_iLoaivanbanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoituongnuoi_Insert]    Script Date: 12/28/2011 10:38:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:10:18 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoituongnuoi_Insert]
    
@PK_iDoituongnuoiID int Output,
@sTendoituong nvarchar(300),
@sKytu nvarchar(100)
AS
    INSERT INTO tblDoituongnuoi(sTendoituong,sKytu)
    VALUES(@sTendoituong,@sKytu)
    SELECT @PK_iDoituongnuoiID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoituongnuoi_Update]    Script Date: 12/28/2011 10:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:10:18 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoituongnuoi_Update] 
    
@PK_iDoituongnuoiID int Output,
@sTendoituong nvarchar(300),
@sKytu nvarchar(100)
AS
UPDATE tblDoituongnuoi
SET
    sTendoituong=@sTendoituong,sKytu=@sKytu
WHERE PK_iDoituongnuoiID=@PK_iDoituongnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoituongnuoi_Get]    Script Date: 12/28/2011 10:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:10:18 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoituongnuoi_Get]
AS
SELECT * FROM tblDoituongnuoi
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoituongnuoi_Delete]    Script Date: 12/28/2011 10:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:10:18 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoituongnuoi_Delete]
    @PK_iDoituongnuoiID int
AS
DELETE FROM tblDoituongnuoi WHERE PK_iDoituongnuoiID=@PK_iDoituongnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDoituongnuoi_GetByPK]    Script Date: 12/28/2011 10:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:31/10/2011 7:10:18 CH
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDoituongnuoi_GetByPK]
    @PK_iDoituongnuoiID int
AS
    SELECT * FROM tblDoituongnuoi
    WHERE PK_iDoituongnuoiID=@PK_iDoituongnuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spCosonuoitrong_getAllByPK]    Script Date: 12/28/2011 10:36:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [thanglongsport_VietGap].[spCosonuoitrong_getAllByPK]
	-- Add the parameters for the stored procedure here
	(@PK_iCosonuoitrongID bigint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT        dbo.tblCosonuoitrong.sTencoso,tblCosonuoitrong.iSanluongdukien, dbo.tblCosonuoitrong.sAp, dbo.tblCosonuoitrong.sXa, dbo.tblCosonuoitrong.sMasocoso, 
                         tblMasovietgap.dNgaycap, tblMasovietgap.dNgayhethan, dbo.tblDoituongnuoi.sTendoituong, tblTochucchungnhan.sTochucchungnhan, tblMasovietgap.sMaso,
					tblCosonuoitrong.fTongdientich, tblCosonuoitrong.fTongdientichmatnuoc
	FROM            dbo.tblCosonuoitrong INNER JOIN
                         dbo.tblDoituongnuoi ON dbo.tblCosonuoitrong.FK_iDoituongnuoiID = dbo.tblDoituongnuoi.PK_iDoituongnuoiID INNER JOIN
                         tblMasovietgap ON dbo.tblCosonuoitrong.PK_iCosonuoitrongID = tblMasovietgap.FK_iCosonuoitrongID INNER JOIN
                         tblTochucchungnhan ON tblMasovietgap.FK_iTochucchungnhanID = tblTochucchungnhan.PK_iTochucchungnhanID AND 
                         tblMasovietgap.FK_iTochucchungnhanID = tblTochucchungnhan.PK_iTochucchungnhanID
	WHERE tblCosonuoitrong.PK_iCosonuoitrongID = @PK_iCosonuoitrongID
    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_Update]    Script Date: 12/28/2011 10:40:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/27/2011 8:54:48 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_Update] 
    
@PK_iPhatDinhchiID int Output,
@sLydo nvarchar(1000),
@iMucdo smallint,
@FK_iCosonuoiID bigint,
@dNgaythuchien datetime
AS
UPDATE tblPhat
SET
    sLydo=@sLydo,iMucdo=@iMucdo,FK_iCosonuoiID=@FK_iCosonuoiID,dNgaythuchien=@dNgaythuchien
WHERE PK_iPhatDinhchiID=@PK_iPhatDinhchiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_Delete]    Script Date: 12/28/2011 10:39:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/27/2011 8:54:48 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_Delete]
    @PK_iPhatDinhchiID int
AS
DELETE FROM tblPhat WHERE PK_iPhatDinhchiID=@PK_iPhatDinhchiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_Get]    Script Date: 12/28/2011 10:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/27/2011 8:54:48 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_Get]
AS
SELECT * FROM tblPhat
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_GetByPK]    Script Date: 12/28/2011 10:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/27/2011 8:54:48 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_GetByPK]
    @PK_iPhatDinhchiID int
AS
    SELECT * FROM tblPhat
    WHERE PK_iPhatDinhchiID=@PK_iPhatDinhchiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_GetByFK_FK_iCosonuoiID]    Script Date: 12/28/2011 10:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/27/2011 8:54:48 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_GetByFK_FK_iCosonuoiID]
@FK_iCosonuoiID bigint
AS
SELECT * FROM tblPhat
WHERE FK_iCosonuoiID=@FK_iCosonuoiID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhat_Insert]    Script Date: 12/28/2011 10:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/27/2011 8:54:48 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhat_Insert]
    
@PK_iPhatDinhchiID int Output,
@sLydo nvarchar(1000),
@iMucdo smallint,
@FK_iCosonuoiID bigint,
@dNgaythuchien datetime
AS
    INSERT INTO tblPhat(sLydo,iMucdo,FK_iCosonuoiID,dNgaythuchien)
    VALUES(@sLydo,@iMucdo,@FK_iCosonuoiID,@dNgaythuchien)
    SELECT @PK_iPhatDinhchiID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDocument_Get]    Script Date: 12/28/2011 10:37:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 9:47:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDocument_Get]
AS
SELECT * FROM tblDocument
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDocument_Delete]    Script Date: 12/28/2011 10:37:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 9:47:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDocument_Delete]
    @PK_iDocumentID int
AS
DELETE FROM tblDocument WHERE PK_iDocumentID=@PK_iDocumentID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDocument_Update]    Script Date: 12/28/2011 10:38:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 9:47:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDocument_Update] 
    
@PK_iDocumentID int Output,
@sTitle nvarchar(1000),
@sDesc nvarchar(2000),
@sImage nvarchar(1000),
@iDownloadTime int,
@iUserID int,
@sLinkFile nvarchar(1000),
@tDate datetime,
@sAuthor nvarchar(100),
@sCoquanbanhanh nvarchar(300),
@FK_iLoaivanbanID int,
@dNgaybanhanh datetime,
@dNgaydangcongbao datetime,
@dNgaycohieuluc datetime,
@dNgayhethieuluc datetime,
@sPhamvi nvarchar(100),
@sSokyhieu nvarchar(100)
AS
UPDATE tblDocument
SET
    sTitle=@sTitle,sDesc=@sDesc,sImage=@sImage,iDownloadTime=@iDownloadTime,iUserID=@iUserID,sLinkFile=@sLinkFile,tDate=@tDate,sAuthor=@sAuthor,sCoquanbanhanh=@sCoquanbanhanh,FK_iLoaivanbanID=@FK_iLoaivanbanID,dNgaybanhanh=@dNgaybanhanh,dNgaydangcongbao=@dNgaydangcongbao,dNgaycohieuluc=@dNgaycohieuluc,dNgayhethieuluc=@dNgayhethieuluc,sPhamvi=@sPhamvi,sSokyhieu=@sSokyhieu
WHERE PK_iDocumentID=@PK_iDocumentID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDocument_Insert]    Script Date: 12/28/2011 10:37:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 9:47:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDocument_Insert]
    
@PK_iDocumentID int Output,
@sTitle nvarchar(1000),
@sDesc nvarchar(2000),
@sImage nvarchar(1000),
@iDownloadTime int,
@iUserID int,
@sLinkFile nvarchar(1000),
@tDate datetime,
@sAuthor nvarchar(100),
@sCoquanbanhanh nvarchar(300),
@FK_iLoaivanbanID int,
@dNgaybanhanh datetime,
@dNgaydangcongbao datetime,
@dNgaycohieuluc datetime,
@dNgayhethieuluc datetime,
@sPhamvi nvarchar(100),
@sSokyhieu nvarchar(100)
AS
    INSERT INTO tblDocument(sTitle,sDesc,sImage,iDownloadTime,iUserID,sLinkFile,tDate,sAuthor,sCoquanbanhanh,FK_iLoaivanbanID,dNgaybanhanh,dNgaydangcongbao,dNgaycohieuluc,dNgayhethieuluc,sPhamvi,sSokyhieu)
    VALUES(@sTitle,@sDesc,@sImage,@iDownloadTime,@iUserID,@sLinkFile,@tDate,@sAuthor,@sCoquanbanhanh,@FK_iLoaivanbanID,@dNgaybanhanh,@dNgaydangcongbao,@dNgaycohieuluc,@dNgayhethieuluc,@sPhamvi,@sSokyhieu)
    SELECT @PK_iDocumentID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDocument_GetByPK]    Script Date: 12/28/2011 10:37:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/21/2011 9:47:00 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDocument_GetByPK]
    @PK_iDocumentID int
AS
    SELECT * FROM tblDocument
    WHERE PK_iDocumentID=@PK_iDocumentID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhmucchitieu_Insert]    Script Date: 12/28/2011 10:37:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:27 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhmucchitieu_Insert]
    
@PK_iDanhmucchitieuID int Output,
@sTenchuyenmuc nvarchar(200),
@iThutu smallint
AS
    INSERT INTO tblDanhmucchitieu(sTenchuyenmuc,iThutu)
    VALUES(@sTenchuyenmuc,@iThutu)
    SELECT @PK_iDanhmucchitieuID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhmucchitieu_Update]    Script Date: 12/28/2011 10:37:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:27 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhmucchitieu_Update] 
    
@PK_iDanhmucchitieuID int Output,
@sTenchuyenmuc nvarchar(200),
@iThutu smallint
AS
UPDATE tblDanhmucchitieu
SET
    sTenchuyenmuc=@sTenchuyenmuc,iThutu=@iThutu
WHERE PK_iDanhmucchitieuID=@PK_iDanhmucchitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhmucchitieu_GetByPK]    Script Date: 12/28/2011 10:37:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:27 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhmucchitieu_GetByPK]
    @PK_iDanhmucchitieuID int
AS
    SELECT * FROM tblDanhmucchitieu
    WHERE PK_iDanhmucchitieuID=@PK_iDanhmucchitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhmucchitieu_Get]    Script Date: 12/28/2011 10:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:27 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhmucchitieu_Get]
AS
SELECT * FROM tblDanhmucchitieu
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spDanhmucchitieu_Delete]    Script Date: 12/28/2011 10:37:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:27 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spDanhmucchitieu_Delete]
    @PK_iDanhmucchitieuID int
AS
DELETE FROM tblDanhmucchitieu WHERE PK_iDanhmucchitieuID=@PK_iDanhmucchitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[sp_GetInforDanhgianoibo]    Script Date: 12/28/2011 10:35:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [thanglongsport_VietGap].[sp_GetInforDanhgianoibo]
as
begin
	SELECT     tblDanhmucchitieu.sTenchuyenmuc, tblDanhmucchitieu.iThutu, tblChitieu.PK_iChitieuID, tblChitieu.sNoidung, tblChitieu.sYeucauvietgap, tblChitieu.iThuthu, 
						  tblChitieu.FK_iMucdoID, tblChitieu.sGhichu, tblPhuongphapkiemtra.sTenphuongphapkiemtra, tblMucdo.sTenmucdo, tblDanhmucchitieu.PK_iDanhmucchitieuID
	FROM         tblChitieu INNER JOIN
						  tblDanhmucchitieu ON tblChitieu.FK_iDanhmucchitieuID = tblDanhmucchitieu.PK_iDanhmucchitieuID INNER JOIN
						  tblMucdo ON tblChitieu.FK_iMucdoID = tblMucdo.PK_iMucdoID CROSS JOIN
						  tblPhuongphapkiemtra
END
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMucdo_Insert]    Script Date: 12/28/2011 10:39:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 11:16:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMucdo_Insert]
    
@PK_iMucdoID int Output,
@sTenmucdo varchar(10)
AS
    INSERT INTO tblMucdo(sTenmucdo)
    VALUES(@sTenmucdo)
    SELECT @PK_iMucdoID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMucdo_Delete]    Script Date: 12/28/2011 10:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 11:16:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMucdo_Delete]
    @PK_iMucdoID int
AS
DELETE FROM tblMucdo WHERE PK_iMucdoID=@PK_iMucdoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMucdo_GetByPK]    Script Date: 12/28/2011 10:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 11:16:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMucdo_GetByPK]
    @PK_iMucdoID int
AS
    SELECT * FROM tblMucdo
    WHERE PK_iMucdoID=@PK_iMucdoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMucdo_Get]    Script Date: 12/28/2011 10:39:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 11:16:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMucdo_Get]
AS
SELECT * FROM tblMucdo
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMucdo_Update]    Script Date: 12/28/2011 10:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 11:16:03 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMucdo_Update] 
    
@PK_iMucdoID int Output,
@sTenmucdo varchar(10)
AS
UPDATE tblMucdo
SET
    sTenmucdo=@sTenmucdo
WHERE PK_iMucdoID=@PK_iMucdoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhuongphapkiemtra_Insert]    Script Date: 12/28/2011 10:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhuongphapkiemtra_Insert]
    
@PK_iPhuongphapkiemtraID int Output,
@sTenphuongphapkiemtra nvarchar(200)
AS
    INSERT INTO tblPhuongphapkiemtra(sTenphuongphapkiemtra)
    VALUES(@sTenphuongphapkiemtra)
    SELECT @PK_iPhuongphapkiemtraID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhuongphapkiemtra_GetByPK]    Script Date: 12/28/2011 10:40:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhuongphapkiemtra_GetByPK]
    @PK_iPhuongphapkiemtraID int
AS
    SELECT * FROM tblPhuongphapkiemtra
    WHERE PK_iPhuongphapkiemtraID=@PK_iPhuongphapkiemtraID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhuongphapkiemtra_Delete]    Script Date: 12/28/2011 10:40:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhuongphapkiemtra_Delete]
    @PK_iPhuongphapkiemtraID int
AS
DELETE FROM tblPhuongphapkiemtra WHERE PK_iPhuongphapkiemtraID=@PK_iPhuongphapkiemtraID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhuongphapkiemtra_Get]    Script Date: 12/28/2011 10:40:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhuongphapkiemtra_Get]
AS
SELECT * FROM tblPhuongphapkiemtra
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spPhuongphapkiemtra_Update]    Script Date: 12/28/2011 10:40:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:37 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spPhuongphapkiemtra_Update] 
    
@PK_iPhuongphapkiemtraID int Output,
@sTenphuongphapkiemtra nvarchar(200)
AS
UPDATE tblPhuongphapkiemtra
SET
    sTenphuongphapkiemtra=@sTenphuongphapkiemtra
WHERE PK_iPhuongphapkiemtraID=@PK_iPhuongphapkiemtraID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqAnswers_Delete]    Script Date: 12/28/2011 10:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:53 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqAnswers_Delete]
    @PK_iFaqAnswerID bigint
AS
DELETE FROM tblFaqAnswers WHERE PK_iFaqAnswerID=@PK_iFaqAnswerID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqAnswers_Get]    Script Date: 12/28/2011 10:38:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:53 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqAnswers_Get]
AS
SELECT * FROM tblFaqAnswers
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqAnswers_Insert]    Script Date: 12/28/2011 10:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:53 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqAnswers_Insert]
    
@PK_iFaqAnswerID bigint Output,
@FK_iFaqID bigint,
@sContent nvarchar(2000)
AS
    INSERT INTO tblFaqAnswers(FK_iFaqID,sContent)
    VALUES(@FK_iFaqID,@sContent)
    SELECT @PK_iFaqAnswerID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqAnswers_Update]    Script Date: 12/28/2011 10:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:53 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqAnswers_Update] 
    
@PK_iFaqAnswerID bigint Output,
@FK_iFaqID bigint,
@sContent nvarchar(2000)
AS
UPDATE tblFaqAnswers
SET
    FK_iFaqID=@FK_iFaqID,sContent=@sContent
WHERE PK_iFaqAnswerID=@PK_iFaqAnswerID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqAnswers_GetByFK_FK_iFaqID]    Script Date: 12/28/2011 10:38:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:53 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqAnswers_GetByFK_FK_iFaqID]
@FK_iFaqID bigint
AS
SELECT * FROM tblFaqAnswers
WHERE FK_iFaqID=@FK_iFaqID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqAnswers_GetByPK]    Script Date: 12/28/2011 10:38:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:53 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqAnswers_GetByPK]
    @PK_iFaqAnswerID bigint
AS
    SELECT * FROM tblFaqAnswers
    WHERE PK_iFaqAnswerID=@PK_iFaqAnswerID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_Insert]    Script Date: 12/28/2011 10:38:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_Insert]
    
@PK_iFaqCategoryID bigint Output,
@FK_iFaqID bigint,
@iCateFaqID int
AS
    INSERT INTO tblFaqCategory(FK_iFaqID,iCateFaqID)
    VALUES(@FK_iFaqID,@iCateFaqID)
    SELECT @PK_iFaqCategoryID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_Update]    Script Date: 12/28/2011 10:38:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_Update] 
    
@PK_iFaqCategoryID bigint Output,
@FK_iFaqID bigint,
@iCateFaqID int
AS
UPDATE tblFaqCategory
SET
    FK_iFaqID=@FK_iFaqID,iCateFaqID=@iCateFaqID
WHERE PK_iFaqCategoryID=@PK_iFaqCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_Get]    Script Date: 12/28/2011 10:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_Get]
AS
SELECT * FROM tblFaqCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_GetByFK_iCateFaqID]    Script Date: 12/28/2011 10:38:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_GetByFK_iCateFaqID]
@iCateFaqID int
AS
SELECT * FROM tblFaqCategory
WHERE iCateFaqID=@iCateFaqID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_GetByFK_FK_iFaqID]    Script Date: 12/28/2011 10:38:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_GetByFK_FK_iFaqID]
@FK_iFaqID bigint
AS
SELECT * FROM tblFaqCategory
WHERE FK_iFaqID=@FK_iFaqID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_GetByPK]    Script Date: 12/28/2011 10:38:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_GetByPK]
    @PK_iFaqCategoryID bigint
AS
    SELECT * FROM tblFaqCategory
    WHERE PK_iFaqCategoryID=@PK_iFaqCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaqCategory_Delete]    Script Date: 12/28/2011 10:38:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:21:57 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaqCategory_Delete]
    @PK_iFaqCategoryID bigint
AS
DELETE FROM tblFaqCategory WHERE PK_iFaqCategoryID=@PK_iFaqCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_GetByPK]    Script Date: 12/28/2011 10:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_GetByPK]
    @PK_iMasoVietGapID bigint
AS
    SELECT * FROM tblMasovietgap
    WHERE PK_iMasoVietGapID=@PK_iMasoVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_GetByFK_FK_iTochucchungnhanID]    Script Date: 12/28/2011 10:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_GetByFK_FK_iTochucchungnhanID]
@FK_iTochucchungnhanID int
AS
SELECT * FROM tblMasovietgap
WHERE FK_iTochucchungnhanID=@FK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_GetByFK_FK_iCosonuoitrongID]    Script Date: 12/28/2011 10:39:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_GetByFK_FK_iCosonuoitrongID]
@FK_iCosonuoitrongID bigint
AS
SELECT * FROM tblMasovietgap
WHERE FK_iCosonuoitrongID=@FK_iCosonuoitrongID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_Update]    Script Date: 12/28/2011 10:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_Update] 
    
@PK_iMasoVietGapID bigint Output,
@sMaso nvarchar(100),
@FK_iTochucchungnhanID int,
@FK_iCosonuoitrongID bigint,
@dNgaycap datetime,
@dNgayhethan datetime,
@iThoihan smallint,
@iTrangthai smallint,
@iSanluongdukienmoi bigint,
@fDientichmorong float
AS
UPDATE tblMasovietgap
SET
    sMaso=@sMaso,FK_iTochucchungnhanID=@FK_iTochucchungnhanID,FK_iCosonuoitrongID=@FK_iCosonuoitrongID,dNgaycap=@dNgaycap,dNgayhethan=@dNgayhethan,iThoihan=@iThoihan,iTrangthai=@iTrangthai,iSanluongdukienmoi=@iSanluongdukienmoi,fDientichmorong=@fDientichmorong
WHERE PK_iMasoVietGapID=@PK_iMasoVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_Insert]    Script Date: 12/28/2011 10:39:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_Insert]
    
@PK_iMasoVietGapID bigint Output,
@sMaso nvarchar(100),
@FK_iTochucchungnhanID int,
@FK_iCosonuoitrongID bigint,
@dNgaycap datetime,
@dNgayhethan datetime,
@iThoihan smallint,
@iTrangthai smallint,
@iSanluongdukienmoi bigint,
@fDientichmorong float
AS
    INSERT INTO tblMasovietgap(sMaso,FK_iTochucchungnhanID,FK_iCosonuoitrongID,dNgaycap,dNgayhethan,iThoihan,iTrangthai,iSanluongdukienmoi,fDientichmorong)
    VALUES(@sMaso,@FK_iTochucchungnhanID,@FK_iCosonuoitrongID,@dNgaycap,@dNgayhethan,@iThoihan,@iTrangthai,@iSanluongdukienmoi,@fDientichmorong)
    SELECT @PK_iMasoVietGapID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_Get]    Script Date: 12/28/2011 10:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_Get]
AS
SELECT * FROM tblMasovietgap
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spMasovietgap_Delete]    Script Date: 12/28/2011 10:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/23/2011 8:16:50 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spMasovietgap_Delete]
    @PK_iMasoVietGapID bigint
AS
DELETE FROM tblMasovietgap WHERE PK_iMasoVietGapID=@PK_iMasoVietGapID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaq_GetByPK]    Script Date: 12/28/2011 10:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:22:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaq_GetByPK]
    @PK_iFaqID bigint
AS
    SELECT * FROM tblFaq
    WHERE PK_iFaqID=@PK_iFaqID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaq_Get]    Script Date: 12/28/2011 10:38:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:22:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaq_Get]
AS
SELECT * FROM tblFaq
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaq_Delete]    Script Date: 12/28/2011 10:38:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:22:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaq_Delete]
    @PK_iFaqID bigint
AS
DELETE FROM tblFaq WHERE PK_iFaqID=@PK_iFaqID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaq_Insert]    Script Date: 12/28/2011 10:38:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:22:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaq_Insert]
    
@PK_iFaqID bigint Output,
@FK_iFaqCateID int,
@sQuestion nvarchar(1000),
@dDate datetime,
@iViews bigint,
@FK_iUserID bigint
AS
    INSERT INTO tblFaq(FK_iFaqCateID,sQuestion,dDate,iViews,FK_iUserID)
    VALUES(@FK_iFaqCateID,@sQuestion,@dDate,@iViews,@FK_iUserID)
    SELECT @PK_iFaqID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFaq_Update]    Script Date: 12/28/2011 10:38:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:11/24/2011 10:22:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFaq_Update] 
    
@PK_iFaqID bigint Output,
@FK_iFaqCateID int,
@sQuestion nvarchar(1000),
@dDate datetime,
@iViews bigint,
@FK_iUserID bigint
AS
UPDATE tblFaq
SET
    FK_iFaqCateID=@FK_iFaqCateID,sQuestion=@sQuestion,dDate=@dDate,iViews=@iViews,FK_iUserID=@FK_iUserID
WHERE PK_iFaqID=@PK_iFaqID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_Delete]    Script Date: 12/28/2011 10:41:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_Delete]
    @PK_iTochucchungnhanID int
AS
DELETE FROM tblTochucchungnhan WHERE PK_iTochucchungnhanID=@PK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_GetByPK]    Script Date: 12/28/2011 10:41:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_GetByPK]
    @PK_iTochucchungnhanID int
AS
    SELECT * FROM tblTochucchungnhan
    WHERE PK_iTochucchungnhanID=@PK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_GetByFK_FK_iQuanHuyenID]    Script Date: 12/28/2011 10:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_GetByFK_FK_iQuanHuyenID]
@FK_iQuanHuyenID bigint
AS
SELECT * FROM tblTochucchungnhan
WHERE FK_iQuanHuyenID=@FK_iQuanHuyenID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_GetByFK_FK_iUserID]    Script Date: 12/28/2011 10:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_GetByFK_FK_iUserID]
@FK_iUserID bigint
AS
SELECT * FROM tblTochucchungnhan
WHERE FK_iUserID=@FK_iUserID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_Get]    Script Date: 12/28/2011 10:41:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_Get]
AS
SELECT * FROM tblTochucchungnhan
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_Update]    Script Date: 12/28/2011 10:41:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_Update] 
    
@PK_iTochucchungnhanID int Output,
@sTochucchungnhan nvarchar(300),
@sKytuviettat nvarchar(100),
@sDiachi nvarchar(300),
@FK_iQuanHuyenID bigint,
@sSodienthoai varchar(20),
@FK_iUserID bigint,
@imgLogo image,
@sFax nvarchar(40),
@sEmail nvarchar(300),
@sSodangkykinhdoanh nvarchar(300),
@sCoquancap nvarchar(300),
@dNgaycapdangkykinhdoanh datetime,
@sNoicapdangkykinhdoanh nvarchar(300),
@iTrangthai smallint,
@bDuyet bit
AS
UPDATE tblTochucchungnhan
SET
    sTochucchungnhan=@sTochucchungnhan,sKytuviettat=@sKytuviettat,sDiachi=@sDiachi,FK_iQuanHuyenID=@FK_iQuanHuyenID,sSodienthoai=@sSodienthoai,FK_iUserID=@FK_iUserID,imgLogo=@imgLogo,sFax=@sFax,sEmail=@sEmail,sSodangkykinhdoanh=@sSodangkykinhdoanh,sCoquancap=@sCoquancap,dNgaycapdangkykinhdoanh=@dNgaycapdangkykinhdoanh,sNoicapdangkykinhdoanh=@sNoicapdangkykinhdoanh,iTrangthai=@iTrangthai,bDuyet=@bDuyet
WHERE PK_iTochucchungnhanID=@PK_iTochucchungnhanID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spTochucchungnhan_Insert]    Script Date: 12/28/2011 10:41:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/26/2011 9:24:34 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spTochucchungnhan_Insert]
    
@PK_iTochucchungnhanID int Output,
@sTochucchungnhan nvarchar(300),
@sKytuviettat nvarchar(100),
@sDiachi nvarchar(300),
@FK_iQuanHuyenID bigint,
@sSodienthoai varchar(20),
@FK_iUserID bigint,
@imgLogo image,
@sFax nvarchar(40),
@sEmail nvarchar(300),
@sSodangkykinhdoanh nvarchar(300),
@sCoquancap nvarchar(300),
@dNgaycapdangkykinhdoanh datetime,
@sNoicapdangkykinhdoanh nvarchar(300),
@iTrangthai smallint,
@bDuyet bit
AS
    INSERT INTO tblTochucchungnhan(sTochucchungnhan,sKytuviettat,sDiachi,FK_iQuanHuyenID,sSodienthoai,FK_iUserID,imgLogo,sFax,sEmail,sSodangkykinhdoanh,sCoquancap,dNgaycapdangkykinhdoanh,sNoicapdangkykinhdoanh,iTrangthai,bDuyet)
    VALUES(@sTochucchungnhan,@sKytuviettat,@sDiachi,@FK_iQuanHuyenID,@sSodienthoai,@FK_iUserID,@imgLogo,@sFax,@sEmail,@sSodangkykinhdoanh,@sCoquancap,@dNgaycapdangkykinhdoanh,@sNoicapdangkykinhdoanh,@iTrangthai,@bDuyet)
    SELECT @PK_iTochucchungnhanID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_GetByFK_FK_iDanhmucchitieuID]    Script Date: 12/28/2011 10:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_GetByFK_FK_iDanhmucchitieuID]
@FK_iDanhmucchitieuID int
AS
SELECT * FROM tblChitieu
WHERE FK_iDanhmucchitieuID=@FK_iDanhmucchitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_GetByPK]    Script Date: 12/28/2011 10:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_GetByPK]
    @PK_iChitieuID int
AS
    SELECT * FROM tblChitieu
    WHERE PK_iChitieuID=@PK_iChitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_GetByFK_FK_iMucdoID]    Script Date: 12/28/2011 10:36:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_GetByFK_FK_iMucdoID]
@FK_iMucdoID int
AS
SELECT * FROM tblChitieu
WHERE FK_iMucdoID=@FK_iMucdoID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_Delete]    Script Date: 12/28/2011 10:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_Delete]
    @PK_iChitieuID int
AS
DELETE FROM tblChitieu WHERE PK_iChitieuID=@PK_iChitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_Get]    Script Date: 12/28/2011 10:36:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_Get]
AS
SELECT * FROM tblChitieu
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_Insert]    Script Date: 12/28/2011 10:36:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_Insert]
    
@PK_iChitieuID int Output,
@sNoidung ntext,
@sYeucauvietgap ntext,
@iThuthu smallint,
@FK_iMucdoID int,
@sGhichu ntext,
@FK_iDanhmucchitieuID int
AS
    INSERT INTO tblChitieu(sNoidung,sYeucauvietgap,iThuthu,FK_iMucdoID,sGhichu,FK_iDanhmucchitieuID)
    VALUES(@sNoidung,@sYeucauvietgap,@iThuthu,@FK_iMucdoID,@sGhichu,@FK_iDanhmucchitieuID)
    SELECT @PK_iChitieuID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spChitieu_Update]    Script Date: 12/28/2011 10:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:12/15/2011 9:13:43 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spChitieu_Update] 
    
@PK_iChitieuID int Output,
@sNoidung ntext,
@sYeucauvietgap ntext,
@iThuthu smallint,
@FK_iMucdoID int,
@sGhichu ntext,
@FK_iDanhmucchitieuID int
AS
UPDATE tblChitieu
SET
    sNoidung=@sNoidung,sYeucauvietgap=@sYeucauvietgap,iThuthu=@iThuthu,FK_iMucdoID=@FK_iMucdoID,sGhichu=@sGhichu,FK_iDanhmucchitieuID=@FK_iDanhmucchitieuID
WHERE PK_iChitieuID=@PK_iChitieuID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdv_Update]    Script Date: 12/28/2011 10:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:51:59 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdv_Update] 
    
@iAdvID int Output,
@sTitle nvarchar(400),
@sLink nvarchar(400),
@sDesc nvarchar(1000),
@sMedia nvarchar(400),
@iType tinyint,
@iOrder tinyint,
@iPositionID int,
@iWidth smallint,
@iHeight smallint
AS
UPDATE tblAdv
SET
    sTitle=@sTitle,sLink=@sLink,sDesc=@sDesc,sMedia=@sMedia,iType=@iType,iOrder=@iOrder,iPositionID=@iPositionID,iWidth=@iWidth,iHeight=@iHeight
WHERE iAdvID=@iAdvID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdv_Delete]    Script Date: 12/28/2011 10:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:51:59 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdv_Delete]
    @iAdvID int
AS
DELETE FROM tblAdv WHERE iAdvID=@iAdvID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdv_Insert]    Script Date: 12/28/2011 10:35:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:51:59 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdv_Insert]
    
@iAdvID int Output,
@sTitle nvarchar(400),
@sLink nvarchar(400),
@sDesc nvarchar(1000),
@sMedia nvarchar(400),
@iType tinyint,
@iOrder tinyint,
@iPositionID int,
@iWidth smallint,
@iHeight smallint
AS
    INSERT INTO tblAdv(sTitle,sLink,sDesc,sMedia,iType,iOrder,iPositionID,iWidth,iHeight)
    VALUES(@sTitle,@sLink,@sDesc,@sMedia,@iType,@iOrder,@iPositionID,@iWidth,@iHeight)
    SELECT @iAdvID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdv_GetByPK]    Script Date: 12/28/2011 10:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:51:59 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdv_GetByPK]
    @iAdvID int
AS
    SELECT * FROM tblAdv
    WHERE iAdvID=@iAdvID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdv_GetByFK_iPositionID]    Script Date: 12/28/2011 10:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:51:59 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdv_GetByFK_iPositionID]
@iPositionID int
AS
SELECT * FROM tblAdv
WHERE iPositionID=@iPositionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdv_Get]    Script Date: 12/28/2011 10:35:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:51:59 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdv_Get]
AS
SELECT * FROM tblAdv
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_Update]    Script Date: 12/28/2011 10:35:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_Update] 
    
@iAdvCategory int Output,
@iAdvID int,
@iCategoryID int
AS
UPDATE tblAdvCategory
SET
    iAdvID=@iAdvID,iCategoryID=@iCategoryID
WHERE iAdvCategory=@iAdvCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_Insert]    Script Date: 12/28/2011 10:35:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_Insert]
    
@iAdvCategory int Output,
@iAdvID int,
@iCategoryID int
AS
    INSERT INTO tblAdvCategory(iAdvID,iCategoryID)
    VALUES(@iAdvID,@iCategoryID)
    SELECT @iAdvCategory=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_GetByFK_iCategoryID]    Script Date: 12/28/2011 10:35:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_GetByFK_iCategoryID]
@iCategoryID int
AS
SELECT * FROM tblAdvCategory
WHERE iCategoryID=@iCategoryID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_GetByPK]    Script Date: 12/28/2011 10:35:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_GetByPK]
    @iAdvCategory int
AS
    SELECT * FROM tblAdvCategory
    WHERE iAdvCategory=@iAdvCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_GetByFK_iAdvID]    Script Date: 12/28/2011 10:35:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_GetByFK_iAdvID]
@iAdvID int
AS
SELECT * FROM tblAdvCategory
WHERE iAdvID=@iAdvID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_Get]    Script Date: 12/28/2011 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_Get]
AS
SELECT * FROM tblAdvCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spAdvCategory_Delete]    Script Date: 12/28/2011 10:35:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/11/2009 4:52:01 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spAdvCategory_Delete]
    @iAdvCategory int
AS
DELETE FROM tblAdvCategory WHERE iAdvCategory=@iAdvCategory
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spConfig_Update]    Script Date: 12/28/2011 10:36:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:20 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spConfig_Update] 
    
@iConfigID int Output,
@sName nvarchar(400),
@sValue nvarchar(4000)
AS
UPDATE tblConfig
SET
    sName=@sName,sValue=@sValue
WHERE iConfigID=@iConfigID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spConfig_Delete]    Script Date: 12/28/2011 10:36:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:20 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spConfig_Delete]
    @iConfigID int
AS
DELETE FROM tblConfig WHERE iConfigID=@iConfigID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spConfig_Insert]    Script Date: 12/28/2011 10:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:20 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spConfig_Insert]
    
@iConfigID int Output,
@sName nvarchar(400),
@sValue nvarchar(4000)
AS
    INSERT INTO tblConfig(sName,sValue)
    VALUES(@sName,@sValue)
    SELECT @iConfigID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spConfig_GetByPK]    Script Date: 12/28/2011 10:36:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:20 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spConfig_GetByPK]
    @iConfigID int
AS
    SELECT * FROM tblConfig
    WHERE iConfigID=@iConfigID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spConfig_Get]    Script Date: 12/28/2011 10:36:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:20 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spConfig_Get]
AS
SELECT * FROM tblConfig
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFeedback_Delete]    Script Date: 12/28/2011 10:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:37:10 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFeedback_Delete]
    @iFeedbackID int
AS
DELETE FROM tblFeedback WHERE iFeedbackID=@iFeedbackID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFeedback_GetByFK_iNewsID]    Script Date: 12/28/2011 10:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:37:10 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFeedback_GetByFK_iNewsID]
@iNewsID int
AS
SELECT * FROM tblFeedback
WHERE iNewsID=@iNewsID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFeedback_Get]    Script Date: 12/28/2011 10:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:37:10 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFeedback_Get]
AS
SELECT * FROM tblFeedback
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFeedback_GetByPK]    Script Date: 12/28/2011 10:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:37:10 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFeedback_GetByPK]
    @iFeedbackID int
AS
    SELECT * FROM tblFeedback
    WHERE iFeedbackID=@iFeedbackID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFeedback_Insert]    Script Date: 12/28/2011 10:38:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:37:10 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFeedback_Insert]
    
@iFeedbackID int Output,
@iNewsID int,
@sName nvarchar(400),
@sEmail nvarchar(400),
@sTitle nvarchar(400),
@sContent ntext,
@tDate datetime,
@bVerified bit
AS
    INSERT INTO tblFeedback(iNewsID,sName,sEmail,sTitle,sContent,tDate,bVerified)
    VALUES(@iNewsID,@sName,@sEmail,@sTitle,@sContent,@tDate,@bVerified)
    SELECT @iFeedbackID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spFeedback_Update]    Script Date: 12/28/2011 10:38:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:37:10 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spFeedback_Update] 
    
@iFeedbackID int Output,
@iNewsID int,
@sName nvarchar(400),
@sEmail nvarchar(400),
@sTitle nvarchar(400),
@sContent ntext,
@tDate datetime,
@bVerified bit
AS
UPDATE tblFeedback
SET
    iNewsID=@iNewsID,sName=@sName,sEmail=@sEmail,sTitle=@sTitle,sContent=@sContent,tDate=@tDate,bVerified=@bVerified
WHERE iFeedbackID=@iFeedbackID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroup_Delete]    Script Date: 12/28/2011 10:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:22 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroup_Delete]
    @iGroupID int
AS
DELETE FROM tblGroup WHERE iGroupID=@iGroupID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroup_Get]    Script Date: 12/28/2011 10:38:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:22 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroup_Get]
AS
SELECT * FROM tblGroup
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroup_Update]    Script Date: 12/28/2011 10:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:22 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroup_Update] 
    
@iGroupID int Output,
@sName nvarchar(400),
@sDesc nvarchar(1000)
AS
UPDATE tblGroup
SET
    sName=@sName,sDesc=@sDesc
WHERE iGroupID=@iGroupID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroup_GetByPK]    Script Date: 12/28/2011 10:38:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:22 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroup_GetByPK]
    @iGroupID int
AS
    SELECT * FROM tblGroup
    WHERE iGroupID=@iGroupID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroup_Insert]    Script Date: 12/28/2011 10:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:1/20/2009 11:00:22 AM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroup_Insert]
    
@iGroupID int Output,
@sName nvarchar(400),
@sDesc nvarchar(1000)
AS
    INSERT INTO tblGroup(sName,sDesc)
    VALUES(@sName,@sDesc)
    SELECT @iGroupID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_Update]    Script Date: 12/28/2011 10:38:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_Update] 
    
@iGroupPermissionID int Output,
@iGroupID int,
@iPermissionID int,
@sValue nvarchar(1000)
AS
UPDATE tblGroupPermission
SET
    iGroupID=@iGroupID,iPermissionID=@iPermissionID,sValue=@sValue
WHERE iGroupPermissionID=@iGroupPermissionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_Insert]    Script Date: 12/28/2011 10:38:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_Insert]
    
@iGroupPermissionID int Output,
@iGroupID int,
@iPermissionID int,
@sValue nvarchar(1000)
AS
    INSERT INTO tblGroupPermission(iGroupID,iPermissionID,sValue)
    VALUES(@iGroupID,@iPermissionID,@sValue)
    SELECT @iGroupPermissionID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_Delete]    Script Date: 12/28/2011 10:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_Delete]
    @iGroupPermissionID int
AS
DELETE FROM tblGroupPermission WHERE iGroupPermissionID=@iGroupPermissionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_Get]    Script Date: 12/28/2011 10:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_Get]
AS
SELECT * FROM tblGroupPermission
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_GetByFK_iPermissionID]    Script Date: 12/28/2011 10:38:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.END----GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_GetByFK_iPermissionID]
@iPermissionID int
AS
SELECT * FROM tblGroupPermission
WHERE iPermissionID=@iPermissionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_GetByPK]    Script Date: 12/28/2011 10:38:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_GetByPK]
    @iGroupPermissionID int
AS
    SELECT * FROM tblGroupPermission
    WHERE iGroupPermissionID=@iGroupPermissionID
GO
/****** Object:  StoredProcedure [thanglongsport_VietGap].[spGroupPermission_GetByFK_iGroupID]    Script Date: 12/28/2011 10:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETBYFK.START--
/*------------------------------------------------------
                INVIGEN beta v1.0
Author: xtrung.net@gmail.com
Write On: 04/27/2008
Create On:4/12/2009 5:51:07 PM
------------------------------------------------------*/

CREATE PROC [thanglongsport_VietGap].[spGroupPermission_GetByFK_iGroupID]
@iGroupID int
AS
SELECT * FROM tblGroupPermission
WHERE iGroupID=@iGroupID
GO
/****** Object:  ForeignKey [FK_tblCosonuoitrong_tblDoituongnuoi]    Script Date: 12/28/2011 10:42:19 ******/
ALTER TABLE [dbo].[tblCosonuoitrong]  WITH CHECK ADD  CONSTRAINT [FK_tblCosonuoitrong_tblDoituongnuoi] FOREIGN KEY([FK_iDoituongnuoiID])
REFERENCES [dbo].[tblDoituongnuoi] ([PK_iDoituongnuoiID])
GO
ALTER TABLE [dbo].[tblCosonuoitrong] CHECK CONSTRAINT [FK_tblCosonuoitrong_tblDoituongnuoi]
GO
/****** Object:  ForeignKey [FK_tblCosonuoitrong_tblHinhthucnuoi]    Script Date: 12/28/2011 10:42:20 ******/
ALTER TABLE [dbo].[tblCosonuoitrong]  WITH CHECK ADD  CONSTRAINT [FK_tblCosonuoitrong_tblHinhthucnuoi] FOREIGN KEY([FK_iHinhthucnuoiID])
REFERENCES [thanglongsport_VietGap].[tblHinhthucnuoi] ([PK_iHinhthucnuoiID])
GO
ALTER TABLE [dbo].[tblCosonuoitrong] CHECK CONSTRAINT [FK_tblCosonuoitrong_tblHinhthucnuoi]
GO
/****** Object:  ForeignKey [FK_tblCosonuoitrong_tblQuanHuyen]    Script Date: 12/28/2011 10:42:20 ******/
ALTER TABLE [dbo].[tblCosonuoitrong]  WITH CHECK ADD  CONSTRAINT [FK_tblCosonuoitrong_tblQuanHuyen] FOREIGN KEY([FK_iQuanHuyenID])
REFERENCES [thanglongsport_VietGap].[tblQuanHuyen] ([PK_iQuanHuyenID])
GO
ALTER TABLE [dbo].[tblCosonuoitrong] CHECK CONSTRAINT [FK_tblCosonuoitrong_tblQuanHuyen]
GO
/****** Object:  ForeignKey [FK_tblCosonuoitrong_tblToado]    Script Date: 12/28/2011 10:42:21 ******/
ALTER TABLE [dbo].[tblCosonuoitrong]  WITH CHECK ADD  CONSTRAINT [FK_tblCosonuoitrong_tblToado] FOREIGN KEY([FK_iToadoID])
REFERENCES [dbo].[tblToado] ([PK_iToadoID])
GO
ALTER TABLE [dbo].[tblCosonuoitrong] CHECK CONSTRAINT [FK_tblCosonuoitrong_tblToado]
GO
/****** Object:  ForeignKey [FK_tblCosonuoitrong_tblUser]    Script Date: 12/28/2011 10:42:22 ******/
ALTER TABLE [dbo].[tblCosonuoitrong]  WITH CHECK ADD  CONSTRAINT [FK_tblCosonuoitrong_tblUser] FOREIGN KEY([FK_iUserID])
REFERENCES [dbo].[tblUser] ([iUserID])
GO
ALTER TABLE [dbo].[tblCosonuoitrong] CHECK CONSTRAINT [FK_tblCosonuoitrong_tblUser]
GO
/****** Object:  ForeignKey [FK_tblDocument_tblLoaivanban]    Script Date: 12/28/2011 10:42:36 ******/
ALTER TABLE [dbo].[tblDocument]  WITH CHECK ADD  CONSTRAINT [FK_tblDocument_tblLoaivanban] FOREIGN KEY([FK_iLoaivanbanID])
REFERENCES [thanglongsport_VietGap].[tblLoaivanban] ([PK_iLoaivanbanID])
GO
ALTER TABLE [dbo].[tblDocument] CHECK CONSTRAINT [FK_tblDocument_tblLoaivanban]
GO
/****** Object:  ForeignKey [FK_tblGroupPermission_tblGroup]    Script Date: 12/28/2011 10:42:57 ******/
ALTER TABLE [dbo].[tblGroupPermission]  WITH CHECK ADD  CONSTRAINT [FK_tblGroupPermission_tblGroup] FOREIGN KEY([iGroupID])
REFERENCES [dbo].[tblGroup] ([iGroupID])
GO
ALTER TABLE [dbo].[tblGroupPermission] CHECK CONSTRAINT [FK_tblGroupPermission_tblGroup]
GO
/****** Object:  ForeignKey [FK_tblPollAnswer_tblPoll]    Script Date: 12/28/2011 10:43:25 ******/
ALTER TABLE [dbo].[tblPollAnswer]  WITH CHECK ADD  CONSTRAINT [FK_tblPollAnswer_tblPoll] FOREIGN KEY([iPollID])
REFERENCES [dbo].[tblPoll] ([iPollID])
GO
ALTER TABLE [dbo].[tblPollAnswer] CHECK CONSTRAINT [FK_tblPollAnswer_tblPoll]
GO
/****** Object:  ForeignKey [FK_tblRate_tblNews]    Script Date: 12/28/2011 10:43:37 ******/
ALTER TABLE [dbo].[tblRate]  WITH CHECK ADD  CONSTRAINT [FK_tblRate_tblNews] FOREIGN KEY([iNewsID])
REFERENCES [dbo].[tblNews] ([iNewsID])
GO
ALTER TABLE [dbo].[tblRate] CHECK CONSTRAINT [FK_tblRate_tblNews]
GO
/****** Object:  ForeignKey [FK_tblUser_tblGroup]    Script Date: 12/28/2011 10:43:53 ******/
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblGroup] FOREIGN KEY([iGroupID])
REFERENCES [dbo].[tblGroup] ([iGroupID])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblGroup]
GO
/****** Object:  ForeignKey [FK_tblAonuoi_tblCosonuoitrong]    Script Date: 12/28/2011 10:44:00 ******/
ALTER TABLE [thanglongsport_VietGap].[tblAonuoi]  WITH CHECK ADD  CONSTRAINT [FK_tblAonuoi_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoitrongID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblAonuoi] CHECK CONSTRAINT [FK_tblAonuoi_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tblBaocaokhacphucloi_tblCosonuoitrong]    Script Date: 12/28/2011 10:44:06 ******/
ALTER TABLE [thanglongsport_VietGap].[tblBaocaokhacphucloi]  WITH CHECK ADD  CONSTRAINT [FK_tblBaocaokhacphucloi_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoiID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblBaocaokhacphucloi] CHECK CONSTRAINT [FK_tblBaocaokhacphucloi_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tblBaocaokhacphucloiChitiet_tblBaocaokhacphucloi]    Script Date: 12/28/2011 10:44:12 ******/
ALTER TABLE [thanglongsport_VietGap].[tblBaocaokhacphucloiChitiet]  WITH CHECK ADD  CONSTRAINT [FK_tblBaocaokhacphucloiChitiet_tblBaocaokhacphucloi] FOREIGN KEY([FK_iBaocaokhacphucloiID])
REFERENCES [thanglongsport_VietGap].[tblBaocaokhacphucloi] ([PK_iBaocaokhacphucloiID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblBaocaokhacphucloiChitiet] CHECK CONSTRAINT [FK_tblBaocaokhacphucloiChitiet_tblBaocaokhacphucloi]
GO
/****** Object:  ForeignKey [FK__tblChitie__FK_iM__6E765879]    Script Date: 12/28/2011 10:44:23 ******/
ALTER TABLE [thanglongsport_VietGap].[tblChitieu]  WITH CHECK ADD  CONSTRAINT [FK__tblChitie__FK_iM__6E765879] FOREIGN KEY([FK_iMucdoID])
REFERENCES [thanglongsport_VietGap].[tblMucdo] ([PK_iMucdoID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblChitieu] CHECK CONSTRAINT [FK__tblChitie__FK_iM__6E765879]
GO
/****** Object:  ForeignKey [FK_tblChitieu_tblDanhmucchitieu]    Script Date: 12/28/2011 10:44:24 ******/
ALTER TABLE [thanglongsport_VietGap].[tblChitieu]  WITH CHECK ADD  CONSTRAINT [FK_tblChitieu_tblDanhmucchitieu] FOREIGN KEY([FK_iDanhmucchitieuID])
REFERENCES [thanglongsport_VietGap].[tblDanhmucchitieu] ([PK_iDanhmucchitieuID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblChitieu] CHECK CONSTRAINT [FK_tblChitieu_tblDanhmucchitieu]
GO
/****** Object:  ForeignKey [FK_tblDangkyHoatdongchungnhan_tblTochucchungnhan]    Script Date: 12/28/2011 10:44:46 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDangkyHoatdongchungnhan]  WITH CHECK ADD  CONSTRAINT [FK_tblDangkyHoatdongchungnhan_tblTochucchungnhan] FOREIGN KEY([FK_iTochucchungnhanID])
REFERENCES [thanglongsport_VietGap].[tblTochucchungnhan] ([PK_iTochucchungnhanID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblDangkyHoatdongchungnhan] CHECK CONSTRAINT [FK_tblDangkyHoatdongchungnhan_tblTochucchungnhan]
GO
/****** Object:  ForeignKey [FK_tbDanhgiaketqua_tblChitieu]    Script Date: 12/28/2011 10:44:52 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiaketqua]  WITH CHECK ADD  CONSTRAINT [FK_tbDanhgiaketqua_tblChitieu] FOREIGN KEY([FK_iChitieuID])
REFERENCES [thanglongsport_VietGap].[tblChitieu] ([PK_iChitieuID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiaketqua] CHECK CONSTRAINT [FK_tbDanhgiaketqua_tblChitieu]
GO
/****** Object:  ForeignKey [FK_tbDanhgiaketqua_tblCosonuoitrong]    Script Date: 12/28/2011 10:44:53 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiaketqua]  WITH CHECK ADD  CONSTRAINT [FK_tbDanhgiaketqua_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoiID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiaketqua] CHECK CONSTRAINT [FK_tbDanhgiaketqua_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tbDanhgiaketqua_tblPhuongphapkiemtra]    Script Date: 12/28/2011 10:44:54 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiaketqua]  WITH CHECK ADD  CONSTRAINT [FK_tbDanhgiaketqua_tblPhuongphapkiemtra] FOREIGN KEY([FK_iPhuongphapkiemtraID])
REFERENCES [thanglongsport_VietGap].[tblPhuongphapkiemtra] ([PK_iPhuongphapkiemtraID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiaketqua] CHECK CONSTRAINT [FK_tbDanhgiaketqua_tblPhuongphapkiemtra]
GO
/****** Object:  ForeignKey [FK__tblDanhgi__FK_iT__43ABF605]    Script Date: 12/28/2011 10:45:04 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiatochucchungnhan]  WITH CHECK ADD FOREIGN KEY([FK_iTochucchungnhanID])
REFERENCES [thanglongsport_VietGap].[tblTochucchungnhan] ([PK_iTochucchungnhanID])
GO
/****** Object:  ForeignKey [FK__tblDanhgi__FK_iT__44A01A3E]    Script Date: 12/28/2011 10:45:05 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiatochucchungnhan]  WITH CHECK ADD FOREIGN KEY([FK_iTruongdoandanhgiaID])
REFERENCES [thanglongsport_VietGap].[tblDanhgiavien] ([PK_iDanhgiavienID])
GO
/****** Object:  ForeignKey [FK_tblDanhgiavien_tblTochucchungnhan]    Script Date: 12/28/2011 10:45:13 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiavien]  WITH CHECK ADD  CONSTRAINT [FK_tblDanhgiavien_tblTochucchungnhan] FOREIGN KEY([FK_iTochucchungnhanID])
REFERENCES [thanglongsport_VietGap].[tblTochucchungnhan] ([PK_iTochucchungnhanID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblDanhgiavien] CHECK CONSTRAINT [FK_tblDanhgiavien_tblTochucchungnhan]
GO
/****** Object:  ForeignKey [FK__tblDoanda__FK_iD__477C86E9]    Script Date: 12/28/2011 10:45:28 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDoandanhgiatochucchungnhan]  WITH CHECK ADD FOREIGN KEY([FK_iDanhgiatochucchungnhanID])
REFERENCES [thanglongsport_VietGap].[tblDanhgiatochucchungnhan] ([PK_iDanhgiatochucchungnhanID])
GO
/****** Object:  ForeignKey [FK__tblDoanda__FK_iD__4870AB22]    Script Date: 12/28/2011 10:45:29 ******/
ALTER TABLE [thanglongsport_VietGap].[tblDoandanhgiatochucchungnhan]  WITH CHECK ADD FOREIGN KEY([FK_iDanhgiavienID])
REFERENCES [thanglongsport_VietGap].[tblDanhgiavien] ([PK_iDanhgiavienID])
GO
/****** Object:  ForeignKey [FK_tblFaqAnswers_tblFaq]    Script Date: 12/28/2011 10:45:40 ******/
ALTER TABLE [thanglongsport_VietGap].[tblFaqAnswers]  WITH CHECK ADD  CONSTRAINT [FK_tblFaqAnswers_tblFaq] FOREIGN KEY([FK_iFaqID])
REFERENCES [thanglongsport_VietGap].[tblFaq] ([PK_iFaqID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblFaqAnswers] CHECK CONSTRAINT [FK_tblFaqAnswers_tblFaq]
GO
/****** Object:  ForeignKey [FK_tblFaqCategory_tblCateFaq]    Script Date: 12/28/2011 10:45:45 ******/
ALTER TABLE [thanglongsport_VietGap].[tblFaqCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblFaqCategory_tblCateFaq] FOREIGN KEY([iCateFaqID])
REFERENCES [thanglongsport_VietGap].[tblCateFaq] ([PK_iFaqCateID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblFaqCategory] CHECK CONSTRAINT [FK_tblFaqCategory_tblCateFaq]
GO
/****** Object:  ForeignKey [FK_tblFaqCategory_tblFaq]    Script Date: 12/28/2011 10:45:45 ******/
ALTER TABLE [thanglongsport_VietGap].[tblFaqCategory]  WITH CHECK ADD  CONSTRAINT [FK_tblFaqCategory_tblFaq] FOREIGN KEY([FK_iFaqID])
REFERENCES [thanglongsport_VietGap].[tblFaq] ([PK_iFaqID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblFaqCategory] CHECK CONSTRAINT [FK_tblFaqCategory_tblFaq]
GO
/****** Object:  ForeignKey [FK_tblGiaytonopkemhoso_tblGiayto]    Script Date: 12/28/2011 10:45:54 ******/
ALTER TABLE [thanglongsport_VietGap].[tblGiaytonopkemhoso]  WITH CHECK ADD  CONSTRAINT [FK_tblGiaytonopkemhoso_tblGiayto] FOREIGN KEY([FK_iGiaytoID])
REFERENCES [thanglongsport_VietGap].[tblGiayto] ([PK_iGiaytoID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblGiaytonopkemhoso] CHECK CONSTRAINT [FK_tblGiaytonopkemhoso_tblGiayto]
GO
/****** Object:  ForeignKey [FK_tblGiaytonopkemhoso_tblHosodangkychungnhan]    Script Date: 12/28/2011 10:45:55 ******/
ALTER TABLE [thanglongsport_VietGap].[tblGiaytonopkemhoso]  WITH CHECK ADD  CONSTRAINT [FK_tblGiaytonopkemhoso_tblHosodangkychungnhan] FOREIGN KEY([PK_iHosodangkychungnhanID])
REFERENCES [thanglongsport_VietGap].[tblHosodangkychungnhan] ([PK_iHosodangkychungnhanID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblGiaytonopkemhoso] CHECK CONSTRAINT [FK_tblGiaytonopkemhoso_tblHosodangkychungnhan]
GO
/****** Object:  ForeignKey [FK_tblHosodangkychungnhan_tblCosonuoitrong]    Script Date: 12/28/2011 10:46:04 ******/
ALTER TABLE [thanglongsport_VietGap].[tblHosodangkychungnhan]  WITH CHECK ADD  CONSTRAINT [FK_tblHosodangkychungnhan_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoiID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblHosodangkychungnhan] CHECK CONSTRAINT [FK_tblHosodangkychungnhan_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tblHosokemtheoTochucchungnhan_tblDangkyHoatdongchungnhan]    Script Date: 12/28/2011 10:46:08 ******/
ALTER TABLE [thanglongsport_VietGap].[tblHosokemtheoTochucchungnhan]  WITH CHECK ADD  CONSTRAINT [FK_tblHosokemtheoTochucchungnhan_tblDangkyHoatdongchungnhan] FOREIGN KEY([FK_iDangkyChungnhanVietGapID])
REFERENCES [thanglongsport_VietGap].[tblDangkyHoatdongchungnhan] ([PK_iDangkyChungnhanVietGapID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblHosokemtheoTochucchungnhan] CHECK CONSTRAINT [FK_tblHosokemtheoTochucchungnhan_tblDangkyHoatdongchungnhan]
GO
/****** Object:  ForeignKey [FK_tblHosokemtheoTochucchungnhan_tblGiayto]    Script Date: 12/28/2011 10:46:09 ******/
ALTER TABLE [thanglongsport_VietGap].[tblHosokemtheoTochucchungnhan]  WITH CHECK ADD  CONSTRAINT [FK_tblHosokemtheoTochucchungnhan_tblGiayto] FOREIGN KEY([FK_iGiaytoID])
REFERENCES [thanglongsport_VietGap].[tblGiayto] ([PK_iGiaytoID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblHosokemtheoTochucchungnhan] CHECK CONSTRAINT [FK_tblHosokemtheoTochucchungnhan_tblGiayto]
GO
/****** Object:  ForeignKey [FK_tblMasovietgap_tblCosonuoitrong]    Script Date: 12/28/2011 10:46:26 ******/
ALTER TABLE [thanglongsport_VietGap].[tblMasovietgap]  WITH CHECK ADD  CONSTRAINT [FK_tblMasovietgap_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoitrongID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblMasovietgap] CHECK CONSTRAINT [FK_tblMasovietgap_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tblMasovietgap_tblTochucchungnhan]    Script Date: 12/28/2011 10:46:26 ******/
ALTER TABLE [thanglongsport_VietGap].[tblMasovietgap]  WITH CHECK ADD  CONSTRAINT [FK_tblMasovietgap_tblTochucchungnhan] FOREIGN KEY([FK_iTochucchungnhanID])
REFERENCES [thanglongsport_VietGap].[tblTochucchungnhan] ([PK_iTochucchungnhanID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblMasovietgap] CHECK CONSTRAINT [FK_tblMasovietgap_tblTochucchungnhan]
GO
/****** Object:  ForeignKey [FK_tblNhatkyAonuoi_tblAonuoi]    Script Date: 12/28/2011 10:46:38 ******/
ALTER TABLE [thanglongsport_VietGap].[tblNhatkyAonuoi]  WITH CHECK ADD  CONSTRAINT [FK_tblNhatkyAonuoi_tblAonuoi] FOREIGN KEY([FK_iAonuoiID])
REFERENCES [thanglongsport_VietGap].[tblAonuoi] ([PK_iAonuoiID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblNhatkyAonuoi] CHECK CONSTRAINT [FK_tblNhatkyAonuoi_tblAonuoi]
GO
/****** Object:  ForeignKey [FK_tblPhat_tblCosonuoitrong]    Script Date: 12/28/2011 10:46:45 ******/
ALTER TABLE [thanglongsport_VietGap].[tblPhat]  WITH CHECK ADD  CONSTRAINT [FK_tblPhat_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoiID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblPhat] CHECK CONSTRAINT [FK_tblPhat_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tblQuanHuyen_tblTinh]    Script Date: 12/28/2011 10:46:59 ******/
ALTER TABLE [thanglongsport_VietGap].[tblQuanHuyen]  WITH CHECK ADD  CONSTRAINT [FK_tblQuanHuyen_tblTinh] FOREIGN KEY([FK_iTinhThanhID])
REFERENCES [dbo].[tblTinh] ([PK_iTinhID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblQuanHuyen] CHECK CONSTRAINT [FK_tblQuanHuyen_tblTinh]
GO
/****** Object:  ForeignKey [FK_tblToadoCosonuoi_tblCosonuoi]    Script Date: 12/28/2011 10:47:04 ******/
ALTER TABLE [thanglongsport_VietGap].[tblToadoCosonuoi]  WITH CHECK ADD  CONSTRAINT [FK_tblToadoCosonuoi_tblCosonuoi] FOREIGN KEY([FK_iCosonuoiID])
REFERENCES [thanglongsport_VietGap].[tblCosonuoi] ([PK_iCosonuoiID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblToadoCosonuoi] CHECK CONSTRAINT [FK_tblToadoCosonuoi_tblCosonuoi]
GO
/****** Object:  ForeignKey [FK_tblToadoCosonuoi_tblCosonuoitrong]    Script Date: 12/28/2011 10:47:05 ******/
ALTER TABLE [thanglongsport_VietGap].[tblToadoCosonuoi]  WITH CHECK ADD  CONSTRAINT [FK_tblToadoCosonuoi_tblCosonuoitrong] FOREIGN KEY([FK_iCosonuoiID])
REFERENCES [dbo].[tblCosonuoitrong] ([PK_iCosonuoitrongID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblToadoCosonuoi] CHECK CONSTRAINT [FK_tblToadoCosonuoi_tblCosonuoitrong]
GO
/****** Object:  ForeignKey [FK_tblTochucchungnhan_tblQuanHuyen]    Script Date: 12/28/2011 10:47:19 ******/
ALTER TABLE [thanglongsport_VietGap].[tblTochucchungnhan]  WITH CHECK ADD  CONSTRAINT [FK_tblTochucchungnhan_tblQuanHuyen] FOREIGN KEY([FK_iQuanHuyenID])
REFERENCES [thanglongsport_VietGap].[tblQuanHuyen] ([PK_iQuanHuyenID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblTochucchungnhan] CHECK CONSTRAINT [FK_tblTochucchungnhan_tblQuanHuyen]
GO
/****** Object:  ForeignKey [FK_tblTochucchungnhan_tblUser]    Script Date: 12/28/2011 10:47:19 ******/
ALTER TABLE [thanglongsport_VietGap].[tblTochucchungnhan]  WITH CHECK ADD  CONSTRAINT [FK_tblTochucchungnhan_tblUser] FOREIGN KEY([FK_iUserID])
REFERENCES [dbo].[tblUser] ([iUserID])
GO
ALTER TABLE [thanglongsport_VietGap].[tblTochucchungnhan] CHECK CONSTRAINT [FK_tblTochucchungnhan_tblUser]
GO
