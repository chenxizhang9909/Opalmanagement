/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  Administrator
 * Created: 2021年10月3日
 */

drop table ORDERS

create table ORDERS
(
        ID INTEGER not null GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1)  primary key,
        CARDTYPE VARCHAR(30) not null,
	FIRSTNAME VARCHAR(100) not null,
	LASTNAME VARCHAR(100) not null,
        AGE INTEGER not null,
        PHONE VARCHAR(50) not null,
        ADDVALUE INTEGER not null,
        DELIVERYADDRESS VARCHAR(255) not null,
        STATE VARCHAR(100) not null,
        CODE VARCHAR(100) not null,
        RECEIVERNAME VARCHAR(100) not null,
        UID INTEGER not null,
        STATUS INTEGER not null,
        CARDNUMBER VARCHAR(100),
        CVV VARCHAR(100),
        OWNERNAME VARCHAR(100)	
);
        



