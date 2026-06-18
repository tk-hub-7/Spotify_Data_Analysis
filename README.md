<img width="266" height="190" alt="images" src="https://github.com/user-attachments/assets/d5aadaea-eb7a-463d-8806-deabbedacdfd" />

🎵 Spotify Data Analysis using SQL
📌 Project Overview

This project focuses on analyzing Spotify music streaming data using SQL to extract meaningful business insights. The dataset contains information about artists, tracks, albums, streaming performance, engagement metrics, and audio features such as danceability, energy, loudness, and liveness.

The objective of this project is to demonstrate practical SQL skills including:

Data Cleaning
Exploratory Data Analysis (EDA)
Aggregations
Joins & Filtering
Common Table Expressions (CTEs)
Window Functions
Business Problem Solving
Performance Analysis

📂 Dataset Information

The dataset includes the following attributes:
Column	Description
Artist	Name of the artist
Track	Song name
Album	Album name
Album Type	Single / Album
Danceability	Dance suitability score
Energy	Intensity and activity level
Loudness	Overall loudness
Speechiness	Presence of spoken words
Acousticness	Acoustic confidence score
Instrumentalness	Instrumental probability
Liveness	Audience presence indicator
Valence	Musical positivity score
Tempo	Speed of the track
Duration	Track duration in minutes
Views	YouTube views
Likes	YouTube likes
Comments	YouTube comments
Streams	Spotify stream count
Official Video	Indicates official video availability
Licensed	Licensing status
Most Played On	Spotify or YouTube

🛠 Technologies Used:
PostgreSQL
SQL
GitHub

🔍 Project Workflow

1️⃣ Database Creation
Created Spotify table
Defined appropriate data types
Imported dataset into PostgreSQL
2️⃣ Data Cleaning
Identified missing or invalid values
Removed records with zero duration
Validated categorical columns
3️⃣ Exploratory Data Analysis (EDA)

Performed analysis such as:
Total tracks available
Distinct artists count
Album type distribution
Most played platform analysis
Maximum views, likes, comments, and streams
4️⃣ Business Problem Solving

Solved real-world analytical questions ranging from beginner to advanced SQL levels.

📊 Business Questions Solved
Basic Analysis

✔ Tracks with more than 1 Billion streams
✔ Albums and corresponding artists
✔ Total comments for licensed tracks
✔ Tracks released as Singles
✔ Number of tracks by each artist

Intermediate Analysis

✔ Average danceability by album
✔ Top 5 highest-energy tracks
✔ Official video performance analysis
✔ Album-wise total views
✔ Tracks streamed more on Spotify than YouTube

Advanced Analysis

✔ Top 3 most-viewed tracks for each artist using Window Functions
✔ Tracks with above-average liveness scores
✔ Album-wise energy variation analysis using CTEs

📈 Key SQL Concepts Demonstrated
SELECT Statements
Aggregate Functions
GROUP BY
HAVING Clause
CASE Statements
Subqueries
Common Table Expressions (CTEs)
Window Functions
DENSE_RANK()
Data Cleaning Techniques
Conditional Aggregation
Ordering & Ranking

💡 Sample Insight

Some tracks have accumulated over 1 billion Spotify streams, demonstrating massive audience reach. Analysis also reveals significant differences between Spotify and YouTube consumption patterns for many artists and tracks.

🚀 Learning Outcomes

Through this project, I strengthened my understanding of:

Real-world SQL problem-solving
Data exploration techniques
Business-oriented analytics
Query optimization
Window functions and CTEs
Transforming raw data into actionable insights
📁 Repository Structure
Spotify-SQL-Analysis/
│
├── spotify.sql
├── README.md
└── Dataset (if included)
👨‍💻 Author

Karthik Thakkalapelly

Aspiring Data Analyst | SQL | Power BI | Excel | Python | Data Visualization

📌 Passionate about transforming raw data into actionable business insights.
