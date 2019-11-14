USE [BD_NFC]
GO
/****** Object:  Table [dbo].[convite]    Script Date: 14/11/2019 17:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[convite](
	[cd_convite] [bigint] NOT NULL,
	[mensagem_convite] [nchar](30) NULL,
 CONSTRAINT [PK_convite] PRIMARY KEY CLUSTERED 
(
	[cd_convite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jogo]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jogo](
	[cd_jogo] [bigint] NOT NULL,
	[nome] [nchar](10) NULL,
	[data] [date] NULL,
	[hora] [time](7) NULL,
	[local] [nchar](20) NULL,
	[numJogadores] [bigint] NULL,
	[pontuacao] [int] NULL,
 CONSTRAINT [PK_jogo] PRIMARY KEY CLUSTERED 
(
	[cd_jogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jogo_lembrete]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jogo_lembrete](
	[cd_jogo] [bigint] NOT NULL,
	[cd_lembrete] [bigint] NOT NULL,
 CONSTRAINT [PK_cd_lembrete] PRIMARY KEY CLUSTERED 
(
	[cd_jogo] ASC,
	[cd_lembrete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lembrete]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lembrete](
	[cd_lembrete] [bigint] NOT NULL,
	[mensagem_lembrete] [nchar](30) NULL,
 CONSTRAINT [PK_lembrete] PRIMARY KEY CLUSTERED 
(
	[cd_lembrete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sala]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sala](
	[cd_sala] [bigint] NOT NULL,
	[cd_jogo] [nchar](10) NULL,
	[cd_usuario] [bigint] NULL,
	[nome] [nchar](10) NULL,
 CONSTRAINT [PK_sala] PRIMARY KEY CLUSTERED 
(
	[cd_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_convite_jogo]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_convite_jogo](
	[cd_convite] [bigint] NOT NULL,
	[cd_jogo] [bigint] NOT NULL,
 CONSTRAINT [PK_cd_jogo] PRIMARY KEY CLUSTERED 
(
	[cd_jogo] ASC,
	[cd_convite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[cd_usuario] [bigint] NOT NULL,
	[login] [nchar](30) NOT NULL,
	[senha] [nchar](10) NOT NULL,
	[cidade] [nchar](30) NULL,
	[telefone] [nchar](11) NULL,
	[email] [nchar](20) NULL,
	[dataNasc] [date] NULL,
	[posicao] [nchar](10) NULL,
	[cd_convite] [bigint] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[cd_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario_jogo]    Script Date: 14/11/2019 17:46:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_jogo](
	[cd_usuario] [bigint] NOT NULL,
	[cd_jogo] [bigint] NOT NULL,
 CONSTRAINT [PK_cd_usuario] PRIMARY KEY CLUSTERED 
(
	[cd_jogo] ASC,
	[cd_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sala]  WITH CHECK ADD  CONSTRAINT [FK_sala_jogo] FOREIGN KEY([cd_sala])
REFERENCES [dbo].[jogo] ([cd_jogo])
GO
ALTER TABLE [dbo].[sala] CHECK CONSTRAINT [FK_sala_jogo]
GO
ALTER TABLE [dbo].[sala]  WITH CHECK ADD  CONSTRAINT [FK_sala_usuario] FOREIGN KEY([cd_usuario])
REFERENCES [dbo].[usuario] ([cd_usuario])
GO
ALTER TABLE [dbo].[sala] CHECK CONSTRAINT [FK_sala_usuario]
GO
ALTER TABLE [dbo].[tb_convite_jogo]  WITH CHECK ADD  CONSTRAINT [FK_tb_convite_jogo_convite] FOREIGN KEY([cd_convite])
REFERENCES [dbo].[convite] ([cd_convite])
GO
ALTER TABLE [dbo].[tb_convite_jogo] CHECK CONSTRAINT [FK_tb_convite_jogo_convite]
GO
ALTER TABLE [dbo].[tb_convite_jogo]  WITH CHECK ADD  CONSTRAINT [FK_tb_convite_jogo_jogo] FOREIGN KEY([cd_jogo])
REFERENCES [dbo].[jogo] ([cd_jogo])
GO
ALTER TABLE [dbo].[tb_convite_jogo] CHECK CONSTRAINT [FK_tb_convite_jogo_jogo]
GO
ALTER TABLE [dbo].[usuario_jogo]  WITH CHECK ADD  CONSTRAINT [FK_usuario_jogo_jogo] FOREIGN KEY([cd_jogo])
REFERENCES [dbo].[jogo] ([cd_jogo])
GO
ALTER TABLE [dbo].[usuario_jogo] CHECK CONSTRAINT [FK_usuario_jogo_jogo]
GO
ALTER TABLE [dbo].[usuario_jogo]  WITH CHECK ADD  CONSTRAINT [FK_usuario_jogo_usuario] FOREIGN KEY([cd_usuario])
REFERENCES [dbo].[usuario] ([cd_usuario])
GO
ALTER TABLE [dbo].[usuario_jogo] CHECK CONSTRAINT [FK_usuario_jogo_usuario]
GO
