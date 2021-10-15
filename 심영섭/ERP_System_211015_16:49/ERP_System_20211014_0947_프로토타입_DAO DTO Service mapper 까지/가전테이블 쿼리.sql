
/*���� ���̺�*/
create table color(
color_code varchar2(20),
color_name varchar2(20) not null unique,
primary key(color_code)
);
/*�������Һ��� ���̺�*/
create table energy_grade(
energy_grade_code varchar2(20),
energy_grade_name varchar2(20) not null unique,
primary key(energy_grade_code)
);
/*�귣�� ���̺�*/
create table brand(
brand_code varchar2(20),
brand_name varchar2(20) not null unique,
primary key(brand_code)
);
/* ����/TV/�����/PC */
create table BO_ID_categories(
    category_code varchar2(20),
    category_name varchar2(20) not null,
    primary key(category_code)
);
/*���� ��з� ���̺�*/
create table BO_ID_Gcategory(
    category_code,
    Gcategory_code varchar2(20),
    Gcategory_name VARCHAR2(20) NOT NULL UNIQUE,
    PRIMARY KEY(Gcategory_code),
    foreign key(category_code) references BO_ID_categories(category_code)
);
/*��ǰ ���̺�*/
create table BO_ID_Gitems(
   thumbnail varchar2(200),
   Gcategory_code,
   category_code,
   brand_code,
   Gitem_code varchar2(20),
   Gitem_name varchar2(20) not null,
   build_day date,
   energy_grade_code,
   power_consum varchar2(20) not null,
   color_code,
   whatsize varchar(2),
   discontinued varchar2(10) default 'false',
   primary key(Gitem_code),
   foreign key(Gcategory_code) references BO_ID_Gcategory(Gcategory_code),
   foreign key(category_code) references BO_ID_categories(category_code),
   foreign key(brand_code) references brand(brand_code),
   foreign key(energy_grade_code) references energy_grade(energy_grade_code),
   foreign key(color_code) references color(color_code)
);
/* �԰��� ��¥ ���� ���̺� */
create table input_date (
    Gitem_code,
    input_date date not null,
    stock_in_cnt number(4) not null,
    foreign key(Gitem_code) references BO_ID_Gitems(Gitem_code)
);
/* ����� ��¥ ���� ���̺� */
create table output_date (
    Gitem_code,
    output_date date not null,
    stock_out_cnt number(4) not null,
    foreign key(Gitem_code) references BO_ID_Gitems(Gitem_code)
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
