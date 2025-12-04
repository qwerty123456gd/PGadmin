/*1*/ /*SELECT last_name, phone_number
FROM klients, number_of_telephone, klients_number
where klients_number.klient_id = klients.id and klients_number.number_id = number_of_telephone.id and mod(number_of_telephone.phone_number, 10) = 7;*/

/*2*//*Select * from (SELECT tel_id
FROM used_s, number_of_telephone
where used_s.tel_id = number_of_telephone.id 
and DATE_PART('month', used_s.udate) =  DATE_PART('month', CURRENT_DATE) - 1 and used_s.kolvo = (select MAX(kolvo) from used_s where s_id = 2 
and DATE_PART('month', udate) =  DATE_PART('month', CURRENT_DATE) - 1)) as t1
JOIN (SELECT number_of_telephone.id, phone_number,  udate, kolvo, addcost_rub, kolvo*addcost_rub as "cost", (kolvo*addcost_rub)-((kolvo*addcost_rub*10)/100) as "cost-10%"
FROM used_s, number_of_telephone, addservices where (DATE_PART('month', udate) =  DATE_PART('month', CURRENT_DATE) - 1 and used_s.s_id = addservices.id)) as t2 ON t1.tel_id = t2.id;
*/ 

/*3*/ /*
Select DISTINCT klients.id, addname, addcost_rub, (select SUM(addcost_rub)/3 from addservices)from klients, addservices, adds_tel, number_of_telephone, klients_number, used_s
where klients.id = klients_number.klient_id and number_of_telephone.id = klients_number.number_id and used_s.tel_id = number_of_telephone.id 
and addservices.id = used_s.s_id 
ORDER BY klients.id ASC*/

/*4*/ /*SELECT emp_pos.id, last_name, first_name, surname, pname
FROM employees, emp_pos, positions
where emp_pos.employee_id = employees.id and emp_pos.position_id = positions.id and pname = 'Менеджер';*/

/*5*//*SELECT klients.id, last_name, first_name, surname, phone_number, udate, kolvo, addcost_rub, kolvo*addcost_rub as "cost", 
(kolvo*addcost_rub)-((kolvo*addcost_rub*50)/100) as "cost with discount" 
from klients, number_of_telephone, klients_number, used_s, addservices
where klients.id = klients_number.klient_id and number_of_telephone.id = klients_number.number_id 
and used_s.tel_id = number_of_telephone.id and klients.id = 4 and used_s.s_id = 2 and DATE_PART('month', used_s.udate) = 4 and used_s.s_id = addservices.id;*/

/*6*/ /*select round((round(SUM(cost)))*0.01) as total_cost_in_Dollars FROM(Select last_name, phone_number, tarif_price_rub, kolvo*addcost_rub as "cost" from klients, number_of_telephone, klients_number, used_s, addservices, Tarifs, tar_in_tel
where klients.id = klients_number.klient_id and number_of_telephone.id = klients_number.number_id and used_s.tel_id = number_of_telephone.id 
and klients.last_name = 'Павлов' 
and DATE_PART('month', used_s.udate) = DATE_PART('month', CURRENT_DATE) 
and tar_in_tel.tel_id = number_of_telephone.id and tar_in_tel.tar_id = Tarifs.id and addservices.id = used_s.s_id);*/


