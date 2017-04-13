
/****** Object:  StoredProcedure [dbo].[InsertNode]    Script Date: 4/13/2017 2:42:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.InsertNode') IS NULL -- Check if SP Exists
 EXEC('CREATE PROCEDURE dbo.GetSubtree AS SET NOCOUNT ON;') -- Create dummy/empty SP
GO



-- =============================================
-- Author:		Tichy
-- Create date: 
-- Description:	
-- =============================================
ALTER PROCEDURE [dbo].[GetSubtree] 
	-- Add the parameters for the stored procedure here
		@nodeId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


SELECT Distinct 
        d.id,
        CONCAT(
            REPLICATE('-', p.[pathLength]),
            'node'
        ) AS tree,
        p.[pathLength]
    FROM
        [nodes] AS d
        JOIN [nodes_paths] AS p
            ON d.[id] = p.[descendant_id]
        JOIN [nodes_paths] AS crumbs
            ON crumbs.[descendant_id] = p.[descendant_id]
		--left join dbo.Axes as axes
		--	on axes.ForeignId=d.id
    WHERE p.[ancestor_id] = @nodeId
    --GROUP BY d.[id]
END

GO

