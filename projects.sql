CREATE TABLE projects (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
	status NVARCHAR(100),
    assigned_to INT NULL,
    FOREIGN KEY (assigned_to) REFERENCES employees(id)
);

INSERT INTO projects (name, description, status, assigned_to)
VALUES 
-- Assigned Projects
('Employee Management System', 'Develop an employee management platform using Flask and MS SQL Server.', 'Assigned', 1),
('E-Commerce Web App', 'Create a scalable e-commerce solution for online retail.', 'Assigned', 2),
('Inventory Tracking System', 'Build a real-time inventory tracking system.', 'Assigned', 3),
('HR Automation Tool', 'Develop an HR automation tool for leave and payroll management.', 'Assigned', 10),
('AI Chatbot', 'Implement an AI-driven chatbot for customer support.', 'Assigned', 16),
('Healthcare Management System', 'Develop a system to manage patient records and appointments.', 'Assigned', 20),
('Online Learning Platform', 'Create an LMS (Learning Management System) for students.', 'Assigned', 22),

-- Available Projects (Not yet assigned)
('Cybersecurity Audit Tool', 'Develop a tool to analyze and report security vulnerabilities.', 'Available', NULL),
('Data Analytics Dashboard', 'Create an interactive dashboard for business intelligence.', 'Available', NULL),
('Automated Resume Screener', 'AI-based tool to screen job applications automatically.', 'Available', NULL),
('Smart Attendance System', 'Implement a facial recognition-based attendance tracking system.', 'Available', NULL),
('IoT-Based Smart Home System', 'Develop an IoT-based home automation solution.', 'Available', NULL),
('Blockchain-Based Voting System', 'A secure, decentralized voting system.', 'Available', NULL),
('Task Management Software', 'A task management application with real-time collaboration.', 'Available', NULL);
select* from projects;