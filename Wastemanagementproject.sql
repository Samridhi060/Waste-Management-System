CREATE DATABASE db_waste_management

USE db_waste_management


-- Table for User
CREATE TABLE tb_User (
    user_id INT PRIMARY KEY,
    u_name VARCHAR(100),
    email_id VARCHAR(100),
    gender VARCHAR(10),
    age INT,
    occupation VARCHAR(100),
    u_mobile VARCHAR(15),
    area_id INT,
    FOREIGN KEY (area_id) REFERENCES tb_Area(area_id)
);

-- Table for Area
CREATE TABLE tb_Area (
    area_id INT PRIMARY KEY,
    name VARCHAR(100),
    longitude DECIMAL(9,6),
    latitude DECIMAL(9,6)
);

-- Table for Address
CREATE TABLE tb_Address (
    user_id INT,
    door_no VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES tb_User(user_id)
);

-- Table for Complaint
CREATE TABLE tb_Complaint (
    complaint_id INT PRIMARY KEY,
    user_id INT,
    complaint_date DATE,
    complaint_time TIME,
    complaint_resolved_date DATE,
    complaint_resolved_time TIME,
    message TEXT,
    image VARCHAR(MAX),
    complaint_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES tb_User(user_id)
);

-- Table for Waste_Produced
CREATE TABLE tb_Waste_Produced (
    user_id INT,
    w_date DATE,
    total_waste_produced_per_day FLOAT,
    non_bio_weight FLOAT,
    bio_weight FLOAT,
    PRIMARY KEY (user_id, w_date),
    FOREIGN KEY (user_id) REFERENCES tb_User(user_id)
);

-- Table for Vehicle
CREATE TABLE tb_Vehicle (
    vehicle_id INT PRIMARY KEY,
    area_id INT,
    driver_name VARCHAR(100),
    driver_phone VARCHAR(15),
    FOREIGN KEY (area_id) REFERENCES tb_Area(area_id)
);

-- Table for Waste_Collection
CREATE TABLE tb_Waste_Collection (
    vehicle_id INT,
    area_id INT,
    c_date DATE,
    c_time TIME,
    PRIMARY KEY (vehicle_id, area_id, c_date, c_time),
    FOREIGN KEY (vehicle_id) REFERENCES tb_Vehicle(vehicle_id),
    FOREIGN KEY (area_id) REFERENCES tb_Area(area_id)
);


-- Inserting tables

