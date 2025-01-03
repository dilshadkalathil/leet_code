WITH Friendships AS (
    -- Create a list of all friends, considering both requester and accepter
    SELECT requester_id AS person_id, accepter_id AS friend_id
    FROM RequestAccepted
    UNION
    SELECT accepter_id AS person_id, requester_id AS friend_id
    FROM RequestAccepted
),
FriendCount AS (
    -- Count how many distinct friends each person has
    SELECT person_id, COUNT(DISTINCT friend_id) AS num
    FROM Friendships
    GROUP BY person_id
)
-- Get the person with the maximum number of friends
SELECT person_id AS id, num
FROM FriendCount
ORDER BY num DESC
LIMIT 1;



