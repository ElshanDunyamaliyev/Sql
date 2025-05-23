create table users
(
    id          serial primary key,
    name        varchar(250),
    surname     varchar(250),
    nationality varchar(250),
    age         integer
);

create table photos
(
    id         serial primary key,
    title      varchar(250),
    base64_content text,
    upload_date date,
    user_id    integer not null,
--     constraint fk_photo_user foreign key (user_id) references users (id) on delete cascade
    constraint fk_photo_user foreign key (user_id) references users (id) on delete set null
--     constraint fk_photo_user foreign key (user_id) references users (id) on delete set default
);

create table comments
(
    id       serial primary key,
    content  varchar(250),
    user_id  int not null,
    photo_id int not null,
    constraint fk_comment_user foreign key (user_id) references users (id) on delete cascade,
    constraint fk_comment_photo foreign key (photo_id) references photos (id) on delete cascade
);

create table likes
(
    id          serial primary key,
    photo_id integer not null ,
    constraint fk_like_photo foreign key (photo_id) references photos(id) on delete cascade
);

insert into users(name, surname, nationality, age) VALUES
                                                       ('elsen','dunyamaliyev','azerbaijan',22),
                                                       ('elxan','bayramov','azerbaijan',23);

insert into photos(title, base64_content, upload_date, user_id) VALUES
    ('post img','test', current_date,1);

insert into comments(content, user_id, photo_id) VALUES
    ('This photo is realy impressive',1,1);

insert into likes(photo_id) values (1);

-- select * from photos p join users u on p.user_id = u.id;
select p.title as photo_content,p.upload_date,u.name,u.surname from photos p join users u on p.user_id = u.id;

delete from users where id = 1;