--User table
INSERT INTO tb_User (user_id, u_name, email_id, gender, age, occupation, u_mobile, area_id) VALUES
(5001, 'John Doe', 'john.doe@example.com', 'Male', 30, 'Engineer', '1234567890', 10012),
(5002, 'Jane Smith', 'jane.smith@example.com', 'Female', 28, 'Doctor', '1234567891', 10025),
(5003, 'Alice Johnson', 'alice.johnson@example.com', 'Female', 35, 'Teacher', '1234567892', 10003),
(5004, 'Bob Brown', 'bob.brown@example.com', 'Male', 40, 'Artist', '1234567893', 10018),
(5005, 'Charlie Davis', 'charlie.davis@example.com', 'Male', 22, 'Student', '1234567894', 10007),
(5006, 'Diana Evans', 'diana.evans@example.com', 'Female', 27, 'Nurse', '1234567895', 10015),
(5007, 'Ethan Foster', 'ethan.foster@example.com', 'Male', 31, 'Chef', '1234567896', 10020),
(5008, 'Fiona Green', 'fiona.green@example.com', 'Female', 29, 'Designer', '1234567897', 10011),
(5009, 'George Harris', 'george.harris@example.com', 'Male', 38, 'Manager', '1234567898', 10009),
(5010, 'Hannah Ivers', 'hannah.ivers@example.com', 'Female', 24, 'Scientist', '1234567899', 10016),
(5011, 'Ian Johnson', 'ian.johnson@example.com', 'Male', 33, 'Developer', '1234567800', 10014),
(5012, 'Jack King', 'jack.king@example.com', 'Male', 45, 'Mechanic', '1234567801', 10005),
(5013, 'Kylie Lee', 'kylie.lee@example.com', 'Female', 26, 'Marketing', '1234567802', 10001),
(5014, 'Liam Moore', 'liam.moore@example.com', 'Male', 30, 'Photographer', '1234567803', 10022),
(5015, 'Mia Nelson', 'mia.nelson@example.com', 'Female', 34, 'Accountant', '1234567804', 10004),
(5016, 'Noah Owen', 'noah.owen@example.com', 'Male', 29, 'Consultant', '1234567805', 10019),
(5017, 'Olivia Parker', 'olivia.parker@example.com', 'Female', 31, 'Lawyer', '1234567806', 10006),
(5018, 'Paul Quinn', 'paul.quinn@example.com', 'Male', 36, 'Firefighter', '1234567807', 10023),
(5019, 'Quinn Reed', 'quinn.reed@example.com', 'Female', 32, 'Sales', '1234567808', 10010),
(5020, 'Ryan Smith', 'ryan.smith@example.com', 'Male', 27, 'Pilot', '1234567809', 10021),
(5021, 'Sophia Taylor', 'sophia.taylor@example.com', 'Female', 25, 'Writer', '1234567810', 10017),
(5022, 'Thomas Underwood', 'thomas.underwood@example.com', 'Male', 30, 'Electrician', '1234567811', 10013),
(5023, 'Uma Vance', 'uma.vance@example.com', 'Female', 29, 'Researcher', '1234567812', 10008),
(5024, 'Victor White', 'victor.white@example.com', 'Male', 34, 'Web Developer', '1234567813', 10024),
(5025, 'Wendy Xu', 'wendy.xu@example.com', 'Female', 31, 'Analyst', '1234567814', 10002),
(5026, 'Xavier Young', 'xavier.young@example.com', 'Male', 28, 'Pilot', '1234567815', 10026),
(5027, 'Yara Zhang', 'yara.zhang@example.com', 'Female', 23, 'Data Scientist', '1234567816', 10027),
(5028, 'Zachary Adams', 'zachary.adams@example.com', 'Male', 36, 'Architect', '1234567817', 10028),
(5029, 'Ashley Brooks', 'ashley.brooks@example.com', 'Female', 27, 'Veterinarian', '1234567818', 10029),
(5030, 'Brian Carter', 'brian.carter@example.com', 'Male', 32, 'Pharmacist', '1234567819', 10030),
(5031, 'Catherine Diaz', 'catherine.diaz@example.com', 'Female', 29, 'HR Manager', '1234567820', 10031),
(5032, 'Daniel Edwards', 'daniel.edwards@example.com', 'Male', 41, 'Software Engineer', '1234567821', 10032),
(5033, 'Ella Fisher', 'ella.fisher@example.com', 'Female', 35, 'Social Worker', '1234567822', 10033),
(5034, 'Franklin Grant', 'franklin.grant@example.com', 'Male', 38, 'Logistics', '1234567823', 10034),
(5035, 'Gina Hill', 'gina.hill@example.com', 'Female', 26, 'Graphic Designer', '1234567824', 10035),
(5036, 'Henry Ingram', 'henry.ingram@example.com', 'Male', 30, 'Business Analyst', '1234567825', 10036),
(5037, 'Isabella James', 'isabella.james@example.com', 'Female', 34, 'Event Planner', '1234567826', 10037),
(5038, 'James Kelly', 'james.kelly@example.com', 'Male', 29, 'Content Writer', '1234567827', 10038),
(5039, 'Karen Lewis', 'karen.lewis@example.com', 'Female', 31, 'Interior Designer', '1234567828', 10039),
(5040, 'Leo Martinez', 'leo.martinez@example.com', 'Male', 27, 'Project Manager', '1234567829', 10040),
(5041, 'Megan Nelson', 'megan.nelson@example.com', 'Female', 30, 'Teacher', '1234567830', 10041),
(5042, 'Nancy Ortiz', 'nancy.ortiz@example.com', 'Female', 28, 'Nurse', '1234567831', 10042),
(5043, 'Oscar Perez', 'oscar.perez@example.com', 'Male', 35, 'Mechanic', '1234567832', 10043),
(5044, 'Paula Ramirez', 'paula.ramirez@example.com', 'Female', 29, 'Consultant', '1234567833', 10044),
(5045, 'Quincy Scott', 'quincy.scott@example.com', 'Male', 32, 'Chef', '1234567834', 10045),
(5046, 'Rachel Taylor', 'rachel.taylor@example.com', 'Female', 31, 'Scientist', '1234567835', 10046),
(5047, 'Steve Underwood', 'steve.underwood@example.com', 'Male', 36, 'Developer', '1234567836', 10047),
(5048, 'Tina Vincent', 'tina.vincent@example.com', 'Female', 27, 'Designer', '1234567837', 10048),
(5049, 'Ulysses Walker', 'ulysses.walker@example.com', 'Male', 30, 'Photographer', '1234567838', 10049),
(5050, 'Victoria Young', 'victoria.young@example.com', 'Female', 28, 'Accountant', '1234567839', 10050);



