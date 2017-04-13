insert dbo.ProjectItems default values;
insert dbo.ProjectItems default values;
insert dbo.ProjectItems default values;
insert dbo.ProjectItems default values;
insert dbo.ProjectItems default values;
insert dbo.ProjectItems default values;



insert into dbo.Projects values (1,'project1','yay')
insert into dbo.Platforms values (2,'platform1','yay')
insert into dbo.Clusters values (3,'cluster1','yay')
insert into dbo.Axes values (4,'axis1', 'yay');
insert into dbo.Axes values (5,'axis2', 'yay');




--populate hierarchy
exec [dbo].[InsertNode] @ancestor=1,@projectItem=1
exec [dbo].[InsertNode] @ancestor=1,@projectItem=2
exec [dbo].[InsertNode] @ancestor=2,@projectItem=3
exec [dbo].[InsertNode] @ancestor=3,@projectItem=4
exec [dbo].[InsertNode] @ancestor=3,@projectItem=5
