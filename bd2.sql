CREATE DATABASE  work_base;
USE  work_base;

id191692125id191692125


create table `Изделие`
(
`Артикул`char (60) not null, 
`Наименование` varchar (60) not null, 
`Ширина` varchar (60) not null, 
`Длина`  varchar (60) not null, 
`Изображение` varchar (60)  null, 
`Комментарий`varchar  (60)  null, 
primary key `Артикул`
);
 
create table `Заказ` 
(
`Номер` varchar (15) not null,
`Дата` varchar (10) not null, 
`Этап выполнения` varchar (30) not null, 
`Заказчик` varchar (40) not null, 
`Менеджер` varchar (60) null, 
`Стоимость` char (20) null,
primary key `Номер`, 
CONSTRAINT `Заказчик_менеджер`PRIMARY KEY (`Заказчик`,`Менеджер`), 
foreign key (`Заказчик`) references `Пользователь` (`Логин`) on update cascade on delete restrict, 
foreign key (`Менеджер`) references `Пользователь` (`Логин`) on update cascade on delete restrict
);

create table `Заказные изделия`
(
`Номер заказа` varchar (60) not null, 
`Артикул изделия` varchar (50) not null, 
`Количество` varchar (60) not null, 
primary key `Номер заказа`, 
foreign key `Артикул изделия` references `Изделие` (`Артикул`)  on update cascade on delete restrict
);

create table `Пользователь`
(
`Логин` varchar (60) not null, 
`Пароль` varchar (60) not null, 
`Роль` varchar (60) not null, 
`Наименование` varchar (60) null, 
primary key `Логин`
);


create table `Ткань`
(
`Артикул` varchar (60) not null, 
`Наименование` varchar (60) not null, 
`Цвет` varchar (60) null, 
`Рисунок` varchar (100) null, 
`Изображение` varchar (100) null, 
`Состав` varchar (60) null, 
`Ширина` varchar (60) not null, 
`Длина` varchar (60) not null, 
`Цена` varchar (60) not null, 
primary key `Артикул`
);


create table `Ткани и изделия`
(
`Артикул ткани` varchar (60) not null, 
`Артикул изделия` varchar (60) not null, 
primary key `Артикул ткани`,
foreign key (`Артикул изделия`) references `Изделие` (`Артикул`) on update cascade on delete restrict
);


create table `Склад ткани`
(
`Рулон` varchar (60) not null,
`Артикул ткани` varchar (60) not null,
`Ширина` varchar (60) not null,
`Длина` varchar (60) not null,
primary key `Рулон`,
primary key `Артикул ткани`
); 


create table `Фурнитура`
(
`Артикул` varchar (60) not null,
`Наименование` varchar (60) not null,
`Тип`varchar (60) not null,
`Ширина` varchar (60) not null,
`Длина` varchar (60) null,
`Вес` varchar (60) null,
`Изображение` varchar (100) null,
`Цена` varchar (60) not null,
primary key `Артикул`
); 
 



create table `Фурнитура изделия` 
(
`Артикул фурнитуры` varchar (60) not null,
`Артикул изделия` varchar (60) not null,
`Размещение` varchar (60) not null,
`Ширина` varchar (60) null,
`Длина` varchar (60) null,
`Поворот` varchar (60) null,
`Количество` varchar (60) not null,
primary key `Артикул фурнитуры`,
foreign key (`Артикул изделия`) references `Изделие` (`Артикул`) on update cascade on delete restrict
); 




create table `Склад фурнитуры`
(
`Партия` varchar (60) not null,
`Артикул фурнитуры` varchar (60) not null,
`Количество` varchar (60) not null,
primary key `Партия`, 
foreign key (`Артикул фурнитуры`) references `Фурнитура` (`Артикул`) on update cascade on delete restrict
);