--Area table
INSERT INTO tb_Area (area_id, name, longitude, latitude) VALUES
(10012, 'Model Town', 75.5795, 31.3254),
(10025, 'Civil Lines', 75.5701, 31.3259),
(10003, 'Bharat Nagar', 75.5683, 31.2939),
(10018, 'Mangal Bazar', 75.5732, 31.3218),
(10007, 'Ram Nagar', 75.5783, 31.3170),
(10015, 'Kapurthala Chowk', 75.5704, 31.3251),
(10020, 'Jalandhar Cantt', 75.5750, 31.3050),
(10011, 'Lajpat Nagar', 75.5709, 31.3190),
(10009, 'Guru Teg Bahadur Nagar', 75.5690, 31.3250),
(10016, 'Basti Danishmandan', 75.5820, 31.3255),
(10014, 'Nehru Garden', 75.5770, 31.3200),
(10005, 'Khatkar Kalan', 75.5755, 31.3055),
(10001, 'Sadar Bazar', 75.5700, 31.3220),
(10022, 'Shastri Nagar', 75.5720, 31.3265),
(10004, 'Basti Sheikh', 75.5695, 31.3000),
(10019, 'Ajit Nagar', 75.5680, 31.2900),
(10006, 'Jasbir Colony', 75.5740, 31.3195),
(10023, 'Madhopur', 75.5780, 31.3300),
(10010, 'Chowk Shere Punjab', 75.5800, 31.3250),
(10021, 'Pavilion Mall', 75.5703, 31.3100),
(10017, 'Ranjit Avenue', 75.5715, 31.3240),
(10013, 'Dugri', 75.5725, 31.3180),
(10008, 'Sikh Village', 75.5698, 31.3150),
(10024, 'Karam Singh Nagar', 75.5758, 31.3280),
(10002, 'Chuhar Majra', 75.5735, 31.3120),
(10026, 'Sainik Colony', 75.5790, 31.3225),
(10027, 'Basant City', 75.5788, 31.3305),
(10028, 'Shiv Mandir', 75.5775, 31.3290),
(10029, 'Nehru Park', 75.5748, 31.3215),
(10030, 'Fattuwal', 75.5706, 31.3155),
(10031, 'Ravi Dass Nagar', 75.5721, 31.3060),
(10032, 'Krishna Nagar', 75.5730, 31.3105),
(10033, 'Vikas Nagar', 75.5745, 31.3258),
(10034, 'New Model Town', 75.5805, 31.3270),
(10035, 'Pind Malko', 75.5752, 31.3285),
(10036, 'Kohar', 75.5785, 31.3295),
(10037, 'Sukhchain Nagar', 75.5778, 31.3308),
(10038, 'Sikandarpur', 75.5792, 31.3310),
(10039, 'Basti Bawa Khel', 75.5707, 31.3320),
(10040, 'Maharani Bagh', 75.5733, 31.3260),
(10041, 'Pahuwind', 75.5742, 31.3292),
(10042, 'Khurla Kingra', 75.5760, 31.3259),
(10043, 'Chak Himmat', 75.5787, 31.3245),
(10044, 'Dhanowali', 75.5708, 31.3230),
(10045, 'Gurdev Nagar', 75.5756, 31.3212),
(10046, 'Sukhna', 75.5791, 31.3195),
(10047, 'Basti Malook', 75.5786, 31.3185),
(10048, 'Jakhal', 75.5705, 31.3150),
(10049, 'Chuhar Majra', 75.5737, 31.3125),
(10050, 'Sultanpur', 75.5743, 31.3300);


