create schema beauty_bar character set utf8_general_ci;
use beauty_bar;

create table user(
id int auto_increment,
who enum('visitor', 'admin', 'master'),
name varchar (255),
primary key (id)
);

create table services(
id int auto_increment,
service varchar (255),
userId Int,
primary key (id),
foreign key (userId) references user(id) where who='master'
);

create table registration(
id Int auto_increment,
master Int,
visitor Int,
'time' date,
serviceId int,
primary key (id),
foreign key (master) references user(id),
foreign key (visitor) references user(id),
foreign key (serviceId) references services(id)
);

