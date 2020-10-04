set serveroutput on;
set verify off;
-- QUESTION 2a
create or replace procedure generate_multiplication_table_for
(usr_input number)
as
small_buff varchar(10);
large_buff varchar(20);
begin
    if (usr_input < 1 OR usr_input > 10) then
        dbms_output.put_line('Please enter a value between 1 and 10.');
        return;
        end if;
    for j in 1..usr_input loop
        small_buff := '   ';
        large_buff := '    ';
        for i in 1..usr_input loop
            if (i = 0 AND j > 0) then 
                if (j > 9) then
                dbms_output.put(j || small_buff);
                elsif (j < 10) then
                dbms_output.put(j || large_buff);
                end if;
            elsif (j = 0 AND i > 0) then
            if (i > 9) then
                dbms_output.put(i || small_buff);
                elsif (i < 10) then
                dbms_output.put(i || large_buff);
                end if;
            elsif (i > 0 AND j > 0) then
            if (i*j > 9) then
                dbms_output.put(i*j || small_buff);
                elsif (i*j < 10) then
                dbms_output.put(i*j || large_buff);
                end if;
                end if;
            end loop;
            dbms_output.put_line('');
    end loop;
end;
/
begin
    generate_multiplication_table_for(10);
end;
/
-- QUESTION 2c
CREATE OR REPLACE PROCEDURE generate_multiplication_table_simple (
    usr_input IN NUMBER
) AS
    count1 NUMBER;
    count2 NUMBER;
BEGIN
    count1 := 1;
    IF usr_input < 1 OR usr_input > 10 THEN
        dbms_output.put_line('Please enter a value between 1 and 10.');
    ELSE    
        LOOP
            count2 := 1;
            LOOP
                IF count2 = usr_input THEN
                    dbms_output.put_line(count1 * count2);
                ELSE
                    dbms_output.put(rpad(count1 * count2, 5));
                END IF;
                count2 := count2 + 1;
                EXIT WHEN count2 > usr_input;
            END LOOP;
            count1 := count1 + 1;
            EXIT WHEN count1 > usr_input;
        END LOOP;
    END IF;
END;
/
begin
    generate_multiplication_table_simple(10);
end;
/*
QUESTION 2a
Procedure GENERATE_MULTIPLICATION_TABLE_FOR compiled

1    2    3    4    5    6    7    8    9    10   
2    4    6    8    10   12   14   16   18   20   
3    6    9    12   15   18   21   24   27   30   
4    8    12   16   20   24   28   32   36   40   
5    10   15   20   25   30   35   40   45   50   
6    12   18   24   30   36   42   48   54   60   
7    14   21   28   35   42   49   56   63   70   
8    16   24   32   40   48   56   64   72   80   
9    18   27   36   45   54   63   72   81   90   
10   20   30   40   50   60   70   80   90   100   


PL/SQL procedure successfully completed.

QUESTION 2c
Procedure GENERATE_MULTIPLICATION_TABLE_SIMPLE compiled

1    2    3    4    5    6    7    8    9    10
2    4    6    8    10   12   14   16   18   20
3    6    9    12   15   18   21   24   27   30
4    8    12   16   20   24   28   32   36   40
5    10   15   20   25   30   35   40   45   50
6    12   18   24   30   36   42   48   54   60
7    14   21   28   35   42   49   56   63   70
8    16   24   32   40   48   56   64   72   80
9    18   27   36   45   54   63   72   81   90
10   20   30   40   50   60   70   80   90   100


PL/SQL procedure successfully completed.
*/