--Address Table
INSERT INTO tb_Address (user_id, door_no, street, city, state) VALUES
(5001, '101', 'Main St', 'Jalandhar', 'Punjab'),
(5002, '102', 'Second St', 'Jalandhar', 'Punjab'),
(5003, '103', 'Third Ave', 'Jalandhar', 'Punjab'),
(5004, '104', 'Fourth Blvd', 'Jalandhar', 'Punjab'),
(5005, '105', 'Fifth St', 'Jalandhar', 'Punjab'),
(5006, '106', 'Sixth Ave', 'Jalandhar', 'Punjab'),
(5007, '107', 'Seventh St', 'Jalandhar', 'Punjab'),
(5008, '108', 'Eighth Blvd', 'Jalandhar', 'Punjab'),
(5009, '109', 'Ninth St', 'Jalandhar', 'Punjab'),
(5010, '110', 'Tenth Ave', 'Jalandhar', 'Punjab'),
(5011, '111', 'Eleventh St', 'Jalandhar', 'Punjab'),
(5012, '112', 'Twelfth Blvd', 'Jalandhar', 'Punjab'),
(5013, '113', 'Thirteenth St', 'Jalandhar', 'Punjab'),
(5014, '114', 'Fourteenth Ave', 'Jalandhar', 'Punjab'),
(5015, '115', 'Fifteenth St', 'Jalandhar', 'Punjab'),
(5016, '116', 'Sixteenth Blvd', 'Jalandhar', 'Punjab'),
(5017, '117', 'Seventeenth St', 'Jalandhar', 'Punjab'),
(5018, '118', 'Eighteenth Ave', 'Jalandhar', 'Punjab'),
(5019, '119', 'Nineteenth St', 'Jalandhar', 'Punjab'),
(5020, '120', 'Twentieth Blvd', 'Jalandhar', 'Punjab'),
(5021, '121', 'Twenty-First St', 'Jalandhar', 'Punjab'),
(5022, '122', 'Twenty-Second Ave', 'Jalandhar', 'Punjab'),
(5023, '123', 'Twenty-Third St', 'Jalandhar', 'Punjab'),
(5024, '124', 'Twenty-Fourth Blvd', 'Jalandhar', 'Punjab'),
(5025, '125', 'Twenty-Fifth St', 'Jalandhar', 'Punjab'),
(5026, '126', 'Twenty-Sixth Ave', 'Jalandhar', 'Punjab'),
(5027, '127', 'Twenty-Seventh St', 'Jalandhar', 'Punjab'),
(5028, '128', 'Twenty-Eighth Blvd', 'Jalandhar', 'Punjab'),
(5029, '129', 'Twenty-Ninth St', 'Jalandhar', 'Punjab'),
(5030, '130', 'Thirtieth Ave', 'Jalandhar', 'Punjab'),
(5031, '131', 'Thirty-First St', 'Jalandhar', 'Punjab'),
(5032, '132', 'Thirty-Second Blvd', 'Jalandhar', 'Punjab'),
(5033, '133', 'Thirty-Third St', 'Jalandhar', 'Punjab'),
(5034, '134', 'Thirty-Fourth Ave', 'Jalandhar', 'Punjab'),
(5035, '135', 'Thirty-Fifth St', 'Jalandhar', 'Punjab'),
(5036, '136', 'Thirty-Sixth Blvd', 'Jalandhar', 'Punjab'),
(5037, '137', 'Thirty-Seventh St', 'Jalandhar', 'Punjab'),
(5038, '138', 'Thirty-Eighth Ave', 'Jalandhar', 'Punjab'),
(5039, '139', 'Thirty-Ninth St', 'Jalandhar', 'Punjab'),
(5040, '140', 'Fortieth Blvd', 'Jalandhar', 'Punjab'),
(5041, '141', 'Forty-First St', 'Jalandhar', 'Punjab'),
(5042, '142', 'Forty-Second Ave', 'Jalandhar', 'Punjab'),
(5043, '143', 'Forty-Third St', 'Jalandhar', 'Punjab'),
(5044, '144', 'Forty-Fourth Blvd', 'Jalandhar', 'Punjab'),
(5045, '145', 'Forty-Fifth St', 'Jalandhar', 'Punjab'),
(5046, '146', 'Forty-Sixth Ave', 'Jalandhar', 'Punjab'),
(5047, '147', 'Forty-Seventh St', 'Jalandhar', 'Punjab'),
(5048, '148', 'Forty-Eighth Blvd', 'Jalandhar', 'Punjab'),
(5049, '149', 'Forty-Ninth St', 'Jalandhar', 'Punjab'),
(5050, '150', 'Fiftieth Ave', 'Jalandhar', 'Punjab');


