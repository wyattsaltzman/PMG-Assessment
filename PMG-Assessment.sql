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
insert into campaign_info (id, name, status, last_updated_date, revenue)
values  (55304737, 'Campaign2', 'enabled', '2023-07-25 00:00:00', null),
        (64441550, 'Campaign1', 'paused', '2023-08-08 00:00:00', null),
        (86363015, 'Campaign4', 'paused', '2023-08-14 00:00:00', null),
        (89363211, 'Campaign3', 'enabled', '2023-08-06 00:00:00', null),
        (99058240, 'Campaign5', 'enabled', '2023-07-28 00:00:00', null);
insert into PMG.marketing_data (date, campaign_id, geo, cost, impressions, clicks, conversions)
values  ('2023-07-29 00:00:00', '64441550', 'United States-TX', 107.86, 2486, 1737, 294),
        ('2023-08-14 00:00:00', '64441550', 'United States-OH', 230.99, 2465, 1747, 275),
        ('2023-08-12 00:00:00', '64441550', 'United States-GA', 214.94, 2461, 1306, 352),
        ('2023-08-04 00:00:00', '55304737', 'United States-NY', 123.74, 1069, 1356, 317),
        ('2023-08-19 00:00:00', '86363015', 'United States-GA', 122.74, 1248, 1290, 388),
        ('2023-07-29 00:00:00', '99058240', 'United States-GA', 162.58, 1025, 1724, 346),
        ('2023-08-03 00:00:00', '89363211', 'United States-GA', 223.92, 1676, 1714, 480),
        ('2023-07-28 00:00:00', '89363211', 'United States-OH', 157.63, 1166, 1301, 473),
        ('2023-08-02 00:00:00', '64441550', 'United States-TX', 102.97, 1532, 1806, 470),
        ('2023-08-17 00:00:00', '99058240', 'United States-OH', 227.24, 1550, 1236, 442),
        ('2023-08-13 00:00:00', '55304737', 'United States-TX', 215.55, 2170, 1430, 268),
        ('2023-07-27 00:00:00', '89363211', 'United States-TX', 106.19, 2295, 1139, 287),
        ('2023-08-14 00:00:00', '89363211', 'United States-TX', 168.6, 1940, 1587, 411),
        ('2023-08-10 00:00:00', '89363211', 'United States-TX', 193.18, 2128, 1030, 481),
        ('2023-07-30 00:00:00', '86363015', 'United States-CA', 198.19, 1873, 1479, 287),
        ('2023-08-11 00:00:00', '89363211', 'United States-OH', 176.48, 1050, 1418, 449),
        ('2023-08-17 00:00:00', '89363211', 'United States-GA', 219.56, 1742, 1113, 465),
        ('2023-07-28 00:00:00', '55304737', 'United States-CA', 141.84, 2216, 1030, 456),
        ('2023-07-28 00:00:00', '86363015', 'United States-TX', 117.77, 2469, 1617, 499),
        ('2023-08-03 00:00:00', '89363211', 'United States-GA', 171.03, 1513, 1591, 267),
        ('2023-08-12 00:00:00', '89363211', 'United States-CA', 211.66, 1799, 1288, 354),
        ('2023-08-11 00:00:00', '64441550', 'United States-GA', 179.42, 1228, 1283, 479),
        ('2023-07-26 00:00:00', '64441550', 'United States-GA', 208.19, 1547, 1576, 410),
        ('2023-07-24 00:00:00', '64441550', 'United States-GA', 176.21, 1423, 1709, 327),
        ('2023-07-28 00:00:00', '89363211', 'United States-OH', 238.95, 2291, 1059, 305),
        ('2023-08-04 00:00:00', '89363211', 'United States-NY', 108.93, 2185, 1266, 479),
        ('2023-07-30 00:00:00', '64441550', 'United States-NY', 169.59, 1128, 1744, 411),
        ('2023-08-05 00:00:00', '99058240', 'United States-GA', 192.63, 1088, 1849, 326),
        ('2023-08-14 00:00:00', '55304737', 'United States-GA', 198.12, 1368, 1126, 475),
        ('2023-08-12 00:00:00', '86363015', 'United States-NY', 222.99, 2328, 1167, 377);
insert into PMG.website_revenue (date, campaign_id, state, revenue)
values  ('2023-08-13 00:00:00', '99058240', 'GA', 6765),
        ('2023-08-07 00:00:00', '99058240', 'GA', 6371),
        ('2023-07-29 00:00:00', '99058240', 'NY', 7147),
        ('2023-08-09 00:00:00', '99058240', 'OH', 5989),
        ('2023-07-31 00:00:00', '99058240', 'GA', 6973),
        ('2023-08-02 00:00:00', '99058240', 'NY', 7093),
        ('2023-07-24 00:00:00', '99058240', 'CA', 5130),
        ('2023-08-02 00:00:00', '89363211', 'CA', 6676),
        ('2023-08-07 00:00:00', '89363211', 'NY', 5600),
        ('2023-08-21 00:00:00', '89363211', 'CA', 5249),
        ('2023-07-31 00:00:00', '89363211', 'OH', 6743),
        ('2023-08-05 00:00:00', '89363211', 'OH', 6003),
        ('2023-08-19 00:00:00', '89363211', 'TX', 7081),
        ('2023-08-10 00:00:00', '89363211', 'CA', 6335),
        ('2023-08-03 00:00:00', '89363211', 'NY', 6465),
        ('2023-08-03 00:00:00', '86363015', 'CA', 6239),
        ('2023-08-17 00:00:00', '86363015', 'NY', 7014),
        ('2023-07-27 00:00:00', '86363015', 'CA', 6920),
        ('2023-08-15 00:00:00', '86363015', 'TX', 6556),
        ('2023-08-15 00:00:00', '86363015', 'NY', 6673),
        ('2023-08-09 00:00:00', '86363015', 'OH', 7447),
        ('2023-07-24 00:00:00', '64441550', 'GA', 6370),
        ('2023-07-26 00:00:00', '64441550', 'TX', 7033),
        ('2023-08-05 00:00:00', '64441550', 'OH', 5571),
        ('2023-07-24 00:00:00', '55304737', 'TX', 6607),
        ('2023-07-30 00:00:00', '55304737', 'TX', 6803),
        ('2023-08-09 00:00:00', '55304737', 'NY', 6406),
        ('2023-07-28 00:00:00', '55304737', 'GA', 6964),
        ('2023-07-26 00:00:00', '55304737', 'GA', 6223),
        ('2023-08-11 00:00:00', '55304737', 'OH', 5824);

# 1. Write a query to get the sum of impressions by day.
SELECT DATE(date) AS Day, SUM(impressions) as total_impressions FROM marketing_data GROUP BY Day ORDER BY Day;

#2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
SELECT state, SUM(revenue) as total_revenue FROM website_revenue GROUP BY state ORDER BY total_revenue DESC LIMIT 3;
# The third best state generated 37577 in revenue

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