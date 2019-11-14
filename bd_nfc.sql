USE [db_nfc]
GO
/****** Object:  Table [dbo].[tb_jogo]    Script Date: 14/11/2019 15:41:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_jogo](
	[id] [bigint] NOT NULL,
	[nome] [varchar](50) NULL,
	[data] [date] NULL,
	[id_sala] [bigint] NULL,
 CONSTRAINT [PK_tb_jogo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_sala]    Script Date: 14/11/2019 15:41:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_sala](
	[id] [bigint] NOT NULL,
	[nome] [varchar](50) NULL,
 CONSTRAINT [PK_tb_sala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 14/11/2019 15:41:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[id] [bigint] NOT NULL,
	[login] [varchar](50) NULL,
	[senha] [varchar](50) NULL,
 CONSTRAINT [PK_tb_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_usuario_jogo]    Script Date: 14/11/2019 15:41:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario_jogo](
	[id_usuario] [bigint] NOT NULL,
	[id_jogo] [bigint] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_jogo]  WITH CHECK ADD  CONSTRAINT [FK_tb_jogo_tb_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[tb_sala] ([id])
GO
ALTER TABLE [dbo].[tb_jogo] CHECK CONSTRAINT [FK_tb_jogo_tb_sala]
GO
ALTER TABLE [dbo].[tb_usuario_jogo]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_jogo_tb_jogo] FOREIGN KEY([id_jogo])
REFERENCES [dbo].[tb_jogo] ([id])
GO
ALTER TABLE [dbo].[tb_usuario_jogo] CHECK CONSTRAINT [FK_tb_usuario_jogo_tb_jogo]
GO
ALTER TABLE [dbo].[tb_usuario_jogo]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_jogo_tb_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tb_usuario] ([id])
GO
ALTER TABLE [dbo].[tb_usuario_jogo] CHECK CONSTRAINT [FK_tb_usuario_jogo_tb_usuario]
GO