--Complaint Table
INSERT INTO tb_Complaint (complaint_id, user_id, complaint_date, complaint_time, complaint_resolved_date, complaint_resolved_time, message, image, complaint_status) VALUES
(1001, 5001, '2024-10-01', '10:00:00', NULL, NULL, 'Request for better waste collection in the area.', 'https://example.com/image1.jpg', 'Pending'),
(1003, 5003, '2024-10-03', '12:00:00', NULL, NULL, 'Issues with overflowing bins in the park.', 'https://example.com/image3.jpg', 'Pending'),
(1005, 5005, '2024-10-05', '09:45:00', NULL, NULL, 'Complaint about illegal dumping of waste.', 'https://example.com/image5.jpg', 'Pending'),
(1008, 5008, '2024-10-08', '13:00:00', NULL, NULL, 'Issues with street cleaning frequency.', 'https://example.com/image8.jpg', 'Pending'),
(1010, 5010, '2024-10-10', '16:00:00', '2024-10-20', '14:00:00', 'Garbage collection truck not arriving on schedule.', 'https://example.com/image10.jpg', 'Resolved'),
(1011, 5011, '2024-10-11', '17:30:00', NULL, NULL, 'Request for more public awareness on waste management.', 'https://example.com/image11.jpg', 'Pending'),
(1014, 5014, '2024-10-14', '20:00:00', NULL, NULL, 'Issues with hazardous waste disposal.', 'https://example.com/image14.jpg', 'Pending'),
(1016, 5016, '2024-10-16', '22:00:00', NULL, NULL, 'Complaint about overflowing waste bins.', 'https://example.com/image16.jpg', 'Pending'),
(1019, 5019, '2024-10-19', '10:45:00', NULL, NULL, 'Issues with waste burning in open areas.', 'https://example.com/image19.jpg', 'Pending'),
(1021, 5021, '2024-10-21', '12:30:00', NULL, NULL, 'Complaint about littering in parks.', 'https://example.com/image21.jpg', 'Pending'),
(1023, 5023, '2024-10-23', '14:00:00', '2024-10-29', '12:00:00', 'Issues with the local waste management service.', 'https://example.com/image23.jpg', 'Resolved'),
(1025, 5025, '2024-10-25', '16:15:00', '2024-10-30', '10:30:00', 'Request for a waste management app.', 'https://example.com/image25.jpg', 'Resolved'),
(1029, 5029, '2024-10-29', '20:30:00', NULL, NULL, 'Issues with the waste collection schedule.', 'https://example.com/image29.jpg', 'Pending'),
(1031, 5031, '2024-11-01', '09:00:00', NULL, NULL, 'Need for more waste disposal education.', 'https://example.com/image31.jpg', 'Pending'),
(1033, 5033, '2024-11-03', '11:30:00', NULL, NULL, 'Request for better waste management practices.', 'https://example.com/image33.jpg', 'Pending'),
(1034, 5034, '2024-11-04', '12:45:00', '2024-11-10', '14:00:00', 'Issues with the waste collection frequency.', 'https://example.com/image34.jpg', 'Resolved'),
(1037, 5037, '2024-11-07', '15:30:00', '2024-11-15', '10:00:00', 'Complaint about waste collection delays.', 'https://example.com/image37.jpg', 'Resolved'),
(1038, 5038, '2024-11-08', '16:15:00', NULL, NULL, 'Request for better waste disposal methods.', 'https://example.com/image38.jpg', 'Pending'),
(1040, 5040, '2024-11-10', '18:30:00', '2024-11-20', '12:00:00', 'Request for a waste management policy review.', 'https://example.com/image40.jpg', 'Resolved'),
(1042, 5042, '2024-11-12', '20:30:00', '2024-11-18', '15:00:00', 'Request for more community clean-up events.', 'https://example.com/image42.jpg', 'Resolved'),
(1044, 5044, '2024-11-14', '22:00:00', NULL, NULL, 'Request for a waste reduction initiative.', 'https://example.com/image44.jpg', 'Pending'),
(1045, 5045, '2024-11-15', '09:15:00', '2024-11-25', '10:30:00', 'Complaint about construction waste in the area.', 'https://example.com/image45.jpg', 'Resolved'),
(1047, 5047, '2024-11-17', '11:15:00', '2024-11-30', '12:00:00', 'Request for a waste audit in the community.', 'https://example.com/image47.jpg', 'Resolved'),
(1049, 5049, '2024-11-19', '13:30:00', NULL, NULL, 'Request for waste management training for community leaders.', 'https://example.com/image49.jpg', 'Pending'),
(1050, 5050, '2024-11-20', '14:00:00', '2024-11-28', '11:00:00', 'Complaint about waste collection during festivals.', 'https://example.com/image50.jpg', 'Resolved');


