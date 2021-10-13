
/*색상 테이블*/
create table color(
color_code varchar2(20),
color_name varchar2(20) not null unique,
primary key(color_code)
);
/*에너지소비등급 테이블*/
create table energy_grade(
energy_grade_code varchar2(20),
energy_grade_name varchar2(20) not null unique,
primary key(energy_grade_code)
);
/*브랜드 테이블*/
create table brand(
brand_code varchar2(20),
brand_name varchar2(20) not null unique,
primary key(brand_code)
);
/* 가전/TV/모바일/PC */
create table BO_ID_categories(
    category_code varchar2(20),
    category_name varchar2(20) not null,
    primary key(category_code)
);
/*가전 대분류 테이블*/
create table BO_ID_g_sub_category(
    category_code,
    g_sub_category_code varchar2(20),
    g_sub_category_name VARCHAR2(20) NOT NULL UNIQUE,
    PRIMARY KEY(g_sub_category_code),
    foreign key(category_code) references BO_ID_categories(category_code)
);
/*제품종류*/
create table BO_ID_g_sub_sub_category(
    g_sub_sub_category_code varchar2(50),
    g_sub_category_code,
    g_sub_sub_category_name varchar2(50) not null,
    primary key(g_sub_sub_category_code),
    foreign key(g_sub_category_code) references BO_ID_g_sub_category(g_sub_category_code)
);
/*제품 테이블*/
create table BO_ID_g_items(
   pic varchar2(200),
   g_sub_category_code,
   g_sub_sub_category_code,
   category_code,
   brand_code,
   g_item_code varchar2(20),
   g_item_name varchar2(20) not null,
   build_day date,
   energy_grade_code,
   power_consum varchar2(20) not null,
   color_code,
   g_item_sizex number(5) default 0,
   g_item_sizey number(5) default 0,
   g_item_sizez number(5) default 0,
   discontinued varchar2(10) default 'false',
   primary key(g_item_code),
   foreign key(g_sub_category_code) references BO_ID_g_sub_category(g_sub_category_code),
   foreign key(category_code) references BO_ID_categories(category_code),
   foreign key(brand_code) references brand(brand_code),
   foreign key(energy_grade_code) references energy_grade(energy_grade_code),
   foreign key(color_code) references color(color_code),
   foreign key(g_sub_sub_category_code) references BO_ID_g_sub_sub_category(g_sub_sub_category_code)
);
/* 입고일 날짜 저장 테이블 */
create table BO_ID_input_date (
    input_date_no number(5),
    g_item_code,
    input_date date not null,
    stock_in_cnt number(4) not null,
    primary key(input_date_no),
    foreign key(g_item_code) references BO_ID_g_items(g_item_code)
);
/* 출고일 날짜 저장 테이블 */
create table BO_ID_output_date (
    output_date_no number(5),
    g_item_code,
    output_date date not null,
    stock_out_cnt number(4) not null,
    primary key(output_date_no),
    foreign key(g_item_code) references BO_ID_g_items(g_item_code)
);

drop table BO_ID_output_date;
drop table BO_ID_input_date;
drop table BO_ID_g_items;
drop table BO_ID_g_sub_sub_category ;
drop table BO_ID_g_sub_category;
drop table BO_ID_categories ;


commit
rollback

select * from BO_ID_gajun_items
