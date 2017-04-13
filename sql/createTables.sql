create table Nodes (
Id int IDENTITY(1,1) Primary key)


CREATE TABLE nodes_paths (
  [ancestor_id] int NOT NULL,
  [descendant_id] int NOT NULL,
  PRIMARY KEY ([ancestor_id],[descendant_id]) ,
  CONSTRAINT [nodes_paths_ibfk_1] FOREIGN KEY ([ancestor_id])   REFERENCES dbo.Nodes ([id]) ,
  CONSTRAINT [nodes_paths_ibfk_2] FOREIGN KEY ([descendant_id]) REFERENCES dbo.Nodes ([id]) 
) ;

CREATE INDEX [descendant_id] ON nodes_paths ([descendant_id]);





create table Platforms (
Id int IDENTITY(1,1) Primary key,
ForeignId INT NOT NULL,
CONSTRAINT FK_Platforms_ProjectItems FOREIGN KEY (ForeignId) REFERENCES Nodes(Id),

PlatformData1 varchar(10),
PlatformData2 varchar(10)
)


create table Transformers (
Id int IDENTITY(1,1) Primary key,
ForeignId INT NOT NULL,
CONSTRAINT FK_Transformers_ProjectItems FOREIGN KEY (ForeignId) REFERENCES Nodes(Id),

XformerData1 varchar(10),
XformerData2 varchar(10)
)

create table Clusters (
Id int IDENTITY(1,1) Primary key,
ForeignId INT NOT NULL,
CONSTRAINT FK_Clusters_ProjectItems FOREIGN KEY (ForeignId) REFERENCES Nodes(Id),

ClusterData1 varchar(10),
ClusterData2 varchar(10)
)

create table Axes (
Id int IDENTITY(1,1) Primary key,
ForeignId INT NOT NULL,
CONSTRAINT FK_Axes_ProjectItems FOREIGN KEY (ForeignId) REFERENCES Nodes(Id),

AxisData1 varchar(10),
AxisData2 varchar(10)
)

create table Projects (
Id int IDENTITY(1,1) Primary key,
ForeignId INT NOT NULL,
CONSTRAINT FK_Projects_ProjectItems FOREIGN KEY (ForeignId) REFERENCES Nodes(Id),

ProjectData1 varchar(10),
ProjectData2 varchar(10)
)
