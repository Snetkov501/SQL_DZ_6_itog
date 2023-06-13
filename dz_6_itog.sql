CREATE DATABASE IF NOT EXISTS dz_6_itog;

USE dz_6_itog;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DELIMITER $$
CREATE PROCEDURE tim(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;
    DECLARE hourssec INT default 0;
    DECLARE minutessec INT default 0;

    WHILE seconds >= 86400 DO
    SET days = seconds / 86400;
    SET seconds = seconds - 86400;
    END WHILE;

    WHILE seconds >= 3600 and seconds < 86400  DO
    SET hours = seconds / 3600 ;
    SET hourssec = hours * 3600;
    SET seconds = seconds - hourssec;
    END WHILE;

    WHILE seconds >= 60  and seconds  < 3600 DO
    SET minutessec=seconds;
    SET seconds = seconds % 60;
    SET minutes = (minutessec-seconds)/60;
    
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL tim(123456);
-- Выведите только четные числа от 1 до 10 (Через цикл).Пример: 2,4,6,8,10

DELIMITER $$
CREATE PROCEDURE numbers()
BEGIN
    DECLARE n INT default 0;
    DROP TABLE IF EXISTS nums;
    CREATE TABLE nums (n INT);

    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO nums VALUES(n);
    END WHILE;

SELECT * FROM nums;
END $$
DELIMITER ;

CALL numbers();