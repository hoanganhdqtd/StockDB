USE [CS487_488_2016_StockTrainer_v2]
GO
/****** Object:  Table [dbo].[InsiderTrades]    Script Date: 02/28/2017 15:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InsiderTrades](
	[ID] [bigint] NOT NULL,
	[Tick] [varchar](50) NOT NULL,
	[InsiderDetail] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Quantity] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_InsiderTrades] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account]    Script Date: 02/28/2017 15:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [bigint] NOT NULL,
	[Investment] [float] NOT NULL,
	[AvailableCash] [float] NOT NULL,
	[TotalTrans] [float] NOT NULL,
	[PositiveTrans] [bigint] NOT NULL,
	[NegativeTrans] [bigint] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 02/28/2017 15:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stock](
	[Ticker] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[PrevClosePrice] [float] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Ticker] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WatchStock]    Script Date: 02/28/2017 15:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WatchStock](
	[ID] [bigint] NOT NULL,
	[AccountID] [bigint] NOT NULL,
	[StockTicker] [varchar](10) NOT NULL,
 CONSTRAINT [PK_WatchStock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 02/28/2017 15:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Transactions](
	[ID] [bigint] NOT NULL,
	[AccountID] [bigint] NOT NULL,
	[Ticker] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Num] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[AvrBuyPrice] [float] NOT NULL,
	[GainLoss] [float] NULL,
	[GLPercent] [float] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Porfolio]    Script Date: 02/28/2017 15:34:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Porfolio](
	[ID] [bigint] NOT NULL,
	[AccountID] [bigint] NOT NULL,
	[Cost] [float] NOT NULL,
	[Num] [bigint] NOT NULL,
	[StockTicker] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Porfolio] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Porfolio_Account]    Script Date: 02/28/2017 15:34:30 ******/
ALTER TABLE [dbo].[Porfolio]  WITH CHECK ADD  CONSTRAINT [FK_Porfolio_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Porfolio] CHECK CONSTRAINT [FK_Porfolio_Account]
GO
/****** Object:  ForeignKey [FK_Porfolio_Stock]    Script Date: 02/28/2017 15:34:30 ******/
ALTER TABLE [dbo].[Porfolio]  WITH CHECK ADD  CONSTRAINT [FK_Porfolio_Stock] FOREIGN KEY([StockTicker])
REFERENCES [dbo].[Stock] ([Ticker])
GO
ALTER TABLE [dbo].[Porfolio] CHECK CONSTRAINT [FK_Porfolio_Stock]
GO
/****** Object:  ForeignKey [FK_Transactions_Account]    Script Date: 02/28/2017 15:34:30 ******/
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Account]
GO
/****** Object:  ForeignKey [FK_WatchStock_Account]    Script Date: 02/28/2017 15:34:30 ******/
ALTER TABLE [dbo].[WatchStock]  WITH CHECK ADD  CONSTRAINT [FK_WatchStock_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[WatchStock] CHECK CONSTRAINT [FK_WatchStock_Account]
GO
/****** Object:  ForeignKey [FK_WatchStock_Stock]    Script Date: 02/28/2017 15:34:30 ******/
ALTER TABLE [dbo].[WatchStock]  WITH CHECK ADD  CONSTRAINT [FK_WatchStock_Stock] FOREIGN KEY([StockTicker])
REFERENCES [dbo].[Stock] ([Ticker])
GO
ALTER TABLE [dbo].[WatchStock] CHECK CONSTRAINT [FK_WatchStock_Stock]
GO
