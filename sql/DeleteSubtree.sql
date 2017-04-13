

/****** Object:  StoredProcedure [dbo].[DeleteSubtree]    Script Date: 4/13/2017 2:42:31 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.DeleteSubtree') IS NULL -- Check if SP Exists
 EXEC('CREATE PROCEDURE dbo.InsertNode AS SET NOCOUNT ON;') -- Create dummy/empty SP
GO


-- =============================================
-- Author:		Tichy
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[DeleteSubtree] 
	@nodeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	delete from dbo.nodes_paths
	where descendant_id IN 
		(SELECT descendant_id FROM DBO.nodes_paths WHERE ancestor_id=@nodeId)


    
END

GO

