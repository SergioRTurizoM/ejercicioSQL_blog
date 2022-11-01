table users {
  user_id integer [pk,
increment]
  user_name varchar [not null]
  user_email varchar [not null]
  user_password varchar [not null]
  user_age integer [not null]
  user_role_id integer [not null]

}


Table post {
  post_id integer [pk, increment]
  post_title varchar [not null]
  post_description varchar [not null]
  post_user_id integer [not null]
  post_content varchar [not null]
  post_category_id integer [not null]

}

Table category {
  category_id integer [pk, increment]
  category_name varchar [not null]
}

Table roles {
  role_id integer [pk, increment]
  role_name varchar [not null]
}

Table comments {
  comment_id integer [pk, increment]
  comment_post_id integer [not null]
  comment_user_id integer [not null]
  comment varchar [not null]
}

Ref: "roles"."role_id" < "users"."user_role_id"



Ref: "users"."user_id" < "comments"."comment_user_id"

Ref: "category"."category_id" < "post"."post_category_id"

Ref: "users"."user_id" < "post"."post_user_id"

Ref: "post"."post_id" < "comments"."comment_post_id"


insert into category (category_name) values 
('Life Style'),
('Gastronomy'),
('Travel'),
('Workout');

insert into roles (role_name) values
('Author'),
('Guest'),
('Administrator');

select * from category c ;
select * from roles;

insert into users (user_name, user_email, user_password, user_age, user_role_id) values
('Sergio', 'sergio@sergio.com', 'abc123', 34, 1),
('María', 'maria@maria.com', '123xyz', 35, 2),
('Luis', 'luis@luis.com', 'qwe123', 33, 3),
('Andrés', 'andres@andres.com', 'poi123', 32, 2),
('Luisa', 'luisa@luisa.com', 'uyt234', 34, 1),
('Fernando', 'fernando@fer.com', 'uye456', 35,2),
('Lucero', 'luce@gmail.com', 'hyu345', 30, 2);


insert into post (post_title, post_description, post_user_id, post_content, post_category_id) values 
('Mindfulness para la vida', 'Técnicas de mindfulnes para tu estilo de vida', 1, 'Explora nuevas técnicas de relajación', 1),
('Recetas para navidad', 'Rescata esos platos de antaño', 2, 'Tendrás muchas opciones para navidad', 1),
('Ejercicios par adelgazar', 'Nuevas tecnicas para adelgazar', 4, 'Entrena desde casa', 1);

insert into "comments" (comment_post_id, comment_user_id, "comment") values
(1, 2, 'Me gustó mucho el post'),
(2, 4, 'Excelentes recetas');

select * from "comments" c ;
select * from users u ;
