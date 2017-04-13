
/****** Object:  StoredProcedure [dbo].[InsertNode]    Script Date: 4/13/2017 2:42:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.InsertNode') IS NULL -- Check if SP Exists
 EXEC('CREATE PROCEDURE dbo.InsertNode AS SET NOCOUNT ON;') -- Create dummy/empty SP
GO



-- =============================================
-- Author:		Tichy
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[InsertNode] 
	-- Add the parameters for the stored procedure here
	@ancestor int, 
	@projectItem int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into dbo.nodes_paths (ancestor_id,descendant_id, pathLength)
		select ancestor_id, @projectItem, pathLength +1 FROM dbo.nodes_paths
		where descendant_id=@ancestor
		UNION ALL SELECT @projectItem,@projectItem, 0
END

GO

