USE [Rusia2018]
GO
/****** Object:  Table [dbo].[Arbitro]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arbitro](
	[idArbitro] [int] NOT NULL,
	[nomArbitro] [varchar](100) NOT NULL,
	[principal] [bit] NOT NULL,
	[pais] [varchar](50) NULL,
	[idConfederacion] [int] NULL,
 CONSTRAINT [PK_Arbitro] PRIMARY KEY CLUSTERED 
(
	[idArbitro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Confederacion]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Confederacion](
	[idConfederacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Confederacion] PRIMARY KEY CLUSTERED 
(
	[idConfederacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Continente]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continente](
	[idContinente] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Continente] PRIMARY KEY CLUSTERED 
(
	[idContinente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuentro]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuentro](
	[idEncuentro] [int] IDENTITY(1,1) NOT NULL,
	[idEstadio] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idPaisL] [int] NOT NULL,
	[golesPaisL] [int] NOT NULL,
	[idPaisV] [int] NOT NULL,
	[golesPaisV] [int] NOT NULL,
	[idArbitro] [int] NOT NULL,
	[idLinea1] [int] NULL,
	[idLinea2] [int] NULL,
	[idAsistente] [int] NULL,
	[idFase] [int] NOT NULL,
 CONSTRAINT [PK_Encuentro] PRIMARY KEY CLUSTERED 
(
	[idEncuentro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encuentro_Jugador]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encuentro_Jugador](
	[idEncuentro] [int] NOT NULL,
	[idJugador] [int] NOT NULL,
	[arranco] [bit] NOT NULL,
	[fueCambiado] [int] NOT NULL,
	[porQuien] [int] NULL,
	[recibioAmarilla1] [bit] NULL,
	[reciibioAmarilla2] [bit] NULL,
	[recibioRojas] [bit] NULL,
 CONSTRAINT [PK_Encuentro_Jugador] PRIMARY KEY CLUSTERED 
(
	[idEncuentro] ASC,
	[idJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estadio]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadio](
	[idEstadio] [int] IDENTITY(1,1) NOT NULL,
	[nomEstadio] [varchar](50) NOT NULL,
	[aforo] [int] NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Estadio] PRIMARY KEY CLUSTERED 
(
	[idEstadio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fase]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fase](
	[idFase] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Fase] PRIMARY KEY CLUSTERED 
(
	[idFase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gol]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gol](
	[idGol] [int] IDENTITY(1,1) NOT NULL,
	[idEncuentro] [int] NOT NULL,
	[idJugador] [int] NOT NULL,
	[minuto] [int] NOT NULL,
	[dePenal] [bit] NULL,
	[idModoGol] [int] NOT NULL,
 CONSTRAINT [PK_Gol] PRIMARY KEY CLUSTERED 
(
	[idGol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[idGrupo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [char](1) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[idGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jugador]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugador](
	[idJugador] [int] IDENTITY(1,1) NOT NULL,
	[idPais] [int] NULL,
	[nomJugador] [varchar](100) NULL,
	[posicion] [varchar](50) NULL,
	[edad] [int] NULL,
	[club] [varchar](50) NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[idJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoGol]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoGol](
	[idModoGol] [int] IDENTITY(1,1) NOT NULL,
	[modoGol] [varchar](50) NULL,
 CONSTRAINT [PK_ModoGol] PRIMARY KEY CLUSTERED 
(
	[idModoGol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [int] IDENTITY(1,1) NOT NULL,
	[nomPais] [varchar](50) NOT NULL,
	[idTecnico] [int] NOT NULL,
	[idGrupo] [int] NOT NULL,
	[idContinente] [int] NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tecnico]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tecnico](
	[idTecnico] [int] IDENTITY(1,1) NOT NULL,
	[nomTecnico] [varchar](100) NOT NULL,
	[nacionalidad] [varchar](50) NOT NULL,
	[fechaNacimiento] [date] NULL,
 CONSTRAINT [PK_Tecnico] PRIMARY KEY CLUSTERED 
(
	[idTecnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/09/2024 19:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (1, N'Néstor Pitana', 1, N'Argentino ', 1)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (2, N'Sandro Ricci', 1, N'Brasileño ', 1)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (3, N'Wilmar Roldán', 1, N'Colombiano', 1)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (4, N'Julio Bascuñán', 1, N'Chileno   ', 1)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (5, N'Enrique Cáceres', 1, N'Paraguayo ', 1)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (6, N'Andrés Cunha', 1, N'Uruguayo  ', 1)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (7, N'César Arutor Ramos', 1, N'Mexicano  ', 2)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (8, N'Ricardo Montero', 1, N'Costarricense', 2)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (9, N'John Pitti', 1, N'Panameño', 2)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (10, N'Joel Aguilar', 1, N'Salvadoreño', 2)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (11, N'Mark Geiger', 1, N'Estadounidense', 2)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (12, N'Jair Marrufo', 1, N'Estadounidense', 2)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (13, N'Felix Brych', 1, N'Alemán', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (14, N'Cüneyt Cakir', 1, N'Turco', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (15, N'Sergey Karasev', 1, N'Ruso', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (16, N'Bjorn Kuipers', 1, N'Holandés', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (17, N'Szymon Marciniak', 1, N'Polaco', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (18, N'Antonio Miguel Mateu Lahoz', 1, N'Español', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (19, N'Milorad Mazic', 1, N'Serbio', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (20, N'Gianluca Rocchi', 1, N'Italiano', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (21, N'Damir Skomina', 1, N'Esloveno', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (22, N'Clement Turpin', 1, N'Francés', 3)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (23, N'Nawaf Shukralla', 1, N'', 4)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (24, N'Ravshan Irmatov', 1, NULL, 4)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (25, N'Ryuji Sato', 1, NULL, 4)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (26, N'Mohammed Abdulla Hassan', 1, NULL, 4)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (27, N'Alireza Faghani', 1, NULL, 4)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (28, N'Ghead Grisha', 1, NULL, 5)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (29, N'Janny Sikazwe', 1, NULL, 5)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (30, N'Bakary Gassama', 1, NULL, 5)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (31, N'Malang Diedhiou', 1, NULL, 5)
INSERT [dbo].[Arbitro] ([idArbitro], [nomArbitro], [principal], [pais], [idConfederacion]) VALUES (32, N'Matthew Conger', 1, NULL, 6)
GO
SET IDENTITY_INSERT [dbo].[Confederacion] ON 

INSERT [dbo].[Confederacion] ([idConfederacion], [descripcion]) VALUES (1, N'CONMEBOL')
INSERT [dbo].[Confederacion] ([idConfederacion], [descripcion]) VALUES (2, N'CONCACAF')
INSERT [dbo].[Confederacion] ([idConfederacion], [descripcion]) VALUES (3, N'UEFA')
INSERT [dbo].[Confederacion] ([idConfederacion], [descripcion]) VALUES (4, N'AFC')
INSERT [dbo].[Confederacion] ([idConfederacion], [descripcion]) VALUES (5, N'CAF')
INSERT [dbo].[Confederacion] ([idConfederacion], [descripcion]) VALUES (6, N'OFC')
SET IDENTITY_INSERT [dbo].[Confederacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Continente] ON 

INSERT [dbo].[Continente] ([idContinente], [descripcion]) VALUES (1, N'América')
INSERT [dbo].[Continente] ([idContinente], [descripcion]) VALUES (2, N'Africa')
INSERT [dbo].[Continente] ([idContinente], [descripcion]) VALUES (3, N'Asia')
INSERT [dbo].[Continente] ([idContinente], [descripcion]) VALUES (4, N'Europa')
INSERT [dbo].[Continente] ([idContinente], [descripcion]) VALUES (5, N'Oceanía')
SET IDENTITY_INSERT [dbo].[Continente] OFF
GO
SET IDENTITY_INSERT [dbo].[Encuentro] ON 

INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (1, 1, CAST(N'2018-06-14T17:00:00.000' AS DateTime), 1, 5, 2, 0, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (2, 6, CAST(N'2018-06-15T14:00:00.000' AS DateTime), 3, 0, 4, 1, 16, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (3, 2, CAST(N'2018-06-15T17:00:00.000' AS DateTime), 7, 0, 8, 1, 14, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (4, 3, CAST(N'2018-06-15T20:00:00.000' AS DateTime), 5, 3, 6, 3, 20, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (5, 8, CAST(N'2018-06-16T12:00:00.000' AS DateTime), 9, 2, 10, 1, 6, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (6, 5, CAST(N'2018-06-16T15:00:00.000' AS DateTime), 13, 1, 14, 1, 17, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (7, 7, CAST(N'2018-06-16T18:00:00.000' AS DateTime), 11, 0, 12, 1, 30, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (8, 10, CAST(N'2018-06-16T21:00:00.000' AS DateTime), 15, 2, 16, 0, 2, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (9, 9, CAST(N'2018-06-17T14:00:00.000' AS DateTime), 19, 0, 20, 1, 31, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (10, 1, CAST(N'2018-06-17T17:00:00.000' AS DateTime), 21, 0, 22, 1, 27, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (11, 12, CAST(N'2018-06-17T21:00:00.000' AS DateTime), 17, 1, 18, 1, 7, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (12, 4, CAST(N'2018-06-18T14:00:00.000' AS DateTime), 23, 1, 24, 0, 10, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (13, 3, CAST(N'2018-06-18T17:00:00.000' AS DateTime), 25, 3, 26, 0, 29, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (14, 11, CAST(N'2018-06-18T20:00:00.000' AS DateTime), 27, 1, 28, 2, 3, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (15, 7, CAST(N'2018-06-19T14:00:00.000' AS DateTime), 31, 1, 32, 2, 21, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (16, 5, CAST(N'2018-06-19T17:00:00.000' AS DateTime), 29, 1, 30, 2, 23, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (17, 2, CAST(N'2018-06-19T20:00:00.000' AS DateTime), 1, 3, 3, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (18, 1, CAST(N'2018-06-20T14:00:00.000' AS DateTime), 5, 1, 7, 0, 11, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (19, 12, CAST(N'2018-06-20T17:00:00.000' AS DateTime), 4, 1, 2, 0, 9, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (20, 8, CAST(N'2018-06-20T20:00:00.000' AS DateTime), 8, 0, 6, 1, 6, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (21, 9, CAST(N'2018-06-21T14:00:00.000' AS DateTime), 12, 1, 10, 1, 18, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (22, 6, CAST(N'2018-06-21T17:00:00.000' AS DateTime), 9, 1, 11, 0, 26, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (23, 4, CAST(N'2018-06-21T20:00:00.000' AS DateTime), 13, 0, 15, 3, 24, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (24, 2, CAST(N'2018-06-22T14:00:00.000' AS DateTime), 17, 2, 19, 0, 16, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (25, 11, CAST(N'2018-06-22T17:00:00.000' AS DateTime), 16, 2, 14, 0, 32, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (26, 10, CAST(N'2018-06-22T20:00:00.000' AS DateTime), 20, 1, 18, 2, 13, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (27, 5, CAST(N'2018-06-23T14:00:00.000' AS DateTime), 25, 5, 27, 2, 12, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (28, 12, CAST(N'2018-06-23T17:00:00.000' AS DateTime), 24, 1, 22, 2, 9, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (29, 3, CAST(N'2018-06-23T20:00:00.000' AS DateTime), 21, 2, 23, 1, 17, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (30, 4, CAST(N'2018-06-24T14:00:00.000' AS DateTime), 28, 6, 26, 1, 28, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (31, 6, CAST(N'2018-06-24T17:00:00.000' AS DateTime), 32, 2, 30, 2, 20, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (32, 8, CAST(N'2018-06-24T20:00:00.000' AS DateTime), 29, 0, 31, 3, 7, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (33, 9, CAST(N'2018-06-25T14:00:00.000' AS DateTime), 4, 3, 1, 0, 31, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (34, 11, CAST(N'2018-06-25T17:00:00.000' AS DateTime), 2, 2, 3, 1, 3, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (35, 7, CAST(N'2018-06-25T20:00:00.000' AS DateTime), 8, 1, 5, 1, 5, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (36, 10, CAST(N'2018-06-25T20:00:00.000' AS DateTime), 6, 2, 7, 2, 24, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (37, 1, CAST(N'2018-06-26T16:00:00.000' AS DateTime), 12, 0, 9, 0, 2, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (38, 3, CAST(N'2018-06-26T16:00:00.000' AS DateTime), 10, 0, 11, 2, 15, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (39, 12, CAST(N'2018-06-26T20:00:00.000' AS DateTime), 14, 1, 15, 2, 18, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (40, 2, CAST(N'2018-06-26T20:00:00.000' AS DateTime), 16, 1, 13, 2, 14, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (41, 8, CAST(N'2018-06-27T16:00:00.000' AS DateTime), 24, 2, 21, 0, 11, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (42, 6, CAST(N'2018-06-27T16:00:00.000' AS DateTime), 22, 0, 23, 3, 1, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (43, 5, CAST(N'2018-06-27T20:00:00.000' AS DateTime), 20, 0, 17, 2, 27, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (44, 4, CAST(N'2018-06-27T20:00:00.000' AS DateTime), 18, 2, 19, 2, 22, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (45, 11, CAST(N'2018-06-28T16:00:00.000' AS DateTime), 32, 0, 29, 1, 29, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (46, 9, CAST(N'2018-06-28T16:00:00.000' AS DateTime), 30, 0, 31, 1, 19, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (47, 10, CAST(N'2018-06-28T20:00:00.000' AS DateTime), 28, 0, 25, 1, 27, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (48, 7, CAST(N'2018-06-28T20:00:00.000' AS DateTime), 26, 1, 27, 2, 23, NULL, NULL, NULL, 1)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (49, 8, CAST(N'2018-06-30T16:00:00.000' AS DateTime), 9, 4, 13, 3, 17, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (50, 3, CAST(N'2018-06-30T20:00:00.000' AS DateTime), 4, 2, 5, 1, 7, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (51, 1, CAST(N'2018-07-01T16:00:00.000' AS DateTime), 6, 1, 1, 1, 16, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (52, 4, CAST(N'2018-07-01T20:00:00.000' AS DateTime), 15, 1, 12, 1, 1, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (53, 9, CAST(N'2018-07-02T16:00:00.000' AS DateTime), 17, 2, 22, 0, 20, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (54, 12, CAST(N'2018-07-02T20:00:00.000' AS DateTime), 25, 3, 32, 2, 31, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (55, 2, CAST(N'2018-07-03T16:00:00.000' AS DateTime), 23, 1, 18, 0, 21, NULL, NULL, NULL, 2)
INSERT [dbo].[Encuentro] ([idEncuentro], [idEstadio], [fecha], [idPaisL], [golesPaisL], [idPaisV], [golesPaisV], [idArbitro], [idLinea1], [idLinea2], [idAsistente], [idFase]) VALUES (56, 5, CAST(N'2018-07-03T20:00:00.000' AS DateTime), 31, 1, 28, 1, 11, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Encuentro] OFF
GO
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 1, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 2, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 3, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 4, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 5, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 6, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 7, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 8, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 9, 1, 24, 6, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 10, 1, 70, 22, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 11, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 12, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 13, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 14, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 15, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 16, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 17, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 18, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 19, 1, 64, 7, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 20, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 21, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 22, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 23, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 24, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 25, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 26, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 27, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 28, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 29, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 30, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 31, 1, 74, 32, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 32, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 33, 1, 85, 43, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 34, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 35, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 36, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 37, 1, 64, 42, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 38, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 39, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 40, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 41, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 42, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 43, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 44, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 45, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (1, 46, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 47, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 48, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 49, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 50, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 51, 0, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 52, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 53, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 54, 1, 50, 51, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 55, 1, 63, 57, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 56, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 57, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 58, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 59, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 60, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 61, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 62, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 63, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 64, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 65, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 66, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 67, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 68, 1, 82, 60, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 69, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 70, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 71, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 72, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 73, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 74, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 75, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 76, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 77, 1, 58, 74, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 78, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 79, 1, 59, 76, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 80, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 81, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 82, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 83, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 84, 1, 87, 83, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 85, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 86, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 87, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 88, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 89, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 90, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 91, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (2, 92, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 139, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 140, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 141, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 142, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 143, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 144, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 145, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 146, 1, 0, 0, 1, 0, 0)
GO
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 147, 1, 77, 158, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 148, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 149, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 150, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 151, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 152, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 153, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 154, 1, 76, 159, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 155, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 156, 1, 82, 142, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 157, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 158, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 159, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 160, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 161, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 162, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 163, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 164, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 165, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 166, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 168, 1, 68, 178, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 169, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 170, 1, 80, 180, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 171, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 172, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 173, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 174, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 175, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 176, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 177, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 178, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 179, 1, 85, 175, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 180, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 181, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 182, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 183, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (3, 184, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 93, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 94, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 95, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 96, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 97, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 98, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 99, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 100, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 101, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 102, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 103, 1, 69, 112, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 104, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 105, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 106, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 107, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 108, 1, 68, 102, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 109, 1, 80, 101, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 110, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 111, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 112, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 113, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 114, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 115, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 116, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 117, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 118, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 119, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 120, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 121, 1, 70, 125, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 122, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 123, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 124, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 125, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 126, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 127, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 128, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 129, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 130, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 131, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 132, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 133, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 134, 1, 77, 132, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 135, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 136, 1, 86, 126, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 137, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (4, 138, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 185, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 186, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 187, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 188, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 189, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 190, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 191, 1, 70, 193, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 192, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 193, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 194, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 195, 1, 70, 202, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 196, 1, 198, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 197, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 198, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 199, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 200, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 201, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 202, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 203, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 204, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 205, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 206, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 207, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 208, 1, 72, 209, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 209, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 210, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 211, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 212, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 213, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 214, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 215, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 216, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 217, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 218, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 219, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 220, 1, 64, 222, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 221, 1, 84, 214, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 222, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 223, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 224, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 225, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 226, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 227, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 228, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 229, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (5, 230, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 277, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 278, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 279, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 280, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 281, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 282, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 283, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 284, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 285, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 286, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 287, 1, 84, 291, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 288, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 289, 1, 75, 278, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 290, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 291, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 292, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 293, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 294, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 295, 1, 54, 293, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 296, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 297, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 298, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 299, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 300, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 301, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 302, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 303, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 304, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 305, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 306, 1, 76, 300, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 307, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 308, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 309, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 310, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 311, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 312, 1, 89, 314, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 313, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 314, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 315, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 316, 1, 63, 304, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 317, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 318, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 319, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 320, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 321, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (6, 322, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 231, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 232, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 233, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 234, 1, 62, 245, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 235, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 236, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 237, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 238, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 239, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 240, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 241, 1, 87, 231, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 242, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 243, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 244, 1, 85, 243, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 245, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 246, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 247, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 248, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 249, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 250, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 251, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 252, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 253, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 254, 1, 67, 266, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 255, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 256, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 257, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 258, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 259, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 260, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 261, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 262, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 263, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 264, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 265, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 266, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 267, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 268, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 269, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 270, 1, 36, 258, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 271, 1, 81, 264, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 272, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 273, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 274, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 275, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (7, 276, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 323, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 324, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 325, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 326, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 327, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 328, 1, 78, 338, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 329, 1, 86, 326, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 330, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 331, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 332, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 333, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 334, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 335, 0, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 336, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 337, 1, 60, 335, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 338, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 339, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 340, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 341, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 342, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 343, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 344, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 345, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 346, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 347, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 348, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 349, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 350, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 351, 1, 62, 362, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 352, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 353, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 354, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 355, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 356, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 357, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 358, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 359, 1, 88, 356, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 360, 1, 73, 355, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 361, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 362, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 363, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 364, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 365, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 366, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 367, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (8, 368, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 415, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 416, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 417, 1, 67, 426, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 418, 1, 73, 429, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 419, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 420, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 421, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 422, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 423, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 424, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 425, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 426, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 427, 1, 60, 431, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 428, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 429, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 430, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 431, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 432, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 433, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 434, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 435, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 436, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 437, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 438, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 439, 1, 70, 444, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 440, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 441, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 442, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 443, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 444, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 445, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 446, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 447, 0, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 448, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 449, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 450, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 451, 1, 83, 459, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 452, 1, 90, 453, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 453, 0, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 454, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 455, 1, 0, 0, 1, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 456, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 457, 1, 73, 429, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 458, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 459, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Encuentro_Jugador] ([idEncuentro], [idJugador], [arranco], [fueCambiado], [porQuien], [recibioAmarilla1], [reciibioAmarilla2], [recibioRojas]) VALUES (9, 460, 1, 0, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Estadio] ON 

INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (1, N'Luzhniki', 81000, N'Moscú')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (2, N'San Petersburgo', 67000, N'San Petersburgo')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (3, N'Fisht', 48000, N'Sochi')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (4, N'Nizhny Novgorod', 45000, N'Nizhny Novgorod')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (5, N'Spartak', 40000, N'Moscu´')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (6, N'Arena Ekaterinburgo', 35000, N'Ekaterimburgo')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (7, N'Arena Mordovia', 44000, N'Saransk')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (8, N'Arena Kazán', 40000, N'Kaza´n')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (9, N'Arena Samara', 45000, N'Samara')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (10, N'Kaliningrado', 40000, N'Kaliningrado')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (11, N'Arena de Volgogrado', 45000, N'Volgogrado')
INSERT [dbo].[Estadio] ([idEstadio], [nomEstadio], [aforo], [ciudad]) VALUES (12, N'Arena Rostov', 45000, N'Rostov del Don')
SET IDENTITY_INSERT [dbo].[Estadio] OFF
GO
SET IDENTITY_INSERT [dbo].[Fase] ON 

INSERT [dbo].[Fase] ([idFase], [descripcion]) VALUES (1, N'Fase de Grupos')
INSERT [dbo].[Fase] ([idFase], [descripcion]) VALUES (2, N'Octavos')
INSERT [dbo].[Fase] ([idFase], [descripcion]) VALUES (3, N'Cuartos')
INSERT [dbo].[Fase] ([idFase], [descripcion]) VALUES (4, N'Semifinal')
INSERT [dbo].[Fase] ([idFase], [descripcion]) VALUES (5, N'Final')
SET IDENTITY_INSERT [dbo].[Fase] OFF
GO
SET IDENTITY_INSERT [dbo].[Gol] ON 

INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (1, 1, 8, 11, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (2, 1, 6, 42, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (3, 1, 22, 70, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (4, 1, 6, 90, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (5, 1, 17, 93, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (6, 2, 71, 88, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (7, 3, 158, 94, 0, 2)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (8, 4, 99, 3, 1, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (9, 4, 134, 23, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (10, 4, 99, 43, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (11, 4, 134, 54, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (12, 4, 119, 57, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (13, 4, 99, 87, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (14, 5, 191, 57, 1, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (15, 5, 216, 61, 1, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (16, 5, 215, 79, 0, 2)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (17, 6, 281, 18, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (18, 6, 312, 22, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (19, 7, 257, 58, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (20, 8, 361, 31, 0, 2)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (21, 8, 336, 70, 1, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (22, 9, 450, 55, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (23, 10, 485, 34, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (24, 11, 381, 19, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (25, 11, 401, 49, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (26, 12, 526, 64, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (27, 13, 562, 46, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (28, 13, 567, 68, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (29, 13, 567, 74, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (30, 14, 636, 10, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (31, 14, 609, 34, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (32, 14, 636, 90, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (33, 15, 727, 5, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (34, 15, 694, 38, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (35, 15, 722, 72, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (36, 16, 664, 36, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (37, 16, 672, 59, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (38, 16, 658, 85, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (39, 17, 53, 47, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (40, 17, 6, 59, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (41, 17, 22, 62, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (42, 17, 56, 73, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (43, 18, 99, 3, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (44, 19, 78, 22, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (45, 20, 134, 53, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (46, 21, 267, 6, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (47, 21, 216, 37, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (48, 22, 194, 33, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (49, 23, 328, 52, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (50, 23, 336, 79, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (51, 23, 339, 90, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (52, 24, 381, 90, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (53, 24, 382, 96, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (54, 25, 362, 48, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (55, 25, 362, 74, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (56, 26, 452, 4, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (57, 26, 405, 51, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (58, 26, 392, 89, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (59, 27, 566, 5, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (60, 27, 567, 15, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (61, 27, 611, 17, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (62, 27, 567, 47, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (63, 27, 566, 50, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (64, 27, 555, 89, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (65, 27, 612, 92, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (66, 28, 496, 25, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (67, 28, 493, 65, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (68, 28, 546, 92, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (69, 29, 510, 31, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (70, 29, 473, 47, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (71, 29, 476, 94, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (72, 30, 640, 7, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (73, 30, 636, 21, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (74, 30, 638, 35, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (75, 30, 640, 39, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (76, 30, 636, 45, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (77, 30, 636, 61, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (78, 30, 576, 77, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (79, 31, 681, 10, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (80, 31, 723, 33, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (81, 31, 669, 70, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (82, 31, 733, 77, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (83, 32, 701, 39, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (84, 32, 705, 69, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (85, 32, 692, 74, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (86, 33, 78, 9, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (87, 33, 6, 22, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (88, 33, 90, 89, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (89, 34, 56, 21, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (90, 34, 30, 50, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (91, 34, 41, 94, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (92, 35, 112, 44, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (93, 35, 171, 92, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (94, 36, 151, 13, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (95, 36, 137, 18, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (96, 36, 157, 80, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (97, 36, 132, 90, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (98, 38, 236, 17, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (99, 38, 245, 49, 0, 1)
GO
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (100, 39, 327, 52, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (101, 39, 313, 75, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (102, 39, 342, 89, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (103, 40, 290, 13, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (104, 40, 358, 50, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (105, 40, 284, 85, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (106, 41, 534, 91, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (107, 41, 546, 95, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (108, 42, 524, 49, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (109, 42, 526, 61, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (110, 42, 486, 73, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (111, 43, 377, 35, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (112, 43, 390, 67, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (113, 44, 400, 30, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (114, 44, 419, 55, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (115, 44, 396, 87, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (116, 44, 414, 92, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (117, 45, 663, 58, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (118, 46, 701, 74, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (119, 47, 558, 51, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (120, 48, 618, 32, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (121, 48, 614, 50, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (122, 48, 612, 65, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (123, 49, 191, 12, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (124, 49, 289, 40, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (125, 49, 298, 47, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (126, 49, 186, 56, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (127, 49, 194, 63, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (128, 49, 194, 67, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (129, 49, 281, 92, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (130, 50, 90, 6, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (131, 50, 95, 54, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (132, 50, 90, 61, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (133, 51, 4, 10, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (134, 51, 22, 40, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (135, 52, 264, 0, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (136, 52, 329, 3, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (137, 53, 382, 50, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (138, 53, 372, 87, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (139, 54, 729, 47, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (140, 54, 723, 51, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (141, 54, 571, 68, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (142, 54, 568, 73, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (143, 54, 554, 93, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (144, 55, 520, 65, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (145, 56, 636, 56, 0, 1)
INSERT [dbo].[Gol] ([idGol], [idEncuentro], [idJugador], [minuto], [dePenal], [idModoGol]) VALUES (146, 56, 701, 92, 0, 1)
SET IDENTITY_INSERT [dbo].[Gol] OFF
GO
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (1, N'A')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (2, N'B')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (3, N'C')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (4, N'D')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (5, N'E')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (6, N'F')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (7, N'G')
INSERT [dbo].[Grupo] ([idGrupo], [descripcion]) VALUES (8, N'H')
SET IDENTITY_INSERT [dbo].[Grupo] OFF
GO
SET IDENTITY_INSERT [dbo].[Jugador] ON 

INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (1, 1, N'Ígor Akinféyev ', N'Portero', 32, N' CSKA Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (2, 1, N'Mário Fernandes', N'Defensa', 27, N' CSKA Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (3, 1, N'Iliá Kutépov', N'Defensa', 24, N' Spartak de Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (4, 1, N'Serguéi Ignashévich', N'Defensa', 38, N' CSKA Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (5, 1, N'Andréi Semiónov', N'Defensa', 29, N' Ajmat Grozni')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (6, 1, N'Denís Chéryshev', N'Centrocampista', 27, N' Villarreal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (7, 1, N'Daler Kuziáyev', N'Centrocampista', 25, N' Zenit de San Petersburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (8, 1, N'Yuri Gazinski', N'Centrocampista', 28, N' Krasnodar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (9, 1, N'Alán Dzagóyev', N'Centrocampista', 27, N' CSKA Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (10, 1, N'Fiódor Smólov', N'Delantero', 28, N' Krasnodar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (11, 1, N'Román Zobnin', N'Centrocampista', 24, N' Spartak de Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (12, 1, N'Andréi Luniov', N'Portero', 26, N' Zenit de San Petersburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (13, 1, N'Fiódor Kudriashov', N'Defensa', 31, N' Rubin Kazán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (14, 1, N'Vladímir Granat', N'Defensa', 31, N' Rubin Kazán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (15, 1, N'Alekséi Miranchuk', N'Centrocampista', 22, N' Lokomotiv Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (16, 1, N'Antón Miranchuk', N'Centrocampista', 22, N' Lokomotiv Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (17, 1, N'Aleksandr Golovín', N'Centrocampista', 22, N' CSKA Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (18, 1, N'Yuri Zhirkov', N'Centrocampista', 34, N' Zenit de San Petersburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (19, 1, N'Aleksandr Samédov', N'Centrocampista', 33, N' Spartak de Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (20, 1, N'Vladímir Gabúlov', N'Portero', 34, N' Brujas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (21, 1, N'Aleksandr Yerojin', N'Centrocampista', 28, N' Zenit de San Petersburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (22, 1, N'Artiom Dziuba', N'Delantero', 29, N' Arsenal Tula')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (23, 1, N'Ígor Smólnikov', N'Defensa', 29, N' Zenit de San Petersburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (24, 2, N'Abdullah Al-Mayouf', N'Portero', 31, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (25, 2, N'Mansoor Al-Harbi', N'Defensa', 30, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (26, 2, N'Osama Hawsawi ', N'Defensa', 34, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (27, 2, N'Ali Al-Bulaihi', N'Defensa', 28, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (28, 2, N'Omar Hawsawi', N'Defensa', 32, N' Al-Nassr')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (29, 2, N'Mohammed Al-Breik', N'Defensa', 25, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (30, 2, N'Salman Al-Faraj', N'Centrocampista', 28, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (31, 2, N'Yahya Al-Shehri', N'Centrocampista', 27, N' Leganés')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (32, 2, N'Hattan Bahebri', N'Centrocampista', 25, N' Al-Shabab')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (33, 2, N'Mohammad Al-Sahlawi', N'Delantero', 31, N' Al-Nassr')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (34, 2, N'Abdulmalek Al-Khaibri', N'Centrocampista', 32, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (35, 2, N'Mohamed Kanno', N'Centrocampista', 23, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (36, 2, N'Yasir Al-Shahrani', N'Defensa', 26, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (37, 2, N'Abdullah Otayf', N'Centrocampista', 25, N' Al-Hilal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (38, 2, N'Abdullah Al-Khaibari', N'Centrocampista', 21, N' Al-Shabab')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (39, 2, N'Housain Al-Mogahwi', N'Centrocampista', 30, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (40, 2, N'Taiseer Al Jassam', N'Centrocampista', 33, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (41, 2, N'Salem Al-Dawsari', N'Centrocampista', 26, N' Villarreal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (42, 2, N'Fahad Al-Muwallad', N'Delantero', 23, N' Levante')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (43, 2, N'Muhannad Assiri', N'Delantero', 31, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (44, 2, N'Yasser Al-Mosailem', N'Portero', 34, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (45, 2, N'Mohammed Al-Owais', N'Portero', 26, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (46, 2, N'Motaz Hawsawi', N'Defensa', 26, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (47, 3, N'Essam El-Hadary ', N'Portero', 45, N' Al-Taawoun')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (48, 3, N'Ali Gabr', N'Defensa', 29, N' West Bromwich Albion')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (49, 3, N'Ahmed Al-Muhammadi', N'Defensa', 30, N' Aston Villa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (50, 3, N'Omar Gaber', N'Centrocampista', 26, N' Los Angeles')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (51, 3, N'Sam Morsy', N'Centrocampista', 26, N' Wigan Athletic')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (52, 3, N'Ahmed Hegazy', N'Defensa', 27, N' West Bromwich Albion')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (53, 3, N'Ahmed Fathy', N'Defensa', 33, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (54, 3, N'Tarek Hamed', N'Centrocampista', 29, N' Zamalek')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (55, 3, N'Marwan Mohsen', N'Delantero', 29, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (56, 3, N'Mohamed Salah', N'Delantero', 25, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (57, 3, N'Mahmoud Kahraba', N'Delantero', 24, N' Al-Ittihad')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (58, 3, N'Ayman Ashraf', N'Defensa', 27, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (59, 3, N'Mohamed Abdel-Shafy', N'Defensa', 32, N' Al-Fateh')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (60, 3, N'Ramadan Sobhi', N'Delantero', 21, N' Stoke City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (61, 3, N'Mahmoud Hamdy', N'Defensa', 23, N' Zamalek')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (62, 3, N'Sherif Ekramy', N'Portero', 34, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (63, 3, N'Mohamed Elneny', N'Centrocampista', 25, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (64, 3, N'Shikabala', N'Delantero', 32, N' Al-Raed')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (65, 3, N'Abdallah Said', N'Centrocampista', 32, N' KuPS')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (66, 3, N'Saad Samir', N'Defensa', 29, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (67, 3, N'Trézéguet', N'Centrocampista', 23, N' Kasimpasa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (68, 3, N'Amr Warda', N'Delantero', 24, N' Atromitos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (69, 3, N'Mohamed El-Shenawy', N'Portero', 29, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (70, 4, N'Fernando Muslera', N'Portero', 32, N' Galatasaray')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (71, 4, N'José Giménez', N'Defensa', 23, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (72, 4, N'Diego Godín ', N'Defensa', 32, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (73, 4, N'Guillermo Varela', N'Defensa', 25, N' Peñarol')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (74, 4, N'Carlos Sánchez', N'Centrocampista', 33, N' Monterrey')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (75, 4, N'Rodrigo Bentancur', N'Centrocampista', 20, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (76, 4, N'Cristian Rodríguez', N'Centrocampista', 32, N' Peñarol')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (77, 4, N'Nahitan Nández', N'Centrocampista', 22, N' Boca Juniors')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (78, 4, N'Luis Suárez', N'Delantero', 31, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (79, 4, N'Giorgian De Arrascaeta', N'Centrocampista', 24, N' Cruzeiro')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (80, 4, N'Cristhian Stuani', N'Delantero', 31, N' Girona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (81, 4, N'Martín Campaña', N'Portero', 29, N' Independiente')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (82, 4, N'Gastón Silva', N'Defensa', 24, N' Independiente')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (83, 4, N'Lucas Torreira', N'Centrocampista', 22, N' Sampdoria')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (84, 4, N'Matías Vecino', N'Centrocampista', 26, N' Inter de Milán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (85, 4, N'Maxi Pereira', N'Defensa', 34, N' Porto')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (86, 4, N'Diego Laxalt', N'Centrocampista', 25, N' Genoa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (87, 4, N'Maxi Gómez', N'Delantero', 21, N' Celta de Vigo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (88, 4, N'Sebastián Coates', N'Defensa', 27, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (89, 4, N'Jonathan Urretaviscaya', N'Delantero', 28, N' Monterrey')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (90, 4, N'Edinson Cavani', N'Delantero', 31, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (91, 4, N'Martín Cáceres', N'Defensa', 31, N' Lazio')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (92, 4, N'Martín Silva', N'Portero', 35, N' Vasco da Gama')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (93, 5, N'Rui Patrício', N'Portero', 30, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (94, 5, N'Bruno Alves', N'Defensa', 36, N' Rangers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (95, 5, N'Pepe', N'Defensa', 35, N' Besiktas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (96, 5, N'Manuel Fernandes', N'Centrocampista', 32, N' Lokomotiv Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (97, 5, N'Raphaël Guerreiro', N'Defensa', 24, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (98, 5, N'José Fonte', N'Defensa', 34, N' Dalian Yifang')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (99, 5, N'Cristiano Ronaldo ', N'Delantero', 33, N' Real Madrid')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (100, 5, N'João Moutinho', N'Centrocampista', 31, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (101, 5, N'André Silva', N'Delantero', 22, N' Milan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (102, 5, N'João Mário', N'Centrocampista', 25, N' West Ham United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (103, 5, N'Bernardo Silva', N'Centrocampista', 23, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (104, 5, N'Anthony Lopes', N'Portero', 27, N' Olympique de Lyon')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (105, 5, N'Rúben Dias', N'Defensa', 21, N' Benfica')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (106, 5, N'William Carvalho', N'Centrocampista', 26, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (107, 5, N'Ricardo Pereira', N'Defensa', 24, N' Porto')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (108, 5, N'Bruno Fernandes', N'Centrocampista', 23, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (109, 5, N'Gonçalo Guedes', N'Delantero', 21, N' Valencia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (110, 5, N'Gelson Martins', N'Delantero', 23, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (111, 5, N'Mário Rui', N'Defensa', 27, N' Napoli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (112, 5, N'Ricardo Quaresma', N'Delantero', 34, N' Besiktas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (113, 5, N'Cédric', N'Defensa', 26, N' Southampton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (114, 5, N'Beto', N'Portero', 36, N' Göztepe')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (115, 5, N'Adrien Silva', N'Centrocampista', 29, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (116, 6, N'David de Gea', N'Portero', 27, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (117, 6, N'Dani Carvajal', N'Defensa', 26, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (118, 6, N'Gerard Piqué', N'Defensa', 31, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (119, 6, N'Nacho Fernández', N'Defensa', 28, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (120, 6, N'Sergio Busquets', N'Centrocampista', 29, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (121, 6, N'Andrés Iniesta', N'Centrocampista', 34, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (122, 6, N'Saúl Ñíguez', N'Centrocampista', 23, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (123, 6, N'Koke', N'Centrocampista', 26, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (124, 6, N'Rodrigo', N'Delantero', 27, N' Valencia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (125, 6, N'Thiago Alcántara', N'Centrocampista', 27, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (126, 6, N'Lucas Vázquez', N'Delantero', 26, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (127, 6, N'Álvaro Odriozola', N'Defensa', 22, N' Real Sociedad')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (128, 6, N'Kepa Arrizabalaga', N'Portero', 23, N' Athletic Club')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (129, 6, N'César Azpilicueta', N'Defensa', 28, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (130, 6, N'Sergio Ramos ', N'Defensa', 32, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (131, 6, N'Nacho Monreal', N'Defensa', 32, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (132, 6, N'Iago Aspas', N'Delantero', 30, N' Celta de Vigo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (133, 6, N'Jordi Alba', N'Defensa', 29, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (134, 6, N'Diego Costa', N'Delantero', 29, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (135, 6, N'Marco Asensio', N'Centrocampista', 22, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (136, 6, N'David Silva', N'Delantero', 32, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (137, 6, N'Isco', N'Centrocampista', 26, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (138, 6, N'Pepe Reina', N'Portero', 35, N' Napoli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (139, 7, N'Yassine Bounou', N'Portero', 27, N' Girona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (140, 7, N'Achraf Hakimi', N'Defensa', 19, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (141, 7, N'Hamza Mendyl', N'Defensa', 20, N' Lille')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (142, 7, N'Manuel da Costa', N'Defensa', 32, N' Estambul Basaksehir')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (143, 7, N'Mehdi Benatia ', N'Defensa', 31, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (144, 7, N'Romain Saïss', N'Defensa', 28, N' Wolverhampton Wanderers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (145, 7, N'Hakim Ziyech', N'Centrocampista', 25, N' Ajax')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (146, 7, N'Karim El Ahmadi', N'Centrocampista', 33, N' Feyenoord')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (147, 7, N'Ayoub El Kaabi', N'Delantero', 24, N' Renaissance de Berkane')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (148, 7, N'Younès Belhanda', N'Centrocampista', 28, N' Galatasaray')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (149, 7, N'Fayçal Fajr', N'Centrocampista', 29, N' Getafe')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (150, 7, N'Munir Mohamedi', N'Portero', 29, N' Numancia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (151, 7, N'Khalid Boutaïb', N'Delantero', 31, N' Yeni Malatyaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (152, 7, N'Mbark Boussoufa', N'Centrocampista', 33, N' Al-Jazira')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (153, 7, N'Youssef Aït Bennasser', N'Centrocampista', 21, N' Caen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (154, 7, N'Nordin Amrabat', N'Centrocampista', 31, N' Leganés')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (155, 7, N'Nabil Dirar', N'Defensa', 32, N' Fenerbahçe')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (156, 7, N'Amine Harit', N'Centrocampista', 20, N' Schalke 04')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (157, 7, N'Youssef En-Nesyri', N'Delantero', 21, N' Málaga')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (158, 7, N'Aziz Bouhaddouz', N'Delantero', 31, N' San Pauli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (159, 7, N'Sofyan Amrabat', N'Centrocampista', 21, N' Feyenoord')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (160, 7, N'Ahmed Reda Tagnaouti', N'Portero', 22, N' Ittihad Tanger')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (161, 7, N'Mehdi Carcela-González', N'Centrocampista', 28, N' Standard Lieja')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (162, 8, N'Alireza Beiranvand', N'Portero', 25, N' Persépolis')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (163, 8, N'Mehdi Torabi', N'Centrocampista', 23, N' Saipa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (164, 8, N'Ehsan Hajsafi', N'Defensa', 28, N' Olympiacos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (165, 8, N'Rouzbeh Cheshmi', N'Defensa', 24, N' Esteghlal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (166, 8, N'Milad Mohammadi', N'Defensa', 24, N' Ajmat Grozni')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (167, 8, N'Saeid Ezatolahi', N'Centrocampista', 21, N' Amkar Perm')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (168, 8, N'Masoud Shojaei ', N'Centrocampista', 34, N' AEK Atenas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (169, 8, N'Morteza Pouraliganji', N'Defensa', 26, N' Al-Sadd')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (170, 8, N'Omid Ebrahimi', N'Centrocampista', 30, N' Esteghlal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (171, 8, N'Karim Ansarifard', N'Delantero', 28, N' Olympiacos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (172, 8, N'Vahid Amiri', N'Centrocampista', 30, N' Persépolis')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (173, 8, N'Mohammad Rashid Mazaheri', N'Portero', 29, N' Zob Ahan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (174, 8, N'Mohammad Reza Khanzadeh', N'Defensa', 27, N' Padideh')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (175, 8, N'Saman Ghoddos', N'Delantero', 24, N' Östersund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (176, 8, N'Pejman Montazeri', N'Defensa', 34, N' Esteghlal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (177, 8, N'Reza Ghoochannejhad', N'Delantero', 30, N' Heerenveen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (178, 8, N'Mehdi Taremi', N'Delantero', 25, N' Al-Gharafa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (179, 8, N'Alireza Jahanbakhsh', N'Delantero', 24, N' AZ')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (180, 8, N'Majid Hosseini', N'Defensa', 21, N' Esteghlal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (181, 8, N'Sardar Azmoun', N'Delantero', 23, N' Rubin Kazán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (182, 8, N'Ashkan Dejagah', N'Delantero', 31, N' Nottingham Forest')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (183, 8, N'Amir Abedzadeh', N'Portero', 25, N' Marítimo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (184, 8, N'Ramin Rezaeian', N'Defensa', 28, N' Oostende')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (185, 9, N'Hugo Lloris ', N'Portero', 31, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (186, 9, N'Benjamin Pavard', N'Defensa', 22, N' Stuttgart')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (187, 9, N'Presnel Kimpembe', N'Defensa', 22, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (188, 9, N'Raphaël Varane', N'Defensa', 25, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (189, 9, N'Samuel Umtiti', N'Defensa', 24, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (190, 9, N'Paul Pogba', N'Centrocampista', 25, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (191, 9, N'Antoine Griezmann', N'Delantero', 27, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (192, 9, N'Thomas Lemar', N'Delantero', 22, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (193, 9, N'Olivier Giroud', N'Delantero', 31, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (194, 9, N'Kylian Mbappé', N'Delantero', 19, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (195, 9, N'Ousmane Dembélé', N'Delantero', 21, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (196, 9, N'Corentin Tolisso', N'Centrocampista', 23, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (197, 9, N'N Golo Kanté', N'Centrocampista', 27, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (198, 9, N'Blaise Matuidi', N'Centrocampista', 31, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (199, 9, N'Steven N Zonzi', N'Centrocampista', 29, N' Sevilla')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (200, 9, N'Steve Mandanda', N'Portero', 33, N' Olympique de Marsella')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (201, 9, N'Adil Rami', N'Defensa', 32, N' Olympique de Marsella')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (202, 9, N'Nabil Fekir', N'Delantero', 24, N' Olympique de Lyon')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (203, 9, N'Djibril Sidibé', N'Defensa', 25, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (204, 9, N'Florian Thauvin', N'Delantero', 25, N' Olympique de Marsella')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (205, 9, N'Lucas Hernández', N'Defensa', 22, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (206, 9, N'Benjamin Mendy', N'Defensa', 23, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (207, 9, N'Alphonse Areola', N'Portero', 25, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (208, 10, N'Tom Rogic', N'Centrocampista', 25, N' Celtic')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (209, 10, N'Jackson Irvine', N'Centrocampista', 25, N' Hull City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (210, 10, N'Dimitri Petratos', N'Delantero', 25, N' Newcastle Jets')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (211, 10, N'Trent Sainsbury', N'Defensa', 26, N' Grasshopper')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (212, 10, N'Josh Risdon', N'Defensa', 25, N' Western Sydney Wanderers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (213, 10, N'Danny Vukovic', N'Portero', 33, N' Genk')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (214, 10, N'Daniel Arzani', N'Delantero', 19, N' Melbourne City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (215, 10, N'Aziz Behich', N'Defensa', 27, N' Bursaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (216, 10, N'Mile Jedinak ', N'Centrocampista', 33, N' Aston Villa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (217, 10, N'Jamie Maclaren', N'Delantero', 24, N' Hibernian')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (218, 10, N'Aaron Mooy', N'Centrocampista', 27, N' Huddersfield Town')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (219, 10, N'Brad Jones', N'Portero', 36, N' Feyenoord')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (220, 10, N'Andrew Nabbout', N'Delantero', 25, N' Urawa Red Diamonds')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (221, 10, N'Robbie Kruse', N'Delantero', 29, N' Bochum')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (222, 10, N'Tomi Juric', N'Delantero', 26, N' Lucerna')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (223, 10, N'Massimo Luongo', N'Centrocampista', 25, N' Queens Park Rangers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (224, 10, N'Mathew Leckie', N'Delantero', 27, N' Hertha Berlín')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (225, 10, N'Matthew Jurman', N'Defensa', 28, N' Suwon Samsung Bluewings')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (226, 10, N'Mark Milligan', N'Defensa', 32, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (227, 10, N'Tim Cahill', N'Centrocampista', 38, N' Millwall')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (228, 10, N'James Meredith', N'Defensa', 30, N' Millwall')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (229, 10, N'Milos Degenek', N'Defensa', 24, N' Yokohama F. Marinos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (230, 10, N'Mathew Ryan', N'Portero', 26, N' Brighton & Hove Albion')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (231, 11, N'Pedro Aquino', N'Centrocampista', 23, N' Lobos BUAP')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (232, 11, N'Nilson Loyola', N'Defensa', 23, N' Melgar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (233, 11, N'José Carvallo', N'Portero', 32, N' UTC de Cajamarca')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (234, 11, N'Edison Flores', N'Delantero', 24, N' Aalborg')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (235, 11, N'Yoshimar Yotún', N'Centrocampista', 28, N' Orlando City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (236, 11, N'André Carrillo', N'Delantero', 27, N' Watford')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (237, 11, N'Luis Advíncula', N'Defensa', 28, N' Lobos BUAP')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (238, 11, N'Wilder Cartagena', N'Centrocampista', 23, N' Veracruz')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (239, 11, N'Christian Ramos', N'Defensa', 29, N' Veracruz')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (240, 11, N'Andy Polo', N'Centrocampista', 23, N' Portland Timbers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (241, 11, N'Renato Tapia', N'Centrocampista', 22, N' Feyenoord')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (242, 11, N'Carlos Cáceda', N'Portero', 26, N' Deportivo Municipal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (243, 11, N'Raúl Ruidíaz', N'Delantero', 27, N' Monarcas Morelia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (244, 11, N'Jefferson Farfán', N'Delantero', 33, N' Lokomotiv Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (245, 11, N'Paolo Guerrero ', N'Delantero', 34, N' Flamengo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (246, 11, N'Christian Cueva', N'Centrocampista', 26, N' São Paulo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (247, 11, N'Paolo Hurtado', N'Centrocampista', 27, N' Vitória Guimarães')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (248, 11, N'Miguel Trauco', N'Defensa', 25, N' Flamengo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (249, 11, N'Miguel Araujo', N'Defensa', 23, N' Alianza Lima')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (250, 11, N'Anderson Santamaría', N'Defensa', 26, N' Puebla')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (251, 11, N'Aldo Corzo', N'Defensa', 29, N' Universitario')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (252, 11, N'Alberto Rodríguez', N'Defensa', 34, N' Junior')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (253, 11, N'Pedro Gallese', N'Portero', 28, N' Veracruz')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (254, 12, N'Pione Sisto', N'Delantero', 23, N' Celta de Vigo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (255, 12, N'Frederik Rønnow', N'Portero', 25, N' Brøndby')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (256, 12, N'Andreas Cornelius', N'Delantero', 25, N' Atalanta')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (257, 12, N'Yussuf Poulsen', N'Delantero', 23, N' RB Leipzig')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (258, 12, N'Lasse Schøne', N'Centrocampista', 32, N' Ajax')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (259, 12, N'Lukas Lerager', N'Centrocampista', 24, N' Girondins de Burdeos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (260, 12, N'Jens Stryger Larsen', N'Defensa', 27, N' Udinese')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (261, 12, N'Jonas Lössl', N'Portero', 29, N' Huddersfield Town')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (262, 12, N'Viktor Fischer', N'Delantero', 24, N' Copenhague')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (263, 12, N'Henrik Dalsgaard', N'Defensa', 28, N' Brentford')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (264, 12, N'Mathias Jørgensen', N'Defensa', 28, N' Huddersfield Town')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (265, 12, N'Kasper Dolberg', N'Delantero', 20, N' Ajax')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (266, 12, N'Martin Braithwaite', N'Delantero', 27, N' Girondins de Burdeos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (267, 12, N'Christian Eriksen', N'Centrocampista', 26, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (268, 12, N'Nicolai Jørgensen', N'Delantero', 27, N' Feyenoord')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (269, 12, N'Thomas Delaney', N'Centrocampista', 26, N' Werder Bremen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (270, 12, N'William Kvist', N'Centrocampista', 33, N' Copenhague')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (271, 12, N'Andreas Christensen', N'Defensa', 22, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (272, 12, N'Jonas Knudsen', N'Defensa', 25, N' Ipswich Town')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (273, 12, N'Simon Kjær ', N'Defensa', 29, N' Sevilla')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (274, 12, N'Jannik Vestergaard', N'Defensa', 25, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (275, 12, N'Michael Krohn-Dehli', N'Centrocampista', 35, N' Deportivo La Coruña')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (276, 12, N'Kasper Schmeichel', N'Portero', 31, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (277, 13, N'Willy Caballero', N'Portero', 36, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (278, 13, N'Cristian Pavón', N'Centrocampista', 22, N' Boca Juniors')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (279, 13, N'Paulo Dybala', N'Delantero', 24, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (280, 13, N'Giovani Lo Celso', N'Centrocampista', 22, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (281, 13, N'Sergio Agüero', N'Delantero', 30, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (282, 13, N'Eduardo Salvio', N'Defensa', 27, N' Benfica')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (283, 13, N'Nicolás Otamendi', N'Defensa', 30, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (284, 13, N'Marcos Rojo', N'Defensa', 28, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (285, 13, N'Enzo Pérez', N'Centrocampista', 32, N' River Plate')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (286, 13, N'Javier Mascherano', N'Defensa', 34, N' Hebei China Fortune')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (287, 13, N'Maximiliano Meza', N'Centrocampista', 25, N' Independiente')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (288, 13, N'Franco Armani', N'Portero', 31, N' River Plate')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (289, 13, N'Ángel Di María', N'Centrocampista', 30, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (290, 13, N'Lionel Messi ', N'Delantero', 30, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (291, 13, N'Gonzalo Higuaín', N'Delantero', 30, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (292, 13, N'Marcos Acuña', N'Defensa', 26, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (293, 13, N'Éver Banega', N'Centrocampista', 29, N' Sevilla')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (294, 13, N'Federico Fazio', N'Defensa', 31, N' Roma')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (295, 13, N'Lucas Biglia', N'Centrocampista', 32, N' Milan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (296, 13, N'Cristian Ansaldi', N'Defensa', 31, N' Torino')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (297, 13, N'Nicolás Tagliafico', N'Defensa', 25, N' Ajax')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (298, 13, N'Gabriel Mercado', N'Defensa', 31, N' Sevilla')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (299, 13, N'Nahuel Guzmán', N'Portero', 32, N' Tigres UANL')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (300, 14, N'Ari Freyr Skúlason', N'Defensa', 31, N' Lokeren')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (301, 14, N'Jón Daði Böðvarsson', N'Delantero', 26, N' Reading')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (302, 14, N'Arnór Traustason', N'Centrocampista', 25, N' Malmö')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (303, 14, N'Emil Hallfreðsson', N'Centrocampista', 33, N' Udinese')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (304, 14, N'Rúrik Gíslason', N'Centrocampista', 30, N' Sandhausen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (305, 14, N'Hörður Magnússon', N'Defensa', 25, N' Bristol City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (306, 14, N'Aron Gunnarsson ', N'Centrocampista', 29, N' Cardiff City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (307, 14, N'Ólafur Skúlason', N'Centrocampista', 35, N' Kardemir Karabükspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (308, 14, N'Hólmar Eyjólfsson', N'Defensa', 27, N' Levski Sofia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (309, 14, N'Kári Árnason', N'Defensa', 35, N' Aberdeen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (310, 14, N'Rúnar Rúnarsson', N'Portero', 23, N' Nordsjælland')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (311, 14, N'Frederik Schram', N'Portero', 23, N' Roskilde')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (312, 14, N'Alfreð Finnbogason', N'Delantero', 29, N' Augsburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (313, 14, N'Gylfi Sigurðsson', N'Centrocampista', 28, N' Everton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (314, 14, N'Björn Sigurðarson', N'Delantero', 27, N' Rostov')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (315, 14, N'Birkir Bjarnason', N'Centrocampista', 30, N' Aston Villa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (316, 14, N'Jóhann Berg Guðmundsson', N'Centrocampista', 27, N' Burnley')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (317, 14, N'Ragnar Sigurðsson', N'Defensa', 31, N' Rostov')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (318, 14, N'Sverrir Ingason', N'Defensa', 24, N' Rostov')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (319, 14, N'Albert Guðmundsson', N'Centrocampista', 20, N' PSV Eindhoven')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (320, 14, N'Samúel Friðjónsson', N'Centrocampista', 22, N' Vålerenga')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (321, 14, N'Birkir Sævarsson', N'Defensa', 33, N' Valur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (322, 14, N'Hannes Halldórsson', N'Portero', 34, N' Randers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (323, 15, N'Danijel Subašic', N'Portero', 33, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (324, 15, N'Josip Pivaric', N'Defensa', 29, N' Dinamo de Kiev')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (325, 15, N'Domagoj Vida', N'Defensa', 29, N' Besiktas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (326, 15, N'Marko Pjaca', N'Delantero', 23, N' Schalke 04')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (327, 15, N'Milan Badelj', N'Centrocampista', 29, N' Fiorentina')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (328, 15, N'Ante Rebic', N'Delantero', 24, N' Eintracht Fráncfort')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (329, 15, N'Mario Mandžukic', N'Delantero', 32, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (330, 15, N'Nikola Kalinic', N'Delantero', 30, N' Milan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (331, 15, N'Duje Caleta-Car', N'Defensa', 21, N' Red Bull Salzburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (332, 15, N'Filip Bradaric', N'Centrocampista', 26, N' Rijeka')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (333, 15, N'Tin Jedvaj', N'Defensa', 22, N' Bayer Leverkusen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (334, 15, N'Lovre Kalinic', N'Portero', 28, N' Gante')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (335, 15, N'Marcelo Brozovic', N'Centrocampista', 25, N' Inter de Milán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (336, 15, N'Luka Modric ', N'Centrocampista', 32, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (337, 15, N'Andrej Kramaric', N'Delantero', 26, N' Hoffenheim')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (338, 15, N'Mateo Kovacic', N'Centrocampista', 24, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (339, 15, N'Ivan Rakitic', N'Centrocampista', 30, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (340, 15, N'Dejan Lovren', N'Defensa', 28, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (341, 15, N'Vedran Corluka', N'Defensa', 32, N' Lokomotiv Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (342, 15, N'Ivan Perišic', N'Delantero', 29, N' Inter de Milán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (343, 15, N'Ivan Strinic', N'Defensa', 30, N' Sampdoria')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (344, 15, N'Šime Vrsaljko', N'Defensa', 26, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (345, 15, N'Dominik Livakovic', N'Portero', 23, N' Dinamo Zagreb')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (346, 16, N'Francis Uzoho', N'Portero', 19, N' Deportivo La Coruña')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (347, 16, N'Kenneth Omeruo', N'Defensa', 24, N' Kasimpasa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (348, 16, N'Tyronne Ebuehi', N'Defensa', 22, N' La Haya')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (349, 16, N'Chidozie Awaziem', N'Defensa', 21, N' Nantes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (350, 16, N'John Ogu', N'Centrocampista', 30, N' Hapoel Beer Sheva')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (351, 16, N'Alex Iwobi', N'Delantero', 22, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (352, 16, N'Ogenyi Onazi', N'Centrocampista', 25, N' Trabzonspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (353, 16, N'Daniel Akpeyi', N'Portero', 32, N' Chippa United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (354, 16, N'Joel Obi', N'Centrocampista', 27, N' Torino')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (355, 16, N'Kelechi Iheanacho', N'Delantero', 22, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (356, 16, N'Simeon Nwankwo', N'Delantero', 26, N' Crotone')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (357, 16, N'Abdullahi Shehu', N'Defensa', 25, N' Bursaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (358, 16, N'Victor Moses', N'Delantero', 27, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (359, 16, N'John Obi Mikel ', N'Centrocampista', 31, N' Tianjin Teda')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (360, 16, N'Odion Ighalo', N'Delantero', 28, N' Changchun Yatai')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (361, 16, N'Oghenekaro Etebo', N'Centrocampista', 22, N' Las Palmas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (362, 16, N'Ahmed Musa', N'Delantero', 25, N' CSKA Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (363, 16, N'Leon Balogun', N'Defensa', 29, N' Maguncia 05')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (364, 16, N'William Troost-Ekong', N'Defensa', 24, N' Bursaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (365, 16, N'Wilfred Ndidi', N'Centrocampista', 21, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (366, 16, N'Elderson Echiéjilé', N'Defensa', 30, N' Círculo de Brujas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (367, 16, N'Brian Idowu', N'Defensa', 26, N' Amkar Perm')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (368, 16, N'Ikechukwu Ezenwa', N'Portero', 29, N' Enyimba')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (369, 17, N'Ederson', N'Portero', 24, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (370, 17, N'Fagner', N'Defensa', 29, N' Corinthians')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (371, 17, N'Taison', N'Delantero', 30, N' Shajtar Donetsk')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (372, 17, N'Roberto Firmino', N'Delantero', 26, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (373, 17, N'Willian', N'Centrocampista', 29, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (374, 17, N'Fred', N'Centrocampista', 25, N' Shajtar Donetsk')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (375, 17, N'Fernandinho', N'Centrocampista', 33, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (376, 17, N'Cássio Ramos', N'Portero', 31, N' Corinthians')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (377, 17, N'Paulinho', N'Centrocampista', 29, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (378, 17, N'Danilo', N'Defensa', 26, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (379, 17, N'Marquinhos', N'Defensa', 24, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (380, 17, N'Marcelo', N'Defensa', 30, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (381, 17, N'Philippe Coutinho', N'Centrocampista', 26, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (382, 17, N'Neymar', N'Delantero', 26, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (383, 17, N'Gabriel Jesus', N'Delantero', 21, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (384, 17, N'Renato Augusto', N'Centrocampista', 30, N' Beijing Guoan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (385, 17, N'Douglas Costa', N'Delantero', 27, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (386, 17, N'Filipe Luís', N'Defensa', 32, N' Atlético de Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (387, 17, N'Casemiro', N'Centrocampista', 26, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (388, 17, N'Pedro Geromel', N'Defensa', 32, N' Grêmio')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (389, 17, N'João Miranda', N'Defensa', 33, N' Inter de Milán')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (390, 17, N'Thiago Silva ', N'Defensa', 33, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (391, 17, N'Alisson Becker', N'Portero', 25, N' Roma')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (392, 18, N'Xherdan Shaqiri', N'Centrocampista', 26, N' Stoke City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (393, 18, N'Fabian Schär', N'Defensa', 26, N' Deportivo La Coruña')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (394, 18, N'Roman Bürki', N'Portero', 27, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (395, 18, N'Johan Djourou', N'Defensa', 31, N' Antalyaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (396, 18, N'Josip Drmic', N'Delantero', 25, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (397, 18, N'Mario Gavranovic', N'Delantero', 28, N' Dinamo Zagreb')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (398, 18, N'Denis Zakaria', N'Centrocampista', 21, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (399, 18, N'Gelson Fernandes', N'Centrocampista', 31, N' Eintracht Fráncfort')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (400, 18, N'Blerim Džemaili', N'Centrocampista', 32, N' Bologna')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (401, 18, N'Steven Zuber', N'Centrocampista', 26, N' Hoffenheim')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (402, 18, N'Ricardo Rodríguez', N'Defensa', 25, N' Milan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (403, 18, N'Yvon Mvogo', N'Portero', 24, N' RB Leipzig')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (404, 18, N'Valon Behrami', N'Centrocampista', 33, N' Udinese')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (405, 18, N'Granit Xhaka', N'Centrocampista', 25, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (406, 18, N'Haris Seferovic', N'Delantero', 26, N' Benfica')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (407, 18, N'Remo Freuler', N'Centrocampista', 26, N' Atalanta')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (408, 18, N'Breel Embolo', N'Delantero', 21, N' Schalke 04')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (409, 18, N'Michael Lang', N'Defensa', 27, N' Basilea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (410, 18, N'Manuel Akanji', N'Defensa', 22, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (411, 18, N'Nico Elvedi', N'Defensa', 21, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (412, 18, N'François Moubandje', N'Defensa', 27, N' Toulouse')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (413, 18, N'Stephan Lichtsteiner ', N'Defensa', 34, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (414, 18, N'Yann Sommer', N'Portero', 29, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (415, 19, N'Leonel Moreira', N'Portero', 28, N' Herediano')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (416, 19, N'Kenner Gutiérrez', N'Defensa', 29, N' Alajuelense')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (417, 19, N'Marco Ureña', N'Delantero', 28, N' Los Angeles')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (418, 19, N'David Guzmán', N'Centrocampista', 28, N' Portland Timbers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (419, 19, N'Kendall Waston', N'Defensa', 30, N' Vancouver Whitecaps')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (420, 19, N'Patrick Pemberton', N'Portero', 36, N' Alajuelense')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (421, 19, N'Yeltsin Tejeda', N'Centrocampista', 26, N' Lausanne-Sport')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (422, 19, N'Cristian Gamboa', N'Defensa', 28, N' Celtic')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (423, 19, N'Francisco Calvo', N'Defensa', 25, N' Minnesota United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (424, 19, N'Randall Azofeifa', N'Centrocampista', 33, N' Herediano')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (425, 19, N'Rodney Wallace', N'Centrocampista', 29, N' New York City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (426, 19, N'Joel Campbell', N'Delantero', 25, N' Real Betis')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (427, 19, N'Johan Venegas', N'Delantero', 29, N' Deportivo Saprissa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (428, 19, N'Bryan Ruiz ', N'Centrocampista', 32, N' Sporting de Lisboa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (429, 19, N'Daniel Colindres', N'Centrocampista', 33, N' Deportivo Saprissa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (430, 19, N'Bryan Oviedo', N'Defensa', 28, N' Sunderland')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (431, 19, N'Christian Bolaños', N'Centrocampista', 34, N' Deportivo Saprissa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (432, 19, N'Óscar Duarte', N'Defensa', 29, N' Español')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (433, 19, N'Celso Borges', N'Centrocampista', 30, N' Deportivo La Coruña')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (434, 19, N'Ian Smith', N'Defensa', 20, N' IFK Norrköping')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (435, 19, N'Giancarlo González', N'Defensa', 30, N' Bologna')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (436, 19, N'Johnny Acosta', N'Defensa', 34, N' Águilas Doradas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (437, 19, N'Keylor Navas', N'Portero', 31, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (438, 20, N'Marko Dmitrovic', N'Portero', 26, N' Eibar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (439, 20, N'Adem Ljajic', N'Centrocampista', 26, N' Torino')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (440, 20, N'Nemanja Matic', N'Centrocampista', 29, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (441, 20, N'Sergej Milinkovic-Savic', N'Centrocampista', 23, N' Lazio')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (442, 20, N'Luka Jovic', N'Delantero', 20, N' Eintracht Fráncfort')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (443, 20, N'Nemanja Radonjic', N'Delantero', 22, N' Estrella Roja')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (444, 20, N'Filip Kostic', N'Centrocampista', 25, N' Hamburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (445, 20, N'Marko Grujic', N'Centrocampista', 22, N' Cardiff City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (446, 20, N'Nikola Milenkovic', N'Defensa', 20, N' Fiorentina')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (447, 20, N'Milan Rodic', N'Defensa', 27, N' Estrella Roja')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (448, 20, N'Miloš Veljkovic', N'Defensa', 22, N' Werder Bremen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (449, 20, N'Predrag Rajkovic', N'Portero', 22, N' Maccabi Tel Aviv')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (450, 20, N'Aleksandar Kolarov ', N'Defensa', 32, N' Roma')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (451, 20, N'Dušan Tadic', N'Centrocampista', 29, N' Southampton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (452, 20, N'Aleksandar Mitrovic', N'Delantero', 23, N' Fulham')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (453, 20, N'Aleksandar Prijovic', N'Delantero', 28, N' PAOK Salónica')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (454, 20, N'Andrija Živkovic', N'Centrocampista', 21, N' Benfica')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (455, 20, N'Branislav Ivanovic', N'Defensa', 34, N' Zenit de San Petersburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (456, 20, N'Uroš Spajic', N'Defensa', 25, N' Anderlecht')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (457, 20, N'Luka Milivojevic', N'Centrocampista', 27, N' Crystal Palace')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (458, 20, N'Duško Tošic', N'Defensa', 33, N' Besiktas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (459, 20, N'Antonio Rukavina', N'Defensa', 34, N' Villarreal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (460, 20, N'Vladimir Stojkovic', N'Portero', 34, N' Partizán Belgrado')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (461, 21, N'Mario Gómez', N'Delantero', 32, N' Stuttgart')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (462, 21, N'Marc-André ter Stegen', N'Portero', 26, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (463, 21, N'Ilkay Gündogan', N'Centrocampista', 27, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (464, 21, N'Julian Brandt', N'Centrocampista', 22, N' Bayer Leverkusen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (465, 21, N'Sebastian Rudy', N'Centrocampista', 28, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (466, 21, N'Joshua Kimmich', N'Defensa', 23, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (467, 21, N'Jérôme Boateng', N'Defensa', 29, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (468, 21, N'Antonio Rüdiger', N'Defensa', 25, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (469, 21, N'Niklas Süle', N'Defensa', 22, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (470, 21, N'Leon Goretzka', N'Centrocampista', 23, N' Schalke 04')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (471, 21, N'Thomas Müller', N'Centrocampista', 28, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (472, 21, N'Kevin Trapp', N'Portero', 27, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (473, 21, N'Marco Reus', N'Delantero', 29, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (474, 21, N'Mesut Özil', N'Centrocampista', 29, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (475, 21, N'Timo Werner', N'Delantero', 22, N' RB Leipzig')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (476, 21, N'Toni Kroos', N'Centrocampista', 28, N' Real Madrid')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (477, 21, N'Julian Draxler', N'Centrocampista', 24, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (478, 21, N'Sami Khedira', N'Centrocampista', 31, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (479, 21, N'Mats Hummels', N'Defensa', 29, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (480, 21, N'Matthias Ginter', N'Defensa', 24, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (481, 21, N'Jonas Hector', N'Defensa', 28, N' Colonia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (482, 21, N'Marvin Plattenhardt', N'Defensa', 26, N' Hertha Berlín')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (483, 21, N'Manuel Neuer ', N'Portero', 32, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (484, 22, N'Jesús Gallardo', N'Centrocampista', 23, N' Pumas UNAM')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (485, 22, N'Hirving Lozano', N'Delantero', 22, N' PSV Eindhoven')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (486, 22, N'Edson Álvarez', N'Defensa', 20, N' América')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (487, 22, N'Javier Aquino', N'Centrocampista', 28, N' Tigres UANL')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (488, 22, N'Oribe Peralta', N'Delantero', 34, N' América')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (489, 22, N'Andrés Guardado', N'Centrocampista', 31, N' Real Betis')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (490, 22, N'Jesús Manuel Corona', N'Centrocampista', 25, N' Porto')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (491, 22, N'Héctor Herrera', N'Defensa', 28, N' Porto')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (492, 22, N'Héctor Moreno', N'Defensa', 30, N' Real Sociedad')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (493, 22, N'Javier Hernández', N'Delantero', 30, N' West Ham United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (494, 22, N'Guillermo Ochoa', N'Portero', 32, N' Standard Lieja')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (495, 22, N'Alfredo Talavera', N'Portero', 35, N' Toluca')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (496, 22, N'Carlos Vela', N'Delantero', 29, N' Los Angeles')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (497, 22, N'Giovani dos Santos', N'Centrocampista', 29, N' Los Angeles Galaxy')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (498, 22, N'Raúl Jiménez', N'Delantero', 27, N' Benfica')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (499, 22, N'Marco Fabián', N'Delantero', 28, N' Eintracht Fráncfort')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (500, 22, N'Miguel Layún', N'Centrocampista', 29, N' Sevilla')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (501, 22, N'Jonathan dos Santos', N'Centrocampista', 28, N' Los Angeles Galaxy')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (502, 22, N'Érick Gutiérrez', N'Centrocampista', 22, N' Pachuca')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (503, 22, N'Rafael Márquez ', N'Defensa', 39, N' Atlas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (504, 22, N'Carlos Salcedo', N'Defensa', 24, N' Eintracht Fráncfort')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (505, 22, N'Hugo Ayala', N'Defensa', 31, N' Tigres UANL')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (506, 22, N'José de Jesús Corona', N'Portero', 37, N' Cruz Azul')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (507, 23, N'Kristoffer Nordfeldt', N'Portero', 28, N' Swansea City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (508, 23, N'Isaac Kiese Thelin', N'Delantero', 25, N' Waasland-Beveren')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (509, 23, N'Jimmy Durmaz', N'Centrocampista', 29, N' Toulouse')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (510, 23, N'Ola Toivonen', N'Delantero', 31, N' Toulouse')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (511, 23, N'Marcus Rohdén', N'Centrocampista', 27, N' Crotone')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (512, 23, N'Pontus Jansson', N'Defensa', 27, N' Leeds United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (513, 23, N'Viktor Claesson', N'Centrocampista', 26, N' Krasnodar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (514, 23, N'Emil Krafth', N'Defensa', 23, N' Bologna')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (515, 23, N'Oscar Hiljemark', N'Centrocampista', 25, N' Genoa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (516, 23, N'Filip Helander', N'Defensa', 25, N' Bologna')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (517, 23, N'Gustav Svensson', N'Centrocampista', 31, N' Seattle Sounders')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (518, 23, N'Karl-Johan Johnsson', N'Portero', 28, N' Guingamp')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (519, 23, N'John Guidetti', N'Delantero', 26, N' Alavés')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (520, 23, N'Emil Forsberg', N'Centrocampista', 26, N' RB Leipzig')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (521, 23, N'Marcus Berg', N'Delantero', 31, N' Al-Ain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (522, 23, N'Albin Ekdal', N'Centrocampista', 28, N' Hamburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (523, 23, N'Sebastian Larsson', N'Centrocampista', 33, N' Hull City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (524, 23, N'Ludwig Augustinsson', N'Defensa', 24, N' Werder Bremen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (525, 23, N'Martin Olsson', N'Defensa', 30, N' Swansea City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (526, 23, N'Andreas Granqvist ', N'Defensa', 33, N' Krasnodar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (527, 23, N'Victor Lindelöf', N'Defensa', 23, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (528, 23, N'Mikael Lustig', N'Defensa', 31, N' Celtic')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (529, 23, N'Robin Olsen', N'Portero', 28, N' Copenhague')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (530, 24, N'Jo Hyeon-woo', N'Portero', 26, N' Daegu')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (531, 24, N'Go Yo-han', N'Defensa', 30, N' Seoul')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (532, 24, N'Kim Jin-hyeon', N'Portero', 30, N' Cerezo Osaka')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (533, 24, N'Jang Hyun-soo', N'Defensa', 26, N' Tokyo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (534, 24, N'Kim Young-gwon', N'Defensa', 28, N' Guangzhou Evergrande')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (535, 24, N'Moon Seon-min', N'Centrocampista', 26, N' Incheon United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (536, 24, N'Lee Jae-sung', N'Centrocampista', 25, N' Jeonbuk Hyundai Motors')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (537, 24, N'Ki Sung-yueng ', N'Centrocampista', 29, N' Swansea City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (538, 24, N'Jung Woo-young', N'Centrocampista', 28, N' Vissel Kobe')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (539, 24, N'Hong Chul', N'Defensa', 27, N' Sangju Sangmu')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (540, 24, N'Koo Ja-cheol', N'Centrocampista', 29, N' Augsburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (541, 24, N'Kim Min-woo', N'Defensa', 28, N' Sangju Sangmu')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (542, 24, N'Hwang Hee-chan', N'Delantero', 22, N' Red Bull Salzburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (543, 24, N'Lee Seung-woo', N'Centrocampista', 20, N' Hellas Verona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (544, 24, N'Kim Shin-wook', N'Delantero', 30, N' Jeonbuk Hyundai Motors')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (545, 24, N'Ju Se-jong', N'Centrocampista', 27, N' Ansan Mugunghwa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (546, 24, N'Son Heung-min', N'Delantero', 25, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (547, 24, N'Park Joo-ho', N'Defensa', 31, N' Ulsan Hyundai')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (548, 24, N'Yun Young-sun', N'Defensa', 29, N' Seongnam')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (549, 24, N'Oh Ban-suk', N'Defensa', 30, N' Jeju United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (550, 24, N'Jung Seung-hyun', N'Defensa', 24, N' Sagan Tosu')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (551, 24, N'Lee Yong', N'Defensa', 31, N' Jeonbuk Hyundai Motors')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (552, 24, N'Kim Seung-gyu', N'Portero', 27, N' Vissel Kobe')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (553, 25, N'Leander Dendoncker', N'Defensa', 23, N' Anderlecht')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (554, 25, N'Nacer Chadli', N'Centrocampista', 28, N' West Bromwich Albion')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (555, 25, N'Michy Batshuayi', N'Delantero', 24, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (556, 25, N'Dedryck Boyata', N'Defensa', 27, N' Celtic')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (557, 25, N'Mousa Dembélé', N'Centrocampista', 30, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (558, 25, N'Adnan Januzaj', N'Delantero', 23, N' Real Sociedad')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (559, 25, N'Youri Tielemans', N'Centrocampista', 21, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (560, 25, N'Thorgan Hazard', N'Centrocampista', 25, N' Borussia Mönchengladbach')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (561, 25, N'Thomas Meunier', N'Defensa', 26, N' Paris Saint-Germain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (562, 25, N'Dries Mertens', N'Delantero', 31, N' Napoli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (563, 25, N'Koen Casteels', N'Portero', 25, N' Wolfsburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (564, 25, N'Simon Mignolet', N'Portero', 30, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (565, 25, N'Yannick Carrasco', N'Centrocampista', 24, N' Dalian Yifang')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (566, 25, N'Eden Hazard ', N'Delantero', 27, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (567, 25, N'Romelu Lukaku', N'Delantero', 25, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (568, 25, N'Marouane Fellaini', N'Centrocampista', 30, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (569, 25, N'Kevin De Bruyne', N'Centrocampista', 26, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (570, 25, N'Axel Witsel', N'Centrocampista', 29, N' Tianjin Quanjian')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (571, 25, N'Jan Vertonghen', N'Defensa', 31, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (572, 25, N'Vincent Kompany', N'Defensa', 32, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (573, 25, N'Thomas Vermaelen', N'Defensa', 32, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (574, 25, N'Toby Alderweireld', N'Defensa', 29, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (575, 25, N'Thibaut Courtois', N'Portero', 26, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (576, 26, N'Felipe Baloy ', N'Defensa', 37, N' Municipal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (577, 26, N'Álex Rodríguez', N'Portero', 27, N' San Francisco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (578, 26, N'José Luis Rodríguez', N'Centrocampista', 19, N' Gante')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (579, 26, N'Aníbal Godoy', N'Centrocampista', 28, N' San Jose Earthquakes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (580, 26, N'Ricardo Ávila', N'Centrocampista', 21, N' Gante')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (581, 26, N'Luis Tejada', N'Delantero', 36, N' Sport Boys')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (582, 26, N'Luis Ovalle', N'Defensa', 29, N' Olimpia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (583, 26, N'Abdiel Arroyo', N'Delantero', 24, N' Alajuelense')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (584, 26, N'Eric Davis', N'Defensa', 27, N' Dunajská Streda')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (585, 26, N'Valentín Pimentel', N'Centrocampista', 27, N' Plaza Amador')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (586, 26, N'Adolfo Machado', N'Defensa', 33, N' Houston Dynamo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (587, 26, N'José Calderón', N'Portero', 32, N' Chorrillo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (588, 26, N'Armando Cooper', N'Centrocampista', 30, N' Universidad de Chile')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (589, 26, N'Ismael Díaz', N'Delantero', 21, N' Deportivo Fabril')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (590, 26, N'Gabriel Torres', N'Delantero', 29, N' Huachipato')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (591, 26, N'Édgar Bárcenas', N'Centrocampista', 24, N' Cafetaleros de Tapachula')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (592, 26, N'Blas Pérez', N'Delantero', 37, N' Municipal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (593, 26, N'Gabriel Gómez', N'Centrocampista', 34, N' Atlético Bucaramanga')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (594, 26, N'Román Torres', N'Defensa', 32, N' Seattle Sounders')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (595, 26, N'Fidel Escobar', N'Defensa', 23, N' New York Red Bulls')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (596, 26, N'Harold Cummings', N'Defensa', 26, N' San Jose Earthquakes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (597, 26, N'Michael Amir Murillo', N'Defensa', 22, N' New York Red Bulls')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (598, 26, N'Jaime Penedo', N'Portero', 36, N' Dinamo de Bucarest')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (599, 27, N'Naïm Sliti', N'Delantero', 25, N' Dijon')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (600, 27, N'Mouez Hassen', N'Portero', 23, N' Châteauroux')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (601, 27, N'Hamdi Nagguez', N'Defensa', 25, N' Zamalek')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (602, 27, N'Ghailene Chaalali', N'Delantero', 24, N' Espérance de Tunis')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (603, 27, N'Saber Khalifa', N'Delantero', 31, N' Club Africain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (604, 27, N'Bassem Srarfi', N'Delantero', 20, N' Niza')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (605, 27, N'Ellyes Skhiri', N'Centrocampista', 23, N' Montpellier')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (606, 27, N'Aymen Mathlouthi ', N'Portero', 33, N' Al-Batin')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (607, 27, N'Ahmed Khalil', N'Delantero', 23, N' Club Africain')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (608, 27, N'Mohamed Amine Ben Amor', N'Centrocampista', 26, N' Al-Ahli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (609, 27, N'Ferjani Sassi', N'Centrocampista', 26, N' Al-Nassr')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (610, 27, N'Ali Maâloul', N'Defensa', 28, N' Al-Ahly')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (611, 27, N'Dylan Bronn', N'Defensa', 22, N' Gante')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (612, 27, N'Wahbi Khazri', N'Delantero', 27, N' Stade Rennes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (613, 27, N'Anice Badri', N'Centrocampista', 27, N' Espérance de Tunis')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (614, 27, N'Fakhreddine Ben Youssef', N'Delantero', 26, N' Al-Ettifaq')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (615, 27, N'Saîf-Eddine Khaoui', N'Delantero', 23, N' Troyes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (616, 27, N'Rami Bedoui', N'Defensa', 28, N' Étoile du Sahel')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (617, 27, N'Oussama Haddadi', N'Defensa', 26, N' Dijon')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (618, 27, N'Yassine Meriah', N'Defensa', 24, N' Sfaxien')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (619, 27, N'Yohan Benalouane', N'Defensa', 31, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (620, 27, N'Syam Ben Youssef', N'Defensa', 29, N' Kasimpasa')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (621, 27, N'Farouk Ben Mustapha', N'Portero', 28, N' Al-Shabab')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (622, 28, N'Nick Pope', N'Portero', 26, N' Burnley')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (623, 28, N'Trent Alexander-Arnold', N'Defensa', 19, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (624, 28, N'Ruben Loftus-Cheek', N'Centrocampista', 22, N' Crystal Palace')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (625, 28, N'Dele Alli', N'Centrocampista', 22, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (626, 28, N'Marcus Rashford', N'Delantero', 20, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (627, 28, N'Ashley Young', N'Defensa', 32, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (628, 28, N'Fabian Delph', N'Defensa', 28, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (629, 28, N'Phil Jones', N'Defensa', 26, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (630, 28, N'Gary Cahill', N'Defensa', 32, N' Chelsea')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (631, 28, N'Danny Welbeck', N'Delantero', 27, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (632, 28, N'Jack Butland', N'Portero', 25, N' Stoke City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (633, 28, N'Kieran Trippier', N'Defensa', 27, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (634, 28, N'Jamie Vardy', N'Delantero', 31, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (635, 28, N'Raheem Sterling', N'Delantero', 23, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (636, 28, N'Harry Kane ', N'Delantero', 24, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (637, 28, N'Jordan Henderson', N'Centrocampista', 27, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (638, 28, N'Jesse Lingard', N'Centrocampista', 25, N' Manchester United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (639, 28, N'Harry Maguire', N'Defensa', 25, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (640, 28, N'John Stones', N'Defensa', 24, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (641, 28, N'Eric Dier', N'Centrocampista', 24, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (642, 28, N'Danny Rose', N'Defensa', 27, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (643, 28, N'Kyle Walker', N'Defensa', 28, N' Manchester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (644, 28, N'Jordan Pickford', N'Portero', 24, N' Everton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (645, 29, N'Dawid Kownacki', N'Delantero', 21, N' Sampdoria')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (646, 29, N'Lukasz Fabianski', N'Portero', 33, N' Swansea City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (647, 29, N'Rafal Kurzawa', N'Centrocampista', 25, N' Górnik Zabrze')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (648, 29, N'Lukasz Piszczek', N'Defensa', 33, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (649, 29, N'Piotr Zielinski', N'Centrocampista', 24, N' Napoli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (650, 29, N'Bartosz Bereszynski', N'Defensa', 25, N' Sampdoria')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (651, 29, N'Slawomir Peszko', N'Centrocampista', 33, N' Lechia Gdansk')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (652, 29, N'Jakub Blaszczykowski', N'Centrocampista', 32, N' Wolfsburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (653, 29, N'Kamil Glik', N'Defensa', 30, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (654, 29, N'Lukasz Teodorczyk', N'Delantero', 27, N' Anderlecht')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (655, 29, N'Maciej Rybus', N'Centrocampista', 28, N' Lokomotiv Moscú')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (656, 29, N'Bartosz Bialkowski', N'Portero', 30, N' Ipswich Town')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (657, 29, N'Kamil Grosicki', N'Centrocampista', 30, N' Hull City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (658, 29, N'Grzegorz Krychowiak', N'Centrocampista', 28, N' West Bromwich Albion')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (659, 29, N'Robert Lewandowski ', N'Delantero', 29, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (660, 29, N'Karol Linetty', N'Centrocampista', 23, N' Sampdoria')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (661, 29, N'Arkadiusz Milik', N'Delantero', 24, N' Napoli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (662, 29, N'Jacek Góralski', N'Centrocampista', 25, N' Ludogorets Razgrad')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (663, 29, N'Jan Bednarek', N'Defensa', 22, N' Southampton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (664, 29, N'Thiago Cionek', N'Defensa', 32, N' SPAL')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (665, 29, N'Artur Jedrzejczyk', N'Defensa', 30, N' Legia Varsovia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (666, 29, N'Michal Pazdan', N'Defensa', 30, N' Legia Varsovia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (667, 29, N'Wojciech Szczesny', N'Portero', 28, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (668, 30, N'Alfred Gomis', N'Portero', 24, N' SPAL')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (669, 30, N'Moussa Wagué', N'Defensa', 19, N' Eupen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (670, 30, N'Lamine Gassama', N'Defensa', 28, N' Alanyaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (671, 30, N'Keita Baldé', N'Delantero', 23, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (672, 30, N'M Baye Niang', N'Delantero', 23, N' Torino')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (673, 30, N'Ismaïla Sarr', N'Delantero', 20, N' Stade Rennes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (674, 30, N'Badou Ndiaye', N'Centrocampista', 27, N' Stoke City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (675, 30, N'Khadim Ndiaye', N'Portero', 33, N' Horoya')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (676, 30, N'Diafra Sakho', N'Delantero', 28, N' Stade Rennes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (677, 30, N'Moussa Konaté', N'Delantero', 25, N' Amiens')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (678, 30, N'Alfred N Diaye', N'Centrocampista', 28, N' Wolverhampton Wanderers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (679, 30, N'Youssouf Sabaly', N'Defensa', 25, N' Girondins de Burdeos')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (680, 30, N'Cheikh N Doye', N'Centrocampista', 32, N' Birmingham City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (681, 30, N'Sadio Mané', N'Delantero', 26, N' Liverpool')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (682, 30, N'Mame Biram Diouf', N'Delantero', 30, N' Stoke City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (683, 30, N'Cheikhou Kouyaté ', N'Centrocampista', 28, N' West Ham United')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (684, 30, N'Moussa Sow', N'Delantero', 32, N' Bursaspor')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (685, 30, N'Salif Sané', N'Centrocampista', 27, N' Hannover 96')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (686, 30, N'Idrissa Gueye', N'Centrocampista', 28, N' Everton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (687, 30, N'Kara Mbodji', N'Defensa', 28, N' Anderlecht')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (688, 30, N'Kalidou Koulibaly', N'Defensa', 26, N' Napoli')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (689, 30, N'Adama Mbengue', N'Defensa', 24, N' Caen')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (690, 30, N'Abdoulaye Diallo', N'Portero', 26, N' Stade Rennes')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (691, 31, N'Davinson Sánchez', N'Defensa', 22, N' Tottenham Hotspur')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (692, 31, N'José Fernando Cuadrado', N'Portero', 33, N' Once Caldas')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (693, 31, N'José Izquierdo', N'Delantero', 25, N' Brighton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (694, 31, N'Juan Fernando Quintero', N'Centrocampista', 25, N' River Plate')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (695, 31, N'Miguel Borja', N'Delantero', 25, N' Palmeiras')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (696, 31, N'Farid Díaz', N'Defensa', 34, N' Olimpia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (697, 31, N'Johan Mojica', N'Defensa', 25, N' Girona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (698, 31, N'Jefferson Lerma', N'Centrocampista', 23, N' Levante')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (699, 31, N'Mateus Uribe', N'Centrocampista', 27, N' América')
GO
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (700, 31, N'Luis Muriel', N'Delantero', 27, N' Sevilla')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (701, 31, N'Yerry Mina', N'Defensa', 23, N' Barcelona')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (702, 31, N'Camilo Vargas', N'Portero', 29, N' Deportivo Cali')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (703, 31, N'Juan Guillermo Cuadrado', N'Centrocampista', 30, N' Juventus')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (704, 31, N'James Rodríguez', N'Centrocampista', 26, N' Bayern Múnich')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (705, 31, N'Radamel Falcao García ', N'Delantero', 32, N' Mónaco')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (706, 31, N'Abel Aguilar', N'Centrocampista', 33, N' Deportivo Cali')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (707, 31, N'Carlos Bacca', N'Delantero', 31, N' Villarreal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (708, 31, N'Carlos Sánchez', N'Centrocampista', 32, N' Español')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (709, 31, N'Wilmar Barrios', N'Centrocampista', 24, N' Boca Juniors')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (710, 31, N'Santiago Arias', N'Defensa', 26, N' PSV Eindhoven')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (711, 31, N'Óscar Murillo', N'Defensa', 30, N' Pachuca')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (712, 31, N'Cristian Zapata', N'Defensa', 31, N' Milan')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (713, 31, N'David Ospina', N'Portero', 29, N' Arsenal')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (714, 32, N'Kosuke Nakamura', N'Portero', 23, N' Kashiwa Reysol')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (715, 32, N'Maya Yoshida', N'Defensa', 29, N' Southampton')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (716, 32, N'Gotoku Sakai', N'Defensa', 27, N' Hamburgo')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (717, 32, N'Tomoaki Makino', N'Defensa', 31, N' Urawa Red Diamonds')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (718, 32, N'Hiroki Sakai', N'Defensa', 28, N' Olympique de Marsella')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (719, 32, N'Ryota Oshima', N'Centrocampista', 25, N' Kawasaki Frontale')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (720, 32, N'Makoto Hasebe ', N'Centrocampista', 34, N' Eintracht Fráncfort')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (721, 32, N'Hotaru Yamaguchi', N'Centrocampista', 27, N' Cerezo Osaka')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (722, 32, N'Yuya Osako', N'Delantero', 28, N' Colonia')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (723, 32, N'Takashi Inui', N'Centrocampista', 30, N' Eibar')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (724, 32, N'Yoshinori Muto', N'Delantero', 25, N' Maguncia 05')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (725, 32, N'Masaaki Higashiguchi', N'Portero', 32, N' Gamba Osaka')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (726, 32, N'Takashi Usami', N'Centrocampista', 26, N' Fortuna Düsseldorf')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (727, 32, N'Shinji Kagawa', N'Centrocampista', 29, N' Borussia Dortmund')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (728, 32, N'Shinji Okazaki', N'Delantero', 32, N' Leicester City')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (729, 32, N'Genki Haraguchi', N'Centrocampista', 27, N' Fortuna Düsseldorf')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (730, 32, N'Gaku Shibasaki', N'Centrocampista', 26, N' Getafe')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (731, 32, N'Wataru Endo', N'Defensa', 25, N' Urawa Red Diamonds')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (732, 32, N'Yuto Nagatomo', N'Defensa', 31, N' Galatasaray')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (733, 32, N'Keisuke Honda', N'Centrocampista', 32, N' Pachuca')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (734, 32, N'Gen Shoji', N'Defensa', 25, N' Kashima Antlers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (735, 32, N'Naomichi Ueda', N'Defensa', 23, N' Kashima Antlers')
INSERT [dbo].[Jugador] ([idJugador], [idPais], [nomJugador], [posicion], [edad], [club]) VALUES (736, 32, N'Eiji Kawashima', N'Portero', 35, N' Metz')
SET IDENTITY_INSERT [dbo].[Jugador] OFF
GO
SET IDENTITY_INSERT [dbo].[ModoGol] ON 

INSERT [dbo].[ModoGol] ([idModoGol], [modoGol]) VALUES (1, N'Gol Normal')
INSERT [dbo].[ModoGol] ([idModoGol], [modoGol]) VALUES (2, N'Autogol')
INSERT [dbo].[ModoGol] ([idModoGol], [modoGol]) VALUES (3, N'')
SET IDENTITY_INSERT [dbo].[ModoGol] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (1, N'Rusia', 1, 1, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (2, N'Arabia Saudita', 2, 1, 3)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (3, N'Egipto', 3, 1, 2)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (4, N'Uruguay', 4, 1, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (5, N'Portugal', 5, 2, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (6, N'España', 6, 2, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (7, N'Marruecos', 7, 2, 2)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (8, N'Irán', 8, 2, 3)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (9, N'Francia', 9, 3, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (10, N'Australia', 10, 3, 5)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (11, N'Perú', 11, 3, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (12, N'Dinamarca', 12, 3, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (13, N'Argentina', 13, 4, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (14, N'Islandia', 14, 4, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (15, N'Croacia', 15, 4, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (16, N'Nigeria', 16, 4, 2)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (17, N'Brasil', 17, 5, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (18, N'Suiza', 18, 5, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (19, N'Costa Rica', 19, 5, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (20, N'Serbia', 20, 5, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (21, N'Alemania', 21, 6, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (22, N'México', 22, 6, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (23, N'Suecia', 23, 6, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (24, N'Corea del Sur', 24, 6, 3)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (25, N'Bélgica', 25, 7, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (26, N'Panamá', 26, 7, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (27, N'Túnez', 27, 7, 2)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (28, N'Inglaterra', 28, 7, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (29, N'Polonia', 29, 8, 4)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (30, N'Senegal', 30, 8, 2)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (31, N'Colombia', 31, 8, 1)
INSERT [dbo].[Pais] ([idPais], [nomPais], [idTecnico], [idGrupo], [idContinente]) VALUES (32, N'Japón', 32, 8, 3)
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Tecnico] ON 

INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (1, N'Stanislav Cherchesov', N'Ruso', CAST(N'1963-09-02' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (2, N'Juan Antonio Pizzi', N'Chileno', CAST(N'1968-06-07' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (3, N'Héctor Cúper', N'Argentino', CAST(N'1955-11-16' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (4, N'Óscar Washington Tabárez', N'Uruguayo', CAST(N'1947-03-03' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (5, N'Fernando Santos', N'Portugués', CAST(N'1954-10-10' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (6, N'Fernando Hierro', N'Español', NULL)
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (7, N'Hervé Renard', N'Francés', CAST(N'1968-09-30' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (8, N'Carlos Queiroz', N'Mozambique', CAST(N'1953-03-01' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (9, N'Didier Deschamps', N'Francés', CAST(N'1968-10-15' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (10, N'Bert Van Marwijk', N'Holandés', CAST(N'1952-05-19' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (11, N'Ricardo Gareca', N'Argentino', CAST(N'1958-02-10' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (12, N'Age Hareide', N'Noruego', CAST(N'1953-09-23' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (13, N'Jorge Sampaoli', N'Argentino', CAST(N'1960-03-13' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (14, N'Heimir Hallgrímsson', N'Islandés', CAST(N'1967-06-10' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (15, N'Zlatko Dalic', N'Croata', CAST(N'1966-10-26' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (16, N'Gernot Rhor', N'Alemán', CAST(N'1953-06-28' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (17, N'Tite', N'Brasileño', CAST(N'1961-05-25' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (18, N'Vladimir Petkovic', N'Serbio', CAST(N'1963-08-15' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (19, N'Óscar Ramírez', N'CostaRicense', CAST(N'1964-12-08' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (20, N'Mladebn Krstajic', N'SerbiO', CAST(N'1974-03-04' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (21, N'Joachim Löw', N'Alemán', CAST(N'1960-02-03' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (22, N'Juan Carlos Osorio', N'Colombiano', CAST(N'1961-06-08' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (23, N'Janne Andersson', N'Sueco', CAST(N'1962-09-29' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (24, N'Shin Tae-Yong', N'Coreano', CAST(N'1970-10-11' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (25, N'Roberto Martínez', N'Español', CAST(N'1973-07-13' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (26, N'Hernán Darío Gómez', N'Colombiano', CAST(N'1956-02-03' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (27, N'Nabil Maaloul', N'Túnecino', CAST(N'1962-07-25' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (28, N'Gareth Southagate', N'Inglés', CAST(N'1970-09-30' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (29, N'Adam Nawalka', N'Polaco', CAST(N'1957-10-23' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (30, N'Aliou Cissé', N'Senegalés', CAST(N'1976-03-24' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (31, N'José Nestor Pékerman', N'Argentino', CAST(N'1949-09-03' AS Date))
INSERT [dbo].[Tecnico] ([idTecnico], [nomTecnico], [nacionalidad], [fechaNacimiento]) VALUES (32, N'Akira Nishino', N'Japonés', CAST(N'1955-04-07' AS Date))
SET IDENTITY_INSERT [dbo].[Tecnico] OFF
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [UserName], [Password]) VALUES (1, N'MARTIN RICHARD', N'EFIO RIVAS', N'RICHARD', N'123456')
GO
/****** Object:  Index [PK_Users]    Script Date: 28/09/2024 19:30:09 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [PK_Users] PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Arbitro]  WITH CHECK ADD  CONSTRAINT [FK_Arbitro_Confederacion] FOREIGN KEY([idConfederacion])
REFERENCES [dbo].[Confederacion] ([idConfederacion])
GO
ALTER TABLE [dbo].[Arbitro] CHECK CONSTRAINT [FK_Arbitro_Confederacion]
GO
ALTER TABLE [dbo].[Encuentro]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Arbitro] FOREIGN KEY([idArbitro])
REFERENCES [dbo].[Arbitro] ([idArbitro])
GO
ALTER TABLE [dbo].[Encuentro] CHECK CONSTRAINT [FK_Encuentro_Arbitro]
GO
ALTER TABLE [dbo].[Encuentro]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Estadio] FOREIGN KEY([idEstadio])
REFERENCES [dbo].[Estadio] ([idEstadio])
GO
ALTER TABLE [dbo].[Encuentro] CHECK CONSTRAINT [FK_Encuentro_Estadio]
GO
ALTER TABLE [dbo].[Encuentro]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Fase] FOREIGN KEY([idFase])
REFERENCES [dbo].[Fase] ([idFase])
GO
ALTER TABLE [dbo].[Encuentro] CHECK CONSTRAINT [FK_Encuentro_Fase]
GO
ALTER TABLE [dbo].[Encuentro]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Pais] FOREIGN KEY([idPaisL])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Encuentro] CHECK CONSTRAINT [FK_Encuentro_Pais]
GO
ALTER TABLE [dbo].[Encuentro]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Pais1] FOREIGN KEY([idPaisV])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Encuentro] CHECK CONSTRAINT [FK_Encuentro_Pais1]
GO
ALTER TABLE [dbo].[Encuentro_Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Jugador_Encuentro] FOREIGN KEY([idEncuentro])
REFERENCES [dbo].[Encuentro] ([idEncuentro])
GO
ALTER TABLE [dbo].[Encuentro_Jugador] CHECK CONSTRAINT [FK_Encuentro_Jugador_Encuentro]
GO
ALTER TABLE [dbo].[Encuentro_Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Encuentro_Jugador_Jugador] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugador] ([idJugador])
GO
ALTER TABLE [dbo].[Encuentro_Jugador] CHECK CONSTRAINT [FK_Encuentro_Jugador_Jugador]
GO
ALTER TABLE [dbo].[Gol]  WITH CHECK ADD  CONSTRAINT [FK_Gol_Encuentro] FOREIGN KEY([idEncuentro])
REFERENCES [dbo].[Encuentro] ([idEncuentro])
GO
ALTER TABLE [dbo].[Gol] CHECK CONSTRAINT [FK_Gol_Encuentro]
GO
ALTER TABLE [dbo].[Gol]  WITH CHECK ADD  CONSTRAINT [FK_Gol_Jugador] FOREIGN KEY([idJugador])
REFERENCES [dbo].[Jugador] ([idJugador])
GO
ALTER TABLE [dbo].[Gol] CHECK CONSTRAINT [FK_Gol_Jugador]
GO
ALTER TABLE [dbo].[Gol]  WITH CHECK ADD  CONSTRAINT [FK_Gol_ModoGol1] FOREIGN KEY([idModoGol])
REFERENCES [dbo].[ModoGol] ([idModoGol])
GO
ALTER TABLE [dbo].[Gol] CHECK CONSTRAINT [FK_Gol_ModoGol1]
GO
ALTER TABLE [dbo].[Jugador]  WITH CHECK ADD  CONSTRAINT [FK_Jugador_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Jugador] CHECK CONSTRAINT [FK_Jugador_Pais]
GO
ALTER TABLE [dbo].[Pais]  WITH CHECK ADD  CONSTRAINT [FK_Pais_Continente] FOREIGN KEY([idContinente])
REFERENCES [dbo].[Continente] ([idContinente])
GO
ALTER TABLE [dbo].[Pais] CHECK CONSTRAINT [FK_Pais_Continente]
GO
ALTER TABLE [dbo].[Pais]  WITH CHECK ADD  CONSTRAINT [FK_Pais_Grupo] FOREIGN KEY([idGrupo])
REFERENCES [dbo].[Grupo] ([idGrupo])
GO
ALTER TABLE [dbo].[Pais] CHECK CONSTRAINT [FK_Pais_Grupo]
GO
ALTER TABLE [dbo].[Pais]  WITH CHECK ADD  CONSTRAINT [FK_Pais_Tecnico] FOREIGN KEY([idTecnico])
REFERENCES [dbo].[Tecnico] ([idTecnico])
GO
ALTER TABLE [dbo].[Pais] CHECK CONSTRAINT [FK_Pais_Tecnico]
GO
/****** Object:  StoredProcedure [dbo].[GrupoDelete]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoDelete]
				 @idGrupo AS INT
AS
BEGIN
	DELETE FROM Grupo WHERE idGrupo = @idGrupo
END
GO
/****** Object:  StoredProcedure [dbo].[GrupoGetByID]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoGetByID]
				@idGrupo AS INT
AS
BEGIN

    SELECT	idGrupo
			,descripcion
    FROM	Grupo
    WHERE	idGrupo=@idGrupo

END
GO
/****** Object:  StoredProcedure [dbo].[GrupoInsert]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoInsert]
				@descripcion AS CHAR(1)
AS
BEGIN
		INSERT INTO Grupo(descripcion)
				VALUES(@descripcion)
END
GO
/****** Object:  StoredProcedure [dbo].[GrupoList]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoList]
AS
BEGIN

	SELECT	idGrupo
			,descripcion
	FROM	Grupo

END
GO
/****** Object:  StoredProcedure [dbo].[GrupoListWithPagination]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoListWithPagination]
(
    @PageNumber int,
    @PageSize int
)
AS
BEGIN

    SELECT	idGrupo
			,descripcion
    FROM	Grupo
    ORDER BY idGrupo
    OFFSET (@PageNumber-1)*@PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY
END
GO
/****** Object:  StoredProcedure [dbo].[GrupoUpdate]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GrupoUpdate]
				 @idGrupo AS INT
				 ,@descripcion AS CHAR(1)
AS
BEGIN
	UPDATE Grupo
	SET descripcion = @descripcion
	WHERE idGrupo = @idGrupo
END
GO
/****** Object:  StoredProcedure [dbo].[PaisInsert]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaisInsert]
				@nomPais		AS VARCHAR(50)
				,@idTecnico		AS INT
				,@idGrupo		AS INT
				,@idContinente	AS INT
AS
BEGIN
	INSERT INTO Pais (nomPais, idTecnico, idGrupo, idContinente)
			VALUES (@nomPais, @idTecnico, @idGrupo, @idContinente);
END
GO
/****** Object:  StoredProcedure [dbo].[PaisList]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaisList]
AS
BEGIN
	SELECT		p.idPais
				,p.nomPais
				,g.idGrupo
				,g.descripcion
	FROM		Pais AS p
	INNER JOIN	Grupo AS g ON p.idGrupo = g.idGrupo
END
GO
/****** Object:  StoredProcedure [dbo].[PaisListAll]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PaisListAll]
AS
BEGIN
	SELECT		p.idPais
				,p.nomPais
				,g.idGrupo
				,g.descripcion
				,c.idContinente
				,c.descripcion
				,t.idTecnico
				,t.nomTecnico
				,t.nacionalidad
				,t.fechaNacimiento
	FROM		Pais AS p
	INNER JOIN	Grupo		AS g ON p.idGrupo = g.idGrupo
	INNER JOIN	Continente  AS c ON p.idContinente = c.idContinente
	INNER JOIN	Tecnico		AS t ON t.idTecnico = p.idTecnico
END
GO
/****** Object:  StoredProcedure [dbo].[UsersGetByUserAndPassword]    Script Date: 28/09/2024 19:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsersGetByUserAndPassword]
(
    @UserName varchar(50),
    @Password varchar(50)
)
AS
BEGIN
    SELECT UserId, FirstName, LastName, UserName, NULL as Password
    FROM Users
    WHERE UserName = @UserName and Password = @Password
END
GO
