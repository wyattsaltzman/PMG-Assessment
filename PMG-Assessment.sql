CREATE DATABASE PMG;
create table marketing_data (
 date datetime,
 campaign_id varchar(50),
 geo varchar(50),
 cost float,
 impressions float,
 clicks float,
 conversions float
);
create table website_revenue (
 date datetime,
 campaign_id varchar(50),
 state varchar(2),
 revenue float
);
create table campaign_info (
 id int not null primary key auto_increment,
 name varchar(50),
 status varchar(50),
 last_updated_date datetime,
 revenue float
);
# 1. Write a query to get the sum of impressions by day.
SELECT DATE(date) AS Day, SUM(impressions) as total_impressions FROM marketing_data GROUP BY Day ORDER BY Day;

#2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT state, SUM(revenue) as total_revenue FROM website_revenue GROUP BY state ORDER BY total_revenue DESC LIMIT 3;
# The third best state generated 6607 in revenue

#3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
SELECT name as campaign_name,
       FORMAT(SUM(md.cost), 2) AS total_cost,
       SUM(md.impressions) AS total_impressions,
       SUM(md.clicks) AS total_clicks,
       SUM(wr.revenue) AS total_revenue
FROM campaign_info ci
    LEFT JOIN marketing_data md ON ci.id = md.campaign_id
    LEFT JOIN website_revenue wr ON ci.id = wr.campaign_id
GROUP BY ci.name, ci.id
ORDER BY campaign_name;

#4 Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
SELECT state, SUM(md.conversions) as total_conversations
FROM marketing_data md
    LEFT JOIN website_revenue wr ON md.campaign_id = wr.campaign_id
    LEFT JOIN campaign_info ci ON md.campaign_id = ci.id
WHERE ci.name = 'Campaign5'
GROUP BY wr.state
ORDER BY total_conversations DESC;
# GA generated the most conversations

# Question 5
SELECT name as campaign_name,
       FORMAT(SUM(md.cost), 2) AS total_cost,
       SUM(md.impressions) AS total_impressions,
       SUM(md.clicks) AS total_clicks,
       SUM(wr.revenue) AS total_revenue, ## delete everything below this
       FORMAT((SUM(md.cost)/SUM(wr.revenue))* 100, 2) as CRR,
       FORMAT(((SUM(wr.revenue) - SUM(md.cost)) / SUM(md.cost)) * 100, 2) AS roi,
       FORMAT((SUM(md.clicks) / SUM(md.impressions)) * 100, 2) AS ctr,
       FORMAT(SUM(md.cost) / SUM(md.conversions), 2) AS cpl
FROM campaign_info ci
    LEFT JOIN marketing_data md ON ci.id = md.campaign_id
    LEFT JOIN website_revenue wr ON ci.id = wr.campaign_id
GROUP BY ci.name, ci.id
ORDER BY campaign_name;

# 6 BONUS question: Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.
SELECT DAYNAME(md.date) AS day_of_week,
       FORMAT(AVG(md.impressions), 2) AS avg_impressions,
       FORMAT(AVG(md.clicks), 2) AS avg_clicks,
       FORMAT(AVG(wr.revenue), 2) AS avg_revenue
FROM marketing_data md
    LEFT JOIN website_revenue wr ON md.campaign_id = wr.campaign_id
GROUP BY day_of_week
ORDER BY avg_impressions DESC;