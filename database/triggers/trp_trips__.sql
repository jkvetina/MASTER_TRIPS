CREATE OR REPLACE TRIGGER trp_trips__
FOR UPDATE OR INSERT OR DELETE ON trp_trips
COMPOUND TRIGGER

    c_table_name CONSTANT VARCHAR2(128) := 'TRP_TRIPS';



    BEFORE EACH ROW IS
    BEGIN
        -- populate audit columns
        IF NOT DELETING THEN
            --:NEW.updated_by := core.get_user_id();
            --:NEW.updated_at := SYSDATE;
            :NEW.created_by := COALESCE(:NEW.created_by, /*:NEW.updated_by*/ core.get_user_id());
            :NEW.created_at := COALESCE(:NEW.created_at, /*:NEW.updated_at*/ SYSDATE);
            --
            :NEW.year_ := TO_CHAR(:NEW.start_at, 'YYYY');
        END IF;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error(c_table_name || '_UPSERT_FAILED');
    END BEFORE EACH ROW;



    AFTER STATEMENT IS
    BEGIN
        NULL;
        --
    EXCEPTION
    WHEN core.app_exception THEN
        RAISE;
    WHEN OTHERS THEN
        core.raise_error(c_table_name || '_FOLLOWUP_FAILED');
    END AFTER STATEMENT;

END;
/

