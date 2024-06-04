delimiter |
CREATE PROCEDURE getAllSportsGroupswithSports()
BEGIN
SELECT sg.location as locationOfGroup,
sg.hours as trainingHour,
sp.name as sportName
FROM sportgroups as sg JOIN sports as sp
ON sg.sports_id = sp.id;
END
|  
delimiter ; 
CALL  getAllSportsGroupswithSports();

delimiter |
CREATE PROCEDURE proc_in (IN var VARCHAR(255))
BEGIN
SET @coach_name = var;
END;
|  
delimiter ; 
CALL proc_in('Павка Павков');
SELECT * FROM coaches
WHERE name = @coach_name 

delimiter |
CREATE PROCEDURE out_proc (OUT var VARCHAR(255))
BEGIN
SELECT var; 
SET var = 'Павка Павков';
END;
|  
delimiter ; 
SET @test_out = 'Some name';
CALL out_proc(@test_out);
SELECT @test_out;


