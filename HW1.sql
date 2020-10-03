set serveroutput on;
set verify off;
-- QUESTION 2c
create or replace procedure generate_multiplication_table
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
    generate_multiplication_table(10);
end;
/*

*/