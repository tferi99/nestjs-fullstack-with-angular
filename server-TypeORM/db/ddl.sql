CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "todo" (
    "id" uuid NOT NULL DEFAULT uuid_generate_v4(),
    "name" character varying NOT NULL,
    "description" text, 
    "createdOn" TIMESTAMP NOT NULL DEFAULT now(), 
	"ownerId" uuid, 
CONSTRAINT "PK_d429b7114371f6a35c5cb4776a7" PRIMARY KEY ("id"));


CREATE TABLE "task" (
	"id" uuid NOT NULL DEFAULT uuid_generate_v4(), 
	"name" character varying NOT NULL, 
	"createdOn" TIMESTAMP NOT NULL DEFAULT now(), 
	"todoId" uuid, 
CONSTRAINT "PK_fb213f79ee45060ba925ecd576e" PRIMARY KEY ("id"));

ALTER TABLE "task" ADD CONSTRAINT "FK_91440d017e7b30d2ac16a27d762" FOREIGN KEY ("todoId") REFERENCES "todo"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE "todo" ADD "updatedOn" TIMESTAMP NOT NULL DEFAULT now();

CREATE TABLE "users" (
	"id" uuid NOT NULL DEFAULT uuid_generate_v4(), 
	"username" character varying NOT NULL, 
	"password" character varying NOT NULL, 
	"email" character varying NOT NULL, 
	"createdOn" TIMESTAMP NOT NULL DEFAULT now(), 
	"updatedOn" TIMESTAMP NOT NULL DEFAULT now(), 
CONSTRAINT "UQ_78a916df40e02a9deb1c4b75edb" UNIQUE ("username"), CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id"));
	  
ALTER TABLE "todo" ADD CONSTRAINT "FK_05552e862619dc4ad7ec8fc9cb8" FOREIGN KEY ("ownerId") REFERENCES "users"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

insert into users(id, username, "password", email, "createdOn") values('8bb74918-190c-40c3-a23e-7431ee502075', 'admin', '$2b$10$Gh14uzPU3PBwQAyjxwfFB..4gosnjS5apPsjNYuOJwP3lPc4dq58u', 'admin@test.org', now());
insert into users(id, username, "password", email, "createdOn") values('569881ae-4670-4017-b845-3a3b671a0c9d', 'ftoth', '$2b$10$ZMQBLwEDyHeGL9o1VriN1eE53m4dFJK1e71RIKsw0ds9xbx0ZZQM6', 'ftoth@test.org', now());


