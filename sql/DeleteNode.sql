

/****** Object:  StoredProcedure [dbo].[DeleteNode]    Script Date: 4/13/2017 2:42:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.DeleteNode') IS NULL -- Check if SP Exists
 EXEC('CREATE PROCEDURE dbo.InsertNode AS SET NOCOUNT ON;') -- Create dummy/empty SP
GO


-- =============================================
-- Author:		Tichy
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[DeleteNode] 
	@nodeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- check for descendants. Descendants means that 
	-- there are nodes with the @nodeId as ancestor
	if (select count(*) from (
		select * from dbo.nodes_paths
		except
		select * from dbo.nodes_paths where descendant_id =@nodeId) as d
		where d.ancestor_id=@nodeId) >0
		
			RAISERROR('Unable to delete node that has children',16,1)
	else
		begin
			delete from dbo.nodes_paths
			where descendant_id=@nodeId
		end


    
END

GO

