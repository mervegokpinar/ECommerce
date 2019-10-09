CREATE TABLE [dbo].[tbl_admin_panel_sol_menu_grup](
	[menu_grp_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[menu_grp_baslik] [nvarchar](50) NULL,
	[class] [nvarchar](50) NULL,
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[admin] [numeric](18, 0) NULL DEFAULT ((0)),
	[uye] [numeric](18, 0) NULL DEFAULT ((0))
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[tbl_admin_panel_sol_menu_sayfalar](
	[menu_sayfa_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[menu_grp_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[class] [nvarchar](25) NULL,
	[menu_sayfa_baslik] [nvarchar](25) NULL,
	[dosya_adi] [nvarchar](255) NULL,
	[target] [nvarchar](255) NULL,
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[admin] [numeric](18, 0) NULL DEFAULT ((0)),
	[uye] [numeric](18, 0) NULL DEFAULT ((0))
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tbl_admin_uyeler](
	[admin_uye_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[admin_uye_tipi_id] [numeric](18, 0) DEFAULT ((0)) NULL,
	[admin_uye_uid] [uniqueidentifier] DEFAULT (newid()) NULL,
	[admin_kayit_tarihi] [datetime] DEFAULT (getdate()) NULL,
	[admin_giris_tarihi] [datetime] DEFAULT (getdate()) NULL,
	[admin_giris_sayac] [numeric](18, 0) DEFAULT ((0)) NULL,
	[admin_isim] [nvarchar](255) NULL,
	[admin_soyisim] [nvarchar](255) NULL,
	[admin_email] [nvarchar](255) NULL,
	[admin_kullanici_adi] [nvarchar](255) NULL,
	[admin_sifre] [nvarchar](255) NULL,
	[admin_cep_telefonu] [nvarchar](255) NULL,
	[admin_telefon] [nvarchar](255) NULL,
	[admin_durumu] [numeric](18, 0) DEFAULT ((1)) NULL,
	[admin_aktiv_kod] [nvarchar](255) NULL,
	[admin_sil] [numeric](18, 0) DEFAULT ((0))NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tbl_admin_uye_tipleri](
	[tip_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[uid] [uniqueidentifier] NULL DEFAULT (newid()),
	[tip_adi] [nvarchar](255) NULL,
	[aciklama] [nvarchar](4000) NULL,
	[etiket] [nvarchar](4000) NULL,
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[logo] [nvarchar](255) NULL,
	[sirasi] [numeric](18, 0) NULL DEFAULT ((0)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[class] [nvarchar](255) NULL DEFAULT (N'paper-products')
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tbl_admin_yetkiler](
	[kayit_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[sayfa_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[yetkisi] [numeric](18, 0) NULL DEFAULT ((0)),
	[admin_uye_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[grp] [numeric](18, 0) NULL DEFAULT ((0))
) ON [PRIMARY]

GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_eticaret_ana_gruplar](
	[uid] [uniqueidentifier] NULL DEFAULT (newid()),
	[ana_grp_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ana_grp_adi] [nvarchar](255) NULL,
	[aciklama] [nvarchar](4000) NULL,
	[kayit_tarihi] [datetime] NULL DEFAULT (getdate()),
	[duzeltme_tarihi] [datetime] NULL,
	[kayit_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[duzeltme_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0))	
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tbl_eticaret_alt_gruplar](
	[uid] [uniqueidentifier] NULL DEFAULT (newid()),
	[ana_grp_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[alt_grp_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[alt_grp_adi] [nvarchar](255) NULL,
	[aciklama] [nvarchar](4000) NULL,
	[kayit_tarihi] [datetime] NULL DEFAULT (getdate()),
	[duzeltme_tarihi] [datetime] NULL,
	[kayit_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[duzeltme_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0))	
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[tbl_eticaret_markalar](
	[uid] [uniqueidentifier] NULL DEFAULT (newid()),
	[marka_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[marka_adi] [nvarchar](255) NULL,
	[aciklama] [nvarchar](4000) NULL,
	[kayit_tarihi] [datetime] NULL DEFAULT (getdate()),
	[duzeltme_tarihi] [datetime] NULL,
	[kayit_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[duzeltme_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0))	
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[tbl_eticaret_modeller](
	[uid] [uniqueidentifier] NULL DEFAULT (newid()),
	[marka_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[model_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[model_adi] [nvarchar](255) NULL,
	[aciklama] [nvarchar](4000) NULL,
	[kayit_tarihi] [datetime] NULL DEFAULT (getdate()),
	[duzeltme_tarihi] [datetime] NULL,
	[kayit_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[duzeltme_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0))	
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[tbl_eticaret_urunler](
	[uid] [uniqueidentifier] NULL DEFAULT (newid()),
	[urun_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[ana_grp_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[alt_grp_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[marka_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[model_id] [numeric](18, 0) DEFAULT ((0)),
	[urun_adi] [nvarchar](255) NULL,
	[aciklama] [nvarchar](4000) NULL,
	[fiyati] float DEFAULT ((0)),
	[model_yili] [nvarchar](4000) NULL,
	[kayit_tarihi] [datetime] NULL DEFAULT (getdate()),
	[duzeltme_tarihi] [datetime] NULL,
	[kayit_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[duzeltme_yapan_id] [numeric](18, 0) NULL DEFAULT ((0)),
	[durumu] [numeric](18, 0) NULL DEFAULT ((1)),
	[sil] [numeric](18, 0) NULL DEFAULT ((0)),
	[sirasi] [numeric](18, 0) NULL DEFAULT ((1)),
	[firma_id] [numeric](18, 0) NULL DEFAULT ((0))	
) ON [PRIMARY]

GO

CREATE VIEW [dbo].[view_admin_panel_sol_menu_gruplar]
AS
SELECT     TOP (100) PERCENT tbl_admin_panel_sol_menu_sayfalar.menu_grp_id, tbl_admin_panel_sol_menu_grup.menu_grp_baslik, 
                      tbl_admin_panel_sol_menu_grup.class, tbl_admin_panel_sol_menu_sayfalar.sirasi AS sayfa_sirasi, 
                      tbl_admin_panel_sol_menu_grup.sirasi AS grup_sirasi, tbl_admin_panel_sol_menu_sayfalar.admin AS sayfa_admin, 
                      tbl_admin_panel_sol_menu_grup.admin AS grp_admin
FROM         tbl_admin_panel_sol_menu_sayfalar INNER JOIN
                      tbl_admin_panel_sol_menu_grup ON 
                      tbl_admin_panel_sol_menu_sayfalar.menu_grp_id = tbl_admin_panel_sol_menu_grup.menu_grp_id
WHERE     (tbl_admin_panel_sol_menu_sayfalar.durumu = 1) AND (tbl_admin_panel_sol_menu_sayfalar.sil = 0) AND 
                      (tbl_admin_panel_sol_menu_grup.durumu = 1) AND (tbl_admin_panel_sol_menu_grup.sil = 0) AND 
                      (tbl_admin_panel_sol_menu_sayfalar.uye = 0) AND (tbl_admin_panel_sol_menu_grup.uye = 0)
GROUP BY tbl_admin_panel_sol_menu_sayfalar.menu_grp_id, tbl_admin_panel_sol_menu_grup.menu_grp_baslik, 
                      tbl_admin_panel_sol_menu_grup.sirasi, tbl_admin_panel_sol_menu_grup.class, tbl_admin_panel_sol_menu_sayfalar.sirasi, 
                      tbl_admin_panel_sol_menu_sayfalar.admin, tbl_admin_panel_sol_menu_grup.admin
ORDER BY grup_sirasi