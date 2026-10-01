CREATE TABLE pipeline_watermark (
    pipeline_name VARCHAR(100) NOT NULL,
    entity_name VARCHAR(100) NOT NULL,
    last_successful_updated_at DATETIMEOFFSET NULL,
    updated_at DATETIMEOFFSET NOT NULL DEFAULT SYSDATETIMEOFFSET(),
    CONSTRAINT PK_pipeline_watermark PRIMARY KEY (pipeline_name, entity_name)
);
GO

CREATE OR ALTER PROCEDURE dbo.usp_update_pipeline_watermark
    @pipeline_name VARCHAR(100),
    @entity_name VARCHAR(100),
    @last_successful_updated_at DATETIMEOFFSET
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.pipeline_watermark
    SET
        last_successful_updated_at = @last_successful_updated_at,
        updated_at = SYSDATETIMEOFFSET()
    WHERE pipeline_name = @pipeline_name
      AND entity_name = @entity_name;
END;
GO
