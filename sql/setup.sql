
CREATE TABLE [Login](
	[LoginId] [uniqueidentifier] NOT NULL,
	[PersonId] [uniqueidentifier] NOT NULL,
	[IP] [varchar](20) NULL,
	[DateLoggedIn] [datetime] NOT NULL,
	CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([LoginId] ASC)
)

CREATE TABLE [Person](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[AddressLine1] [nvarchar](250) NOT NULL,
	[AddressLine2] [nvarchar](250) NULL,
	[TownCity] [nvarchar](50) NOT NULL,
	[County] [nvarchar](50) NULL,
	[PostCode] [nvarchar](20) NOT NULL,
	[Type] [int] NULL,
	[DateCreated] [datetime] NOT NULL,
	[LastUpdated] [datetime] NULL,
	CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED ([Id] ASC)
)

CREATE TABLE [PersonsToServers](
	[PersonId] [uniqueidentifier] NOT NULL,
	[ServerId] [uniqueidentifier] NOT NULL,
	CONSTRAINT [PK_PersonToServers] PRIMARY KEY CLUSTERED ([PersonId] ASC, [ServerId] ASC)
)

CREATE TABLE [Server](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[IPWhitelist] [varchar](max) NOT NULL,
	CONSTRAINT [PK_Server] PRIMARY KEY CLUSTERED ([Id] ASC)
)

ALTER TABLE [Login]
ADD CONSTRAINT [FK_Login_Person] FOREIGN KEY([PersonId])
REFERENCES [Person] ([Id])

ALTER TABLE [PersonsToServers]
ADD CONSTRAINT [FK_PersonsToServers_Person] FOREIGN KEY([PersonId])
REFERENCES [Person] ([Id])

ALTER TABLE [PersonsToServers]
ADD CONSTRAINT [FK_PersonsToServers_Server] FOREIGN KEY([ServerId])
REFERENCES [Server] ([Id])

