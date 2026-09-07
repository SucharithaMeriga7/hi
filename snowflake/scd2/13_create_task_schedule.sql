-- Create a daily task to run the master pipeline
CREATE OR REPLACE TASK IDEA_2_DB.PUBLIC.TASK_DAILY_PIPELINE
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = 'USING CRON 0 6 * * * America/New_York'
    COMMENT = 'Daily pipeline to load customer/order data, process SCD2, and aggregate spend'
AS
    CALL IDEA_2_DB.PUBLIC.SP_MASTER_PIPELINE();

-- Resume the task (tasks are created in suspended state)
ALTER TASK IDEA_2_DB.PUBLIC.TASK_DAILY_PIPELINE RESUME;