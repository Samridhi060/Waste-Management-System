--Get all users from the tb_User table:
SELECT * FROM tb_User;

--Count the number of complaints in the tb_Complaint table:
SELECT COUNT(*) AS total_complaints FROM tb_Complaint;

--Find all areas with their respective coordinates from the tb_Area table:
SELECT name, longitude, latitude FROM tb_Area;

--Get the total waste produced by each user on a specific date:
SELECT user_id, total_waste_produced_per_day 
FROM tb_Waste_Produced 
WHERE w_date = '2024-10-01';

--List all unresolved complaints:
SELECT * FROM tb_Complaint 
WHERE complaint_status = 'Pending';
