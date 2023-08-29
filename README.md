# PMG-Assessment

**1. Write a query to get the sum of impressions by day.**
```MYSQL
SELECT DATE(date) AS Day, SUM(impressions) as total_impressions FROM marketing_data GROUP BY Day ORDER BY Day;
```

**2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?**
```MYSQL
SELECT state, SUM(revenue) as total_revenue FROM website_revenue GROUP BY state ORDER BY total_revenue DESC LIMIT 3;
```
Ohio was the third best state generating 37577 in revenue.

**3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.**
```MYSQL
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
```

**4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?**
```MYSQL
SELECT state, SUM(md.conversions) as total_conversations
FROM marketing_data md
    LEFT JOIN website_revenue wr ON md.campaign_id = wr.campaign_id
    LEFT JOIN campaign_info ci ON md.campaign_id = ci.id
WHERE ci.name = 'Campaign5'
GROUP BY wr.state
ORDER BY total_conversations DESC;
```
For Campaign 5, Georgia generated the most conversations.

**5. In your opinion, which campaign was the most efficient, and why?**

In terms of pure efficiency, Campaign 4 stands out as the most effective choice. My analysis was based on the Cost per Lead (CPL) metric, where I divided the total cost by the total number of conversions for each campaign. Notably, Campaign 4 exhibited the lowest CPL among all five campaigns. 

Although the differences in CPL were relatively small across the campaigns, Campaign 4's distinct advantage became evident when considering Return on Investment (ROI). With a significantly higher ROI compared to the other campaigns, Campaign 4 demonstrated its ability not only to acquire leads efficiently but also to convert those leads into substantial revenue. 

By combining a low CPL with a strong ROI, Campaign 4 showcased efficient resource utilization and strategic prowess. These factors collectively support the conclusion that Campaign 4 is the most efficient campaign choice.

When evaluating campaign efficiency, it's crucial to consider a range of metrics aligned with our objectives and strategy. In this case, the combination of metrics underscores Campaign 4's effectiveness in lead generation and revenue conversion, reinforcing its position as the optimal choice for efficiency.

Here is the SQL query I used to look at the data:
```MYSQL
SELECT name as campaign_name,
       FORMAT(SUM(md.cost), 2) AS total_cost,
       SUM(md.impressions) AS total_impressions,
       SUM(md.clicks) AS total_clicks,
       SUM(wr.revenue) AS total_revenue,
       FORMAT((SUM(md.cost)/SUM(wr.revenue))* 100, 2) as CRR,
       FORMAT(((SUM(wr.revenue) - SUM(md.cost)) / SUM(md.cost)) * 100, 2) AS roi,
       FORMAT((SUM(md.clicks) / SUM(md.impressions)) * 100, 2) AS ctr,
       FORMAT(SUM(md.cost) / SUM(md.conversions), 2) AS cpl
FROM campaign_info ci
    LEFT JOIN marketing_data md ON ci.id = md.campaign_id
    LEFT JOIN website_revenue wr ON ci.id = wr.campaign_id
GROUP BY ci.name, ci.id
ORDER BY campaign_name;
```
The results:
|campaign_name|total_cost|total_impressions|total_clicks|total_revenue|CRR |roi     |ctr   |cpl |
|-------------|----------|-----------------|------------|-------------|----|--------|------|----|
|Campaign1    |4,170.51  |42810            |38724       |151792       |2.75|3,539.65|90.46 |0.46|
|Campaign2    |4,075.50  |40938            |29652       |155308       |2.62|3,710.77|72.43 |0.45|
|Campaign3    |15,809.04 |158280           |116048      |551672       |2.87|3,389.60|73.32 |0.44|
|Campaign4    |3,970.14  |47508            |33318       |163396       |2.43|4,015.62|70.13 |0.43|
|Campaign5    |4,077.15  |25641            |33663       |136404       |2.99|3,245.57|131.29|0.52|


**Bonus Question**

**6. Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.**

```MYSQL
SELECT DAYNAME(md.date) AS day_of_week,
       FORMAT(AVG(md.impressions), 2) AS avg_impressions,
       FORMAT(AVG(md.clicks), 2) AS avg_clicks,
       FORMAT(AVG(wr.revenue), 2) AS avg_revenue
FROM marketing_data md
    LEFT JOIN website_revenue wr ON md.campaign_id = wr.campaign_id
GROUP BY day_of_week
ORDER BY avg_impressions DESC;
```
Results:
|day_of_week|avg_impressions|avg_clicks       |avg_revenue |
|-----------|---------------|-----------------|------------|
|Sunday     |1,842.80       |1,512.40         |6,576.67    |
|Thursday   |1,823.02       |1,305.28         |6,302.72    |
|Monday     |1,769.60       |1,491.00         |6,346.35    |
|Friday     |1,731.02       |1,287.15         |6,378.96    |
|Saturday   |1,637.00       |1,479.65         |6,518.35    |
|Wednesday  |1,539.50       |1,691.00         |6,324.67    |


This query reveals that Sunday emerges as the most favorable day of the week for running ads, considering both impressions and revenue generated. However, it's essential to acknowledge that identifying the optimal day can be a subjective process, heavily influenced by the campaign's specific goals and objectives.

Created by Wyatt Saltzman
