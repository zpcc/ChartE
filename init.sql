-- CREATE DATABASE charte;

-- /charte

CREATE TABLE Users(
	Uname VARCHAR(20) PRIMARY KEY,
	pwd char(64),
	isAdmin boolean
);

insert into Users values ('admin', '6848d6405bf34bf9b2d82ed8822c756807632d3eaefedec90ac33cb32ac83671', true);

CREATE TABLE Articles(
	Ano SERIAL PRIMARY KEY,
	title VARCHAR(100),
	Uname VARCHAR(20),
	b64data text,
	viewed integer,
	created DATE,
	isPub boolean,
	FOREIGN KEY (Uname) REFERENCES Users(Uname)
);

insert into Articles(isPub, title, b64data) values (true, 'line', 'ew0KICAgICJ0eXBlIjogImxpbmUiLA0KICAgICJkYXRhIjogWw0KICAgICAgWyJYMSIsIDcwXSwNCiAgICAgIFsiWDIiLCAxMDBdLA0KICAgICAgWzMsIDMwXSwNCiAgICAgIFs0LCA4MF0NCiAgICBdDQp9');
insert into Articles(isPub, title, b64data) values (true, 'reg', 'ew0KICAidHlwZSI6ICJyZWciLA0KICAiZGF0YSI6IFsNCiAgICBbMC4wNjc3MzIsIDMuMTc2NTEzXSwNCiAgICBbMC40Mjc4MSwgMy44MTY0NjRdLA0KICAgIFswLjk5NTczMSwgNC41NTAwOTVdLA0KICAgIFswLjczODMzNiwgNC4yNTY1NzFdLA0KICAgIFswLjk4MTA4MywgNC41NjA4MTVdLA0KICAgIFswLjA0NTM1MywgMy4xNDMyNTldLA0KICAgIFswLjEyNjc2MiwgMy4xMTQyMDRdLA0KICAgIFswLjU1NjQ4NiwgMy44NTE0ODRdLA0KICAgIFswLjkwMTE0NCwgNC42MjE4OTldLA0KICAgIFswLjczMDU0NiwgNC4yMTM0MTJdLA0KICAgIFswLjQ5MzgyOSwgMy45MDg2ODVdLA0KICAgIFswLjI1NzAxNywgMy41ODU4MjFdLA0KICAgIFswLjgzMzczNSwgNC4zNzQzOTRdLA0KICAgIFswLjA3MDA5NSwgMy4yMTM4MTddLA0KICAgIFswLjUyNzA3LCAzLjk1MjY4MV0sDQogICAgWzAuMTE2MTYzLCAzLjEyOTI4M10NCiAgXQ0KfQ0K');
insert into Articles(isPub, title, b64data) values (true, 'pie', 'ew0KICAidHlwZSI6ICJwaWUiLA0KICAiZGF0YSI6IFsNCiAgICBbIuaQnOe0ouW8leaTjiIsIDEwNDhdLA0KICAgIFsi55u05o6l6K6/6ZeuIiwgNzM1XSwNCiAgICBbIumCruS7tuiQpemUgCIsIDU4MF0sDQogICAgWyLogZTnm5/lub/lkYoiLCA0ODRdLA0KICAgIFsi6KeG6aKR5bm/5ZGKIiwgMzAwXQ0KICBdDQp9DQo=');