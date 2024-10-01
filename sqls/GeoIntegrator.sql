alter table transaction
    add pos_ticket_number varchar(255) null;
alter table pos_data
    add pos_ticket_number varchar(255) null;

SELECT * FROM transaction;
SELECT * FROM pos_data;