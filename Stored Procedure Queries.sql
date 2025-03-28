--Procedure to Insert a New User
CREATE PROCEDURE AddUser (
    IN p_user_id INT,
    IN p_u_name VARCHAR(100),
    IN p_email_id VARCHAR(100),
    IN p_gender VARCHAR(10),
    IN p_age INT,
    IN p_occupation VARCHAR(100),
    IN p_u_mobile VARCHAR(15),
    IN p_area_id INT
)
BEGIN
    INSERT INTO tb_User (user_id, u_name, email_id, gender, age, occupation, u_mobile, area_id)
    VALUES (p_user_id, p_u_name, p_email_id, p_gender, p_age, p_occupation, p_u_mobile, p_area_id);
END;

--Procedure to Update Complaint Status
CREATE PROCEDURE UpdateComplaintStatus (
    IN p_complaint_id INT,
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE tb_Complaint 
    SET complaint_status = p_status 
    WHERE complaint_id = p_complaint_id;
END;


--Procedure to Get Waste Collection Records by Vehicle ID
CREATE PROCEDURE GetWasteCollectionByVehicle (
    IN p_vehicle_id INT
)
BEGIN
    SELECT * FROM tb_Waste_Collection 
    WHERE vehicle_id = p_vehicle_id;
END;

--Procedure to Get Total Waste Produced by User
CREATE PROCEDURE GetTotalWasteByUser (
    IN p_user_id INT
)
BEGIN
    SELECT SUM(total_waste_produced_per_day) AS total_waste 
    FROM tb_Waste_Produced 
    WHERE user_id = p_user_id;
END;

--Procedure to Get All Complaints for a User
CREATE PROCEDURE GetComplaintsByUser (
    IN p_user_id INT
)
BEGIN
    SELECT * FROM tb_Complaint 
    WHERE user_id = p_user_id;
END;

