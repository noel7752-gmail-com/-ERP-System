/*���� �Һз� ���̺�*/
CREATE TABLE gajun_smallCategories(
    small_categori_code varchar2(20),
    small_categori_name VARCHAR2(20) NOT NULL UNIQUE,
    PRIMARY KEY(small_categori_code)
);
/*���� ��з� ���̺�*/
create table gajun_bigCategories(
    big_categori_code varchar2(20),
    big_categori_name VARCHAR2(20) NOT NULL UNIQUE,
    small_categori1,
    small_categori2,
    small_categori3,
    PRIMARY KEY(big_categori_code),
    foreign key(small_categori1) references gajun_smallCategories(small_categori_code),
    foreign key(small_categori2) references gajun_smallCategories(small_categori_code),
    foreign key(small_categori3) references gajun_smallCategories(small_categori_code)
)
/* ���� ���̺�(ǰ��) */
create table gajun(
    gajun_code varchar2(20),
    gajun_big_categori_code,
    primary key(gajun_code),
    foreign key(gajun_big_categori_code) references gajun_bigCategories(big_categori_code)
)
/*���� ���̺�*/
create table color(
color_code varchar2(20),
color_name varchar2(20) not null unique,
primary key(color_code)
);
/*�������Һ��� ���̺�*/
create table MEPS(
MEPS_code varchar2(20),
MEPS_rating varchar2(20) not null unique,
primary key(MEPS_code)
);
/*�귣�� ���̺�*/
create table brand(
brand_code varchar2(20),
brand_name varchar2(20) not null unique,
primary key(brand_code)
);
/*��ǰ ���̺�*/
create table gajun_items(
   big_categori_code,
   small_categori_code,
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
   foreign key(small_categori_code) references gajun_smallCategories(small_categori_code),
   foreign key(brand_code) references brand(brand_code),
   foreign key(MEPS_code) references MEPS(MEPS_code),
   foreign key(color_code) references color(color_code),
   foreign key(big_categori_code) references gajun_bigCategories(big_categori_code)
);
commit
rollback
drop table      gajun
drop table gajun_bigCategories
drop table gajun_smallCategories
drop table gajun_items

