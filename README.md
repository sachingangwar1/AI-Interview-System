# AI-Interview-System
Database Schema Design
Database Design – AI Interview System (User Side)

The AI Interview System uses a PostgreSQL database to securely store candidate details, interview session records, monitoring activities, and risk analysis results. The database is designed to maintain data integrity, support real-time monitoring, and enable efficient retrieval of interview-related information.

Main Tables
1. Candidate Table

This table stores the personal and interview-related details of candidates participating in the AI interview process.

Field Name	Description
candidate_id	Unique ID assigned to each candidate
name	Full name of the candidate
email	Candidate email address
interview_domain	Domain or role selected for the interview

Purpose:
Used to identify and manage candidate information throughout the interview process.

2. Monitoring Logs Table

This table records suspicious activities and violations detected during the interview using AI monitoring techniques.

Field Name	Description
log_id	Unique ID for each monitoring record
candidate_id	References the candidate involved
timestamp	Time when the violation occurred
violation_type	Type of detected violation
severity	Level of seriousness of the violation

Purpose:
Maintains a complete monitoring history for proctoring and fraud detection.

3. Risk Score Table

This table stores the calculated risk score of each candidate based on monitoring behavior during the interview.

Field Name	Description
score_id	Unique ID for each score entry
candidate_id	References the candidate
risk_score	AI-generated cheating risk score
interview_status	Final interview result/status

Purpose:
Helps administrators evaluate interview fairness and detect malpractice.

4. Session Table

This table stores interview session timing details.

Field Name	Description
session_id	Unique ID for each interview session
candidate_id	References the candidate
start_time	Interview start time
end_time	Interview completion time

Purpose:
Tracks interview duration and manages session activity records.

Database Relationships
One candidate can have multiple monitoring logs.
One candidate can have one or more interview sessions.
One candidate has a corresponding risk score record.
candidate_id acts as a foreign key in related tables.
Security and Data Integrity

The PostgreSQL database ensures:

Secure storage of candidate and interview data
Efficient management of monitoring logs
Accurate tracking of interview sessions
Reliable risk score analysis
Data consistency using primary and foreign keys

The database structure supports scalability and real-time AI-based interview monitoring functionalities.
