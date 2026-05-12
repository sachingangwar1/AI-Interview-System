CREATE DATABASE ai_interview_system;
USE ai_interview_system;
DROP TABLE IF EXISTS Monitoring_Logs;
DROP TABLE IF EXISTS Candidate;
CREATE TABLE Candidate (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    interview_domain VARCHAR(100) NOT NULL
);

CREATE TABLE Monitoring_Logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    candidate_id INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    violation_type VARCHAR(100),
    severity VARCHAR(50),

    CONSTRAINT fk_candidate_logs
        FOREIGN KEY(candidate_id)
        REFERENCES Candidate(candidate_id)
        ON DELETE CASCADE
);
CREATE TABLE Risk_Score (
    score_id SERIAL PRIMARY KEY,
    candidate_id INT NOT NULL,
    risk_score DECIMAL(5,2),
    interview_status VARCHAR(50),

    CONSTRAINT fk_candidate_score
        FOREIGN KEY(candidate_id)
        REFERENCES Candidate(candidate_id)
        ON DELETE CASCADE
);
CREATE TABLE Session (
    session_id SERIAL PRIMARY KEY,
    candidate_id INT NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP,

    CONSTRAINT fk_candidate_session
        FOREIGN KEY(candidate_id)
        REFERENCES Candidate(candidate_id)
        ON DELETE CASCADE
);
INSERT INTO Candidate (name, email, interview_domain)
VALUES
('Sachin Gangwar', 'sachin@gmail.com', 'Data Science'),
('Rahul Sharma', 'rahul@gmail.com', 'Machine Learning');
INSERT INTO Monitoring_Logs (candidate_id, violation_type, severity)
VALUES
(1, 'Multiple Face Detection', 'High'),
(1, 'Looking Away Frequently', 'Medium'),
(2, 'Mobile Phone Detected', 'High');
INSERT INTO Risk_Score (candidate_id, risk_score, interview_status)
VALUES
(1, 82.50, 'Suspicious'),
(2, 25.00, 'Normal');
INSERT INTO Session (candidate_id, start_time, end_time)
VALUES
(1, '2026-05-08 10:00:00', '2026-05-08 10:30:00'),
(2, '2026-05-08 11:00:00', '2026-05-08 11:25:00');
SELECT * FROM Candidate;
SELECT * FROM Monitoring_Logs;
SELECT * FROM Risk_Score;
SELECT * FROM Session;