--Waste_Produced
INSERT INTO tb_Waste_Produced (user_id, w_date, total_waste_produced_per_day, non_bio_weight, bio_weight) VALUES
(5001, '2024-10-01', 5.0, 2.0, 3.0),
(5002, '2024-10-02', 6.5, 3.5, 3.0),
(5003, '2024-10-03', 4.2, 1.2, 3.0),
(5004, '2024-10-04', 7.3, 4.0, 3.3),
(5005, '2024-10-05', 8.1, 4.5, 3.6),
(5006, '2024-10-06', 3.8, 1.8, 2.0),
(5007, '2024-10-07', 5.5, 2.5, 3.0),
(5008, '2024-10-08', 6.0, 3.0, 3.0),
(5009, '2024-10-09', 4.0, 2.0, 2.0),
(5010, '2024-10-10', 7.0, 3.5, 3.5),
(5011, '2024-10-11', 5.2, 2.2, 3.0),
(5012, '2024-10-12', 6.8, 4.0, 2.8),
(5013, '2024-10-13', 4.5, 2.5, 2.0),
(5014, '2024-10-14', 7.5, 3.5, 4.0),
(5015, '2024-10-15', 5.9, 3.0, 2.9),
(5016, '2024-10-16', 6.2, 3.2, 3.0),
(5017, '2024-10-17', 4.8, 2.3, 2.5),
(5018, '2024-10-18', 7.1, 3.6, 3.5),
(5019, '2024-10-19', 5.4, 2.4, 3.0),
(5020, '2024-10-20', 6.7, 3.7, 3.0),
(5021, '2024-10-21', 4.3, 1.8, 2.5),
(5022, '2024-10-22', 8.0, 4.0, 4.0),
(5023, '2024-10-23', 5.1, 2.1, 3.0),
(5024, '2024-10-24', 7.9, 4.5, 3.4),
(5025, '2024-10-25', 3.9, 1.9, 2.0),
(5026, '2024-10-26', 6.3, 3.3, 3.0),
(5027, '2024-10-27', 4.7, 2.7, 2.0),
(5028, '2024-10-28', 5.8, 3.8, 2.0),
(5029, '2024-10-29', 6.6, 3.6, 3.0),
(5030, '2024-10-30', 4.4, 2.4, 2.0),
(5031, '2024-10-31', 7.2, 3.7, 3.5),
(5032, '2024-11-01', 5.7, 2.7, 3.0),
(5033, '2024-11-02', 6.1, 3.1, 3.0),
(5034, '2024-11-03', 4.6, 2.6, 2.0),
(5035, '2024-11-04', 7.4, 3.4, 4.0),
(5036, '2024-11-05', 5.3, 2.3, 3.0),
(5037, '2024-11-06', 6.9, 3.9, 3.0),
(5038, '2024-11-07', 4.9, 2.4, 2.5),
(5039, '2024-11-08', 8.2, 4.2, 4.0),
(5040, '2024-11-09', 5.6, 2.6, 3.0),
(5041, '2024-11-10', 6.4, 3.4, 3.0),
(5042, '2024-11-11', 4.1, 1.5, 2.6),
(5043, '2024-11-12', 7.6, 3.6, 4.0),
(5044, '2024-11-13', 5.0, 2.0, 3.0),
(5045, '2024-11-14', 6.5, 3.5, 3.0),
(5046, '2024-11-15', 4.2, 1.8, 2.4),
(5047, '2024-11-16', 7.8, 4.0, 3.8),
(5048, '2024-11-17', 5.5, 2.5, 3.0),
(5049, '2024-11-18', 6.0, 3.0, 3.0),
(5050, '2024-11-19', 4.3, 2.3, 2.0);

