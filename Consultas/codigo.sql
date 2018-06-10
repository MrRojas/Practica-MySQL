/*Edadd y Nombre */

select name , year(now()) - year(birthdate) as Edad from clients where name like '%sa%' limit 10;

/*cantidad de libros*/

select count(*) from books;

/*condicion*/
select * from authors where author_id > 0 and author_id < 6;

select * from authors where author_id between 1 and 5; 

/*
JOIN - union  
	donde book es la tbla pivote
*/

/
select b.book_id , a.name, b.title  from 
books as b inner JOIN authors as a on a.author_id = b.author_id
where a.author_id between 1 and 5; 


select b.book_id , a.name, b.title  from 
authors as a inner JOIN books as b  on a.author_id = b.author_id
where a.author_id between 1 and 5; 

select c.name as Nombre , b.title as Titulo , a.name as Autor , t.type as Estado 
from transactions as t 
inner JOIN books as b on t.book_id = b.book_id
inner JOIN clients as c on c.client_id = t.client_id 
inner JOIN authors as a on a.author_id = b.author_id
where c.gender='F' and t.type in ('sell','lend');


/* Uso de Left Join */

select a.author_id as ID_AUTOR, a.name as Nombre, a.nationality as Pais, b.title
from authors as a 
left join books as b on b.author_id = a.author_id
where a.author_id between 1 and 5
order by a.name desc

/*Uso de Count*/

SELECT  a.author_id as ID_AUTOR, a.name as Nombre, a.nationality as Pais,COUNT( b.title ) as 'cantidad de libro'
from authors as a 
left join books as b on b.author_id = a.author_id
where a.author_id between 1 and 5
GROUP BY a.author_id
order by a.name desc;

