USE [master]
GO
/****** Object:  Database [CS487_488_2016_StockTrainer_v3]    Script Date: 04/10/2017 22:11:23 ******/
CREATE DATABASE [CS487_488_2016_StockTrainer_v3] ON  PRIMARY 
( NAME = N'CS487_488_2016_StockTrainer_v3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CS487_488_2016_StockTrainer_v3.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CS487_488_2016_StockTrainer_v3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CS487_488_2016_StockTrainer_v3_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CS487_488_2016_StockTrainer_v3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET ARITHABORT OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET  DISABLE_BROKER
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET  READ_WRITE
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET  MULTI_USER
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CS487_488_2016_StockTrainer_v3] SET DB_CHAINING OFF
GO
USE [CS487_488_2016_StockTrainer_v3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Fullname] [varchar](50) NOT NULL,
	[FirstSecurityQuestion] [varchar](50) NOT NULL,
	[FirstSecurityAnswer] [varchar](50) NOT NULL,
	[SecondSecurityQuestion] [varchar](50) NOT NULL,
	[SecondSecurityAnswer] [varchar](50) NOT NULL,
	[Investment] [decimal](20, 2) NOT NULL,
	[AvailableCash] [decimal](20, 2) NOT NULL,
	[TotalTrans] [bigint] NOT NULL,
	[PositiveTrans] [bigint] NOT NULL,
	[NegativeTrans] [bigint] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock](
	[Ticker] [varchar](10) NOT NULL,
	[EquityName] [nvarchar](100) NOT NULL,
	[Price] [decimal](20, 2) NOT NULL,
	[PrevClosePrice] [decimal](20, 2) NOT NULL,
	[HighPrice] [decimal](20, 2) NOT NULL,
	[LowPrice] [decimal](20, 2) NOT NULL,
	[OpenPrice] [decimal](20, 2) NOT NULL,
	[Volume] [bigint] NOT NULL,
	[Change] [decimal](20, 2) NOT NULL,
	[MarketCap] [bigint] NOT NULL,
	[52-week_High] [decimal](20, 2) NOT NULL,
	[52-week_Low] [decimal](20, 2) NOT NULL,
	[AskPrice] [decimal](20, 2) NOT NULL,
	[BidPrice] [decimal](20, 2) NOT NULL,
	[AskSize] [bigint] NOT NULL,
	[BidSize] [bigint] NOT NULL,
	[1-Year_Return] [decimal](20, 2) NOT NULL,
	[Beta] [decimal](20, 2) NOT NULL,
	[PE_Ratio] [decimal](20, 2) NOT NULL,
	[Dividend] [decimal](20, 2) NOT NULL,
	[DividendPercent] [decimal](20, 2) NOT NULL,
	[UpdateChecker] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Ticker] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[AutoUpdateTimer] [int] NOT NULL,
	[EnforceMarketTimings] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InsiderTrades]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InsiderTrades](
	[InsiderTradeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Ticker] [varchar](50) NOT NULL,
	[InsiderDetail] [nvarchar](100) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[Price] [decimal](20, 2) NOT NULL,
	[Total] [bigint] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_InsiderTrades] PRIMARY KEY CLUSTERED 
(
	[InsiderTradeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WatchStock]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WatchStock](
	[Username] [varchar](50) NOT NULL,
	[Ticker] [varchar](10) NOT NULL,
 CONSTRAINT [PK_WatchStock_1] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Ticker] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Ticker] [varchar](10) NOT NULL,
	[EquityName] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[NumStocks] [bigint] NOT NULL,
	[Price] [decimal](20, 2) NOT NULL,
	[GainLoss] [decimal](20, 2) NULL,
	[GLPercent] [decimal](20, 2) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[History]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[Ticker] [varchar](10) NOT NULL,
	[Time] [datetime] NOT NULL,
	[HistoryPrice] [decimal](20, 2) NOT NULL,
 CONSTRAINT [PK_History_1] PRIMARY KEY CLUSTERED 
(
	[Ticker] ASC,
	[Time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Porfolio]    Script Date: 04/10/2017 22:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Porfolio](
	[Username] [varchar](50) NOT NULL,
	[Ticker] [varchar](10) NOT NULL,
	[Cost] [decimal](20, 2) NOT NULL,
	[NumStocks] [bigint] NOT NULL,
 CONSTRAINT [PK_Porfolio] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[Ticker] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_Settings_AutoUpdateTimer]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_AutoUpdateTimer]  DEFAULT ((90000)) FOR [AutoUpdateTimer]
GO
/****** Object:  Default [DF_Settings_EnforceMarketTimings]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[Settings] ADD  CONSTRAINT [DF_Settings_EnforceMarketTimings]  DEFAULT ((0)) FOR [EnforceMarketTimings]
GO
/****** Object:  ForeignKey [FK_WatchStock_Account]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[WatchStock]  WITH CHECK ADD  CONSTRAINT [FK_WatchStock_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[WatchStock] CHECK CONSTRAINT [FK_WatchStock_Account]
GO
/****** Object:  ForeignKey [FK_WatchStock_Stock]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[WatchStock]  WITH CHECK ADD  CONSTRAINT [FK_WatchStock_Stock] FOREIGN KEY([Ticker])
REFERENCES [dbo].[Stock] ([Ticker])
GO
ALTER TABLE [dbo].[WatchStock] CHECK CONSTRAINT [FK_WatchStock_Stock]
GO
/****** Object:  ForeignKey [FK_Transactions_Account]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Account]
GO
/****** Object:  ForeignKey [FK_History_Stock1]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Stock1] FOREIGN KEY([Ticker])
REFERENCES [dbo].[Stock] ([Ticker])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Stock1]
GO
/****** Object:  ForeignKey [FK_Porfolio_Account1]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[Porfolio]  WITH CHECK ADD  CONSTRAINT [FK_Porfolio_Account1] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Porfolio] CHECK CONSTRAINT [FK_Porfolio_Account1]
GO
/****** Object:  ForeignKey [FK_Porfolio_Stock]    Script Date: 04/10/2017 22:11:23 ******/
ALTER TABLE [dbo].[Porfolio]  WITH CHECK ADD  CONSTRAINT [FK_Porfolio_Stock] FOREIGN KEY([Ticker])
REFERENCES [dbo].[Stock] ([Ticker])
GO
ALTER TABLE [dbo].[Porfolio] CHECK CONSTRAINT [FK_Porfolio_Stock]
GO
