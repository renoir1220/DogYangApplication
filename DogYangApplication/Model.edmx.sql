
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/24/2019 21:43:13
-- Generated from EDMX file: C:\Users\renoi\source\repos\DogYangApplication\DogYangApplication\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DogYang];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ActivityTargetPopulation_Activity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivityTargetPopulation] DROP CONSTRAINT [FK_ActivityTargetPopulation_Activity];
GO
IF OBJECT_ID(N'[dbo].[FK_ActivityTargetPopulation_TargetPopulation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ActivityTargetPopulation] DROP CONSTRAINT [FK_ActivityTargetPopulation_TargetPopulation];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductActivity_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductActivity] DROP CONSTRAINT [FK_ProductActivity_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductActivity_Activity]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductActivity] DROP CONSTRAINT [FK_ProductActivity_Activity];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductTargetPopulation_Product]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductTargetPopulation] DROP CONSTRAINT [FK_ProductTargetPopulation_Product];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductTargetPopulation_TargetPopulation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductTargetPopulation] DROP CONSTRAINT [FK_ProductTargetPopulation_TargetPopulation];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ProductSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductSet];
GO
IF OBJECT_ID(N'[dbo].[ActivitySet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActivitySet];
GO
IF OBJECT_ID(N'[dbo].[TargetPopulationSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TargetPopulationSet];
GO
IF OBJECT_ID(N'[dbo].[ActivityTargetPopulation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ActivityTargetPopulation];
GO
IF OBJECT_ID(N'[dbo].[ProductActivity]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductActivity];
GO
IF OBJECT_ID(N'[dbo].[ProductTargetPopulation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductTargetPopulation];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ProductSet'
CREATE TABLE [dbo].[ProductSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [PicPath] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ActivitySet'
CREATE TABLE [dbo].[ActivitySet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StartTime] datetime  NOT NULL
);
GO

-- Creating table 'TargetPopulationSet'
CREATE TABLE [dbo].[TargetPopulationSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ActivityTargetPopulation'
CREATE TABLE [dbo].[ActivityTargetPopulation] (
    [Activity_Id] int  NOT NULL,
    [TargetPopulation_Id] int  NOT NULL
);
GO

-- Creating table 'ProductActivity'
CREATE TABLE [dbo].[ProductActivity] (
    [Product_Id] int  NOT NULL,
    [Activity_Id] int  NOT NULL
);
GO

-- Creating table 'ProductTargetPopulation'
CREATE TABLE [dbo].[ProductTargetPopulation] (
    [Product_Id] int  NOT NULL,
    [TargetPopulation_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ProductSet'
ALTER TABLE [dbo].[ProductSet]
ADD CONSTRAINT [PK_ProductSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ActivitySet'
ALTER TABLE [dbo].[ActivitySet]
ADD CONSTRAINT [PK_ActivitySet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TargetPopulationSet'
ALTER TABLE [dbo].[TargetPopulationSet]
ADD CONSTRAINT [PK_TargetPopulationSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Activity_Id], [TargetPopulation_Id] in table 'ActivityTargetPopulation'
ALTER TABLE [dbo].[ActivityTargetPopulation]
ADD CONSTRAINT [PK_ActivityTargetPopulation]
    PRIMARY KEY CLUSTERED ([Activity_Id], [TargetPopulation_Id] ASC);
GO

-- Creating primary key on [Product_Id], [Activity_Id] in table 'ProductActivity'
ALTER TABLE [dbo].[ProductActivity]
ADD CONSTRAINT [PK_ProductActivity]
    PRIMARY KEY CLUSTERED ([Product_Id], [Activity_Id] ASC);
GO

-- Creating primary key on [Product_Id], [TargetPopulation_Id] in table 'ProductTargetPopulation'
ALTER TABLE [dbo].[ProductTargetPopulation]
ADD CONSTRAINT [PK_ProductTargetPopulation]
    PRIMARY KEY CLUSTERED ([Product_Id], [TargetPopulation_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Activity_Id] in table 'ActivityTargetPopulation'
ALTER TABLE [dbo].[ActivityTargetPopulation]
ADD CONSTRAINT [FK_ActivityTargetPopulation_Activity]
    FOREIGN KEY ([Activity_Id])
    REFERENCES [dbo].[ActivitySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TargetPopulation_Id] in table 'ActivityTargetPopulation'
ALTER TABLE [dbo].[ActivityTargetPopulation]
ADD CONSTRAINT [FK_ActivityTargetPopulation_TargetPopulation]
    FOREIGN KEY ([TargetPopulation_Id])
    REFERENCES [dbo].[TargetPopulationSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ActivityTargetPopulation_TargetPopulation'
CREATE INDEX [IX_FK_ActivityTargetPopulation_TargetPopulation]
ON [dbo].[ActivityTargetPopulation]
    ([TargetPopulation_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'ProductActivity'
ALTER TABLE [dbo].[ProductActivity]
ADD CONSTRAINT [FK_ProductActivity_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[ProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Activity_Id] in table 'ProductActivity'
ALTER TABLE [dbo].[ProductActivity]
ADD CONSTRAINT [FK_ProductActivity_Activity]
    FOREIGN KEY ([Activity_Id])
    REFERENCES [dbo].[ActivitySet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductActivity_Activity'
CREATE INDEX [IX_FK_ProductActivity_Activity]
ON [dbo].[ProductActivity]
    ([Activity_Id]);
GO

-- Creating foreign key on [Product_Id] in table 'ProductTargetPopulation'
ALTER TABLE [dbo].[ProductTargetPopulation]
ADD CONSTRAINT [FK_ProductTargetPopulation_Product]
    FOREIGN KEY ([Product_Id])
    REFERENCES [dbo].[ProductSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TargetPopulation_Id] in table 'ProductTargetPopulation'
ALTER TABLE [dbo].[ProductTargetPopulation]
ADD CONSTRAINT [FK_ProductTargetPopulation_TargetPopulation]
    FOREIGN KEY ([TargetPopulation_Id])
    REFERENCES [dbo].[TargetPopulationSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductTargetPopulation_TargetPopulation'
CREATE INDEX [IX_FK_ProductTargetPopulation_TargetPopulation]
ON [dbo].[ProductTargetPopulation]
    ([TargetPopulation_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------