DROP TABLE "VISITS";
DROP TABLE "SUBJECT";
DROP TABLE "USER";
DROP TABLE "GROUP";
CREATE TABLE "USER" (
  "user_id" SERIAL PRIMARY KEY NOT NULL,
  "user_name" varchar NOT NULL,
  "user_login" varchar NOT NULL,
  "user_password" char[256] NOT NULL,
  "user_type" smallint NOT NULL,
  "group_id" int REFERENCES "GROUP"
);

CREATE TABLE "GROUP" (
  "group_id" SERIAL PRIMARY KEY NOT NULL,
  "group_faculty" varchar NOT NULL,
  "group_specialty" varchar NOT NULL,
  "group_year" int NOT NULL
);

CREATE TABLE "SUBJECT" (
  "subject_id" SERIAL PRIMARY KEY NOT NULL,
  "subject_audience" varchar NOT NULL,
  "subject_type" smallint NOT NULL,
  "subject_name" varchar NOT NULL,
  "subject_time" time NOT NULL,
  "subject_weekday" smallint NOT NULL,
  "subject_weektype" smallint NOT NULL,
  "subject_teacher" int REFERENCES "USER"
);

CREATE TABLE "VISITS" (
  "group_id" int REFERENCES "GROUP" ON DELETE CASCADE ON UPDATE CASCADE,
  "subject_id" int REFERENCES "SUBJECT" ON DELETE CASCADE ON UPDATE CASCADE,
  PRIMARY KEY ("group_id", "subject_id")
);
