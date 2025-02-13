delete from user_role;
delete from users;

insert into users(id, username, password, active,email) VALUES
    (1, 'admin','$2y$08$AwJM.IyItUo1fhE/LsNN2uB6oswZtC3zzks8xNGdf1PGG/2GAoaca',true,'admin@gmail.com');
insert into users(id, username, password, active,email) VALUES
    (2, 'elzat','$2a$08$fSLOw10bWOl04.smKkabged9rddTjWdM/cx.L2Uledir2b6sy4FJO',true,'elzat@gmail.com');
insert into user_role(user_id, roles) VALUES
       (1, 'USER'), (1, 'ADMIN');
insert into user_role(user_id, roles) VALUES
       (2, 'USER');