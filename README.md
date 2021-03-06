# hierarchicalDataInSql
Using closure tables to model hierarchy in T-SQL

![Closure Table Node Paths](https://raw.github.com/ttichy/hierarchicalDataInSql/master/assets/tree.png "Closure Table Node Paths")


credit
https://www.slideshare.net/billkarwin/models-for-hierarchical-data


TESTING
-------

* open an SQL server database
* run createTables.sql - creates tables
* run InsertNode.sql - creates stored procedure for inserting nodes
* run DeleteNode.sql - creates stored procedure for deleting nodes
* run DeleteSubtree.sql - creates stored procedure for deleting subtrees
* run GetSubTree.sql - creates stored procedure for getting subtrees
* run TestData.sql - insert some test data
* start playing: e.g `exec dbo.GetSubTree 1`


The idea is that we store nodes using the Closure table approach to model hierarchy. In our case, the node would be a "ProjectItem".
ProjectItems are either library items, products and containers.