--Vehicle
INSERT INTO tb_Vehicle (vehicle_id, area_id, driver_name, driver_phone) VALUES
(201, 10001, 'John Doe', '123-456-7890'),
(202, 10002, 'Jane Smith', '234-567-8901'),
(203, 10003, 'Alice Johnson', '345-678-9012'),
(204, 10004, 'Bob Brown', '456-789-0123'),
(205, 10005, 'Charlie Davis', '567-890-1234'),
(206, 10006, 'Diana Wilson', '678-901-2345'),
(207, 10007, 'Evan Thomas', '789-012-3456'),
(208, 10008, 'Fiona Garcia', '890-123-4567'),
(209, 10009, 'George Martinez', '901-234-5678'),
(210, 10010, 'Hannah Lee', '012-345-6789'),
(211, 10011, 'Ian Walker', '123-456-7891'),
(212, 10012, 'Julia Hall', '234-567-8902'),
(213, 10013, 'Kevin Allen', '345-678-9013'),
(214, 10014, 'Laura Young', '456-789-0124'),
(215, 10015, 'Mike King', '567-890-1235'),
(216, 10016, 'Nina Wright', '678-901-2346'),
(217, 10017, 'Oscar Scott', '789-012-3457'),
(218, 10018, 'Paula Green', '890-123-4568'),
(219, 10019, 'Quinn Adams', '901-234-5679'),
(220, 10020, 'Rachel Baker', '012-345-6780'),
(221, 10021, 'Steve Hill', '123-456-7892'),
(222, 10022, 'Tina Nelson', '234-567-8903'),
(223, 10023, 'Ursula Carter', '345-678-9014'),
(224, 10024, 'Victor Mitchell', '456-789-0125'),
(225, 10025, 'Wendy Perez', '567-890-1236'),
(226, 10026, 'Xander Roberts', '678-901-2347'),
(227, 10027, 'Yvonne Turner', '789-012-3458'),
(228, 10028, 'Zachary Phillips', '890-123-4569'),
(229, 10029, 'Amy Campbell', '901-234-5780'),
(230, 10030, 'Brian Parker', '012-345-6781'),
(231, 10031, 'Cathy Evans', '123-456-7893'),
(232, 10032, 'Daniel Edwards', '234-567-8904'),
(233, 10033, 'Ella Collins', '345-678-9015'),
(234, 10034, 'Frank Stewart', '456-789-0126'),
(235, 10035, 'Grace Sanchez', '567-890-1237'),
(236, 10036, 'Henry Morris', '678-901-2348'),
(237, 10037, 'Isabella Rogers', '789-012-3459'),
(238, 10038, 'Jack Reed', '890-123-4570'),
(239, 10039, 'Kathy Cook', '901-234-5781'),
(240, 10040, 'Leo Morgan', '012-345-6782'),
(241, 10041, 'Mia Bell', '123-456-7894'),
(242, 10042, 'Noah Murphy', '234-567-8905'),
(243, 10043, 'Olivia Rivera', '345-678-9016'),
(244, 10044, 'Paul Cooper', '456-789-0127'),
(245, 10045, 'Quincy Reed', '567-890-1238'),
(246, 10046, 'Rita Bailey', '678-901-2349'),
(247, 10047, 'Sam Gonzalez', '789-012-3460'),
(248, 10048, 'Tina Kelly', '890-123-4571'),
(249, 10049, 'Uma Bennett', '901-234-5782'),
(250, 10050, 'Vince Wood', '012-345-6783'),
(251, 10001, 'Alice Johnson', '123-456-7895'),
(252, 10002, 'Bradley Smith', '234-567-8906'),
(253, 10003, 'Cynthia Taylor', '345-678-9017'),
(254, 10004, 'David Anderson', '456-789-0128'),
(255, 10005, 'Eva Thompson', '567-890-1239'),
(256, 10006, 'Felix White', '678-901-2350'),
(257, 10007, 'Gina Harris', '789-012-3461'),
(258, 10008, 'Henry Clark', '890-123-4572'),
(259, 10009, 'Ivy Lewis', '901-234-5783'),
(260, 10010, 'Jackie Robinson', '012-345-6784'),
(261, 10011, 'Kurt Lee', '123-456-7896'),
(262, 10012, 'Lila Walker', '234-567-8907'),
(263, 10013, 'Mark Hall', '345-678-9018'),
(264, 10014, 'Nina Allen', '456-789-0129'),
(265, 10015, 'Oscar Young', '567-890-1240'),
(266, 10016, 'Pamela King', '678-901-2351'),
(267, 10017, 'Quinn Wright', '789-012-3462'),
(268, 10018, 'Rita Scott', '890-123-4573'),
(269, 10019, 'Steve Green', '901-234-5784'),
(270, 10020, 'Tina Adams', '012-345-6785');


