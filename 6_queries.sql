(a)
select g_name as most_rented
from game where g_ID = (SELECT TOP 1 g_ID FROM  ordering GROUP BY  g_ID ORDER BY count(g_ID) DESC)

(b)
SELECT g_name FROM  game where g_ID not in (select g_ID from ordering where month=4 and year = 2022)

(c)
SELECT TOP 1 c_username as max_renter FROM  ordering  where month= 4 and year = 2022 GROUP BY  c_username ORDER BY count(c_username) DESC

(d)
select TOP 1 game.v_username from game inner join ordering on game.g_ID=ordering.g_ID and ordering.month=4 and ordering.year = 2022 group by v_username order by count(game.v_username) DESC

(e)
 select v_username from game where v_username not in (select  game.v_username from game inner join ordering on game.g_ID=ordering.g_ID and ordering.month=4 and ordering.year = 2022 group by v_username)

(f)
select v_username from vendor where v_username not in (select v_username from  game where year=2021 ) 




