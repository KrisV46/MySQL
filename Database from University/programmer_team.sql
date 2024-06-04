SELECT programmer.name, programmer.address, teamLeader.name as TeamLeader
FROM programmer JOIN programmer AS teamLeader
WHERE programmer.teamLeader_id = teamLeader.id;