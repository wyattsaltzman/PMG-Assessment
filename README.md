# PMG-Assessment

1. Write a query to get the sum of impressions by day.
```MYSQL
SELECT DATE(date) AS Day, SUM(impressions) as total_impressions FROM marketing_data GROUP BY Day;
```

2. Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?
```MYSQL
SELECT state, SUM(revenue) as total_revenue FROM website_revenue GROUP BY state ORDER BY total_revenue DESC LIMIT 3;
```
Georgia was the third best revenue-generating state.

3. Write a query that shows total cost, impressions, clicks, and revenue of each campaign. Make sure to include the campaign name in the output.
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

4. Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?
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

5. In your opinion, which campaign was the most efficient, and why?

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

**Bonus Question**

6. Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.

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
This query reveals that Sunday emerges as the most favorable day of the week for running ads, considering both impressions and revenue generated. However, it's essential to acknowledge that identifying the optimal day can be a subjective process, heavily influenced by the campaign's specific goals and objectives.
