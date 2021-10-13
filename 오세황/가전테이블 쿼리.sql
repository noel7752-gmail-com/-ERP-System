
/*색상 테이블*/
create table color(
color_code varchar2(20),
color_name varchar2(20) not null unique,
primary key(color_code)
);
/*에너지소비등급 테이블*/
create table MEPS(
MEPS_code varchar2(20),
MEPS_rating varchar2(20) not null unique,
primary key(MEPS_code)
);
/*브랜드 테이블*/
create table brand(
brand_code varchar2(20),
brand_name varchar2(20) not null unique,
primary key(brand_code)
);
/*가전 소분류 테이블*/
CREATE TABLE BO_ID_gajun_semicategory(
    gajun_semicategory_code varchar2(20),
    gajun_semicategory_name VARCHAR2(20) NOT NULL UNIQUE,
    PRIMARY KEY(gajun_semicategory_code)
);
/* itemsTable */
create table BO_ID_categories(
    category_code varchar2(20),
    category_name varchar2(20) not null,
    primary key(category_code)
);
/*가전 대분류 테이블*/
create table BO_ID_gajun_category(
    category_code,
    gajun_category_code varchar2(20),
    gajun_category_name VARCHAR2(20) NOT NULL UNIQUE,
    gajun_semicategory1,
    gajun_semicategory2,
    gajun_semicategory3,
    PRIMARY KEY(gajun_category_code),
    foreign key(gajun_semicategory1) references BO_ID_gajun_semicategory(gajun_semicategory_code),
    foreign key(gajun_semicategory2) references BO_ID_gajun_semicategory(gajun_semicategory_code),
    foreign key(gajun_semicategory3) references BO_ID_gajun_semicategory(gajun_semicategory_code),
    foreign key(category_code) references BO_ID_categories(category_code)
);
/*제품 테이블*/
create table BO_ID_gajun_items(
   pic varchar2(200),
   gajun_category_code,
   gajun_semicategory,
   brand_code,
   item_code varchar2(20),
   item_name varchar2(20) not null,
   input_day date default sysdate,
   output_day date,
   build_day date,
   MEPS_code,
   power_consum varchar2(20) not null,
   color_code,
   stock number(4) default 0,
   whatsize varchar(2),
   discontinued varchar2(10) default 'false',
   primary key(item_code),
   foreign key(gajun_semicategory) references BO_ID_gajun_semicategory(gajun_semicategory_code),
   foreign key(brand_code) references brand(brand_code),
   foreign key(MEPS_code) references MEPS(MEPS_code),
   foreign key(color_code) references color(color_code),
   foreign key(gajun_category_code) references BO_ID_gajun_category(gajun_category_code)
);



drop table BO_ID_brand;
drop table BO_ID_MEPS;
drop table BO_ID_color;
drop table BO_ID_gajun_items ;
drop table BO_ID_gajun_category;
drop table BO_ID_categories ;
drop table BO_ID_gajun_semicategory;


commit
rollback

select * from BO_ID_gajun_items
