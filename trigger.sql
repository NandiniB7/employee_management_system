-- Trigger to notify employees who forget to log out by 10 PM
CREATE TRIGGER trg_CheckOutReminder
ON attendance
AFTER INSERT
AS
BEGIN
    DECLARE @employee_id INT;
    DECLARE @check_in_time DATETIME;

    SELECT @employee_id = i.employee_id, @check_in_time = i.check_in
    FROM inserted i;

    IF @check_in_time IS NOT NULL AND DATEPART(HOUR, @check_in_time) = 22
    BEGIN
        INSERT INTO notifications (employee_id, message)
        VALUES (@employee_id, 'Reminder: You forgot to log out at 10 PM.');
    END
END;