--Waste_Collection
INSERT INTO tb_Waste_Collection (vehicle_id, area_id, c_date, c_time) VALUES
(201, 10001, '2024-10-01', '08:00:00'),
(202, 10002, '2024-10-01', '09:00:00'),
(203, 10003, '2024-10-01', '10:00:00'),
(204, 10004, '2024-10-01', '11:00:00'),
(205, 10005, '2024-10-01', '12:00:00'),
(206, 10006, '2024-10-01', '13:00:00'),
(207, 10007, '2024-10-01', '14:00:00'),
(208, 10008, '2024-10-02', '08:30:00'),
(209, 10009, '2024-10-02', '09:30:00'),
(210, 10010, '2024-10-02', '10:30:00'),
(211, 10011, '2024-10-02', '11:30:00'),
(212, 10012, '2024-10-02', '12:30:00'),
(213, 10013, '2024-10-03', '08:00:00'),
(214, 10014, '2024-10-03', '09:00:00'),
(215, 10015, '2024-10-03', '10:00:00'),
(216, 10016, '2024-10-03', '11:00:00'),
(217, 10017, '2024-10-03', '12:00:00'),
(218, 10018, '2024-10-03', '13:00:00'),
(219, 10019, '2024-10-03', '14:00:00'),
(220, 10020, '2024-10-04', '08:30:00'),
(221, 10021, '2024-10-04', '09:30:00'),
(222, 10022, '2024-10-04', '10:30:00'),
(223, 10023, '2024-10-04', '11:30:00'),
(224, 10024, '2024-10-04', '12:30:00'),
(225, 10025, '2024-10-05', '08:00:00'),
(226, 10026, '2024-10-05', '09:00:00'),
(227, 10027, '2024-10-05', '10:00:00'),
(228, 10028, '2024-10-05', '11:00:00'),
(229, 10029, '2024-10-05', '12:00:00'),
(230, 10030, '2024-10-05', '13:00:00'),
(231, 10031, '2024-10-06', '08:30:00'),
(232, 10032, '2024-10-06', '09:30:00'),
(233, 10033, '2024-10-06', '10:30:00'),
(234, 10034, '2024-10-06', '11:30:00'),
(235, 10035, '2024-10-06', '12:30:00'),
(236, 10036, '2024-10-07', '08:00:00'),
(237, 10037, '2024-10-07', '09:00:00'),
(238, 10038, '2024-10-07', '10:00:00'),
(239, 10039, '2024-10-07', '11:00:00'),
(240, 10040, '2024-10-07', '12:00:00'),
(241, 10041, '2024-10-08', '08:30:00'),
(242, 10042, '2024-10-08', '09:30:00'),
(243, 10043, '2024-10-08', '10:30:00'),
(244, 10044, '2024-10-08', '11:30:00'),
(245, 10045, '2024-10-08', '12:30:00'),
(246, 10046, '2024-10-09', '08:00:00'),
(247, 10047, '2024-10-09', '09:00:00'),
(248, 10048, '2024-10-09', '10:00:00'),
(249, 10049, '2024-10-09', '11:00:00'),
(250, 10050, '2024-10-09', '12:00:00'),
(251, 10001, '2024-10-10', '08:30:00'),
(252, 10002, '2024-10-10', '09:30:00'),
(253, 10003, '2024-10-10', '10:30:00'),
(254, 10004, '2024-10-10', '11:30:00'),
(255, 10005, '2024-10-10', '12:30:00'),
(256, 10006, '2024-10-11', '08:00:00'),
(257, 10007, '2024-10-11', '09:00:00'),
(258, 10008, '2024-10-11', '10:00:00'),
(259, 10009, '2024-10-11', '11:00:00'),
(260, 10010, '2024-10-11', '12:00:00'),
(261, 10011, '2024-10-12', '08:30:00'),
(262, 10012, '2024-10-12', '09:30:00'),
(263, 10013, '2024-10-12', '10:30:00'),
(264, 10014, '2024-10-12', '11:30:00'),
(265, 10015, '2024-10-12', '12:30:00'),
(266, 10016, '2024-10-13', '08:00:00'),
(267, 10017, '2024-10-13', '09:00:00'),
(268, 10018, '2024-10-13', '10:00:00'),
(269, 10019, '2024-10-13', '11:00:00'),
(270, 10020, '2024-10-13', '12:00:00');



