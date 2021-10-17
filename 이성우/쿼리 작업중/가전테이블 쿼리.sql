
--==============================================================
-- ���� ���̺�.

/*���� ���̺�*/
create table color(
color_code varchar2(20),
color_name varchar2(200) not null unique,
primary key(color_code)
);
/*�������Һ��� ���̺�*/
create table energy_grade(
energy_grade_code varchar2(20),
energy_grade_name varchar2(200) not null unique,
primary key(energy_grade_code)
);
/*�귣�� ���̺�*/
create table brand(
brand_code varchar2(20),
brand_name varchar2(200) not null unique,
primary key(brand_code)
);

-- ��з�
/* ����/TV/�����/PC */
create table ID_categories(
    category_code varchar2(20),
    category_name varchar2(200) not null,
    primary key(category_code)
);
--=============================================================






/*���� �ߺз� ���̺�*/
create table ID_g_sub_category(
    category_code,
    g_sub_category_code varchar2(20),
    g_sub_category_name VARCHAR2(200) NOT NULL UNIQUE,
    PRIMARY KEY(g_sub_category_code),
    foreign key(category_code) references ID_categories(category_code)
);
/*���� �Һз� ���̺�*/
create table ID_g_sub_sub_category(
    g_sub_sub_category_code varchar2(50),
    g_sub_category_code,
    g_sub_sub_category_name varchar2(50) not null,
    primary key(g_sub_sub_category_code),
    foreign key(g_sub_category_code) references ID_g_sub_category(g_sub_category_code)
);
/*��ǰ ���̺�*/
create table ID_g_items(
   category_code,
   g_sub_category_code,
   g_sub_sub_category_code,
   brand_code,
   g_item_code varchar2(20),
   g_item_name varchar2(200) not null,
   g_build_day date,
   energy_grade_code,
   g_power_consum varchar2(20) not null,
   color_code,
   g_item_size_x number(5) default 0,
   g_item_size_y number(5) default 0,
   g_item_size_z number(5) default 0,
   g_discontinued varchar2(10) default 'false',
   g_pic varchar2(200),
   primary key(g_item_code),
   foreign key(g_sub_category_code) references ID_g_sub_category(g_sub_category_code),
   foreign key(category_code) references ID_categories(category_code),
   foreign key(brand_code) references brand(brand_code),
   foreign key(energy_grade_code) references energy_grade(energy_grade_code),
   foreign key(color_code) references color(color_code),
   foreign key(g_sub_sub_category_code) references ID_g_sub_sub_category(g_sub_sub_category_code)
);
/* �԰��� ��¥ ���� ���̺� */
create table ID_g_input_date (
    g_input_date_no number(5),
    g_item_code,
    g_input_date date not null,
    g_stock_in_cnt number(4) not null,
    primary key(g_input_date_no),
    foreign key(g_item_code) references ID_g_items(g_item_code)
);
/* ����� ��¥ ���� ���̺� */
create table ID_g_output_date (
    g_output_date_no number(5),
    g_item_code,
    g_output_date date not null,
    g_stock_out_cnt number(4) not null,
    primary key(g_output_date_no),
    foreign key(g_item_code) references ID_g_items(g_item_code)
);

drop table ID_g_output_date;
drop table ID_g_input_date;
drop table ID_g_items;
drop table ID_g_sub_sub_category ;
drop table ID_g_sub_category;
drop table ID_categories ;
drop table brand;
drop table color;
drop table energy_grade;


commit
rollback

select * from ID_g_items


-- ==========================================================
-- INSERT ����.

-- ��з� ī�װ� insert -----------
insert into ID_CATEGORIES (category_code, category_name) values(1,'����') ;
insert into ID_CATEGORIES (category_code, category_name) values(2,'TV')   ;
insert into ID_CATEGORIES (category_code, category_name) values(3,'PC')   ;
insert into ID_CATEGORIES (category_code, category_name) values(4,'�����');

select * from id_categories

commit

-- �ߺз� ī�װ� insert
insert into ID_G_SUB_CATEGORY (category_code, g_sub_category_code, g_sub_category_name) values(1,1,'��������') ;
insert into ID_G_SUB_CATEGORY (category_code, g_sub_category_code, g_sub_category_name) values(1,2,'�ֹ氡��') ;
insert into ID_G_SUB_CATEGORY (category_code, g_sub_category_code, g_sub_category_name) values(1,3,'��Ȱ����') ;

select * from ID_G_SUB_CATEGORY

commit

-- �Һз� ī�װ� insert
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(1,1,'������') ;
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(1,2,'����û��') ;
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(1,3,'������') ;

insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(2,4,'�����') ;
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(2,5,'������') ;
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(2,6,'���������̾�') ;

insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(3,7,'��Ź��') ;
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(3,8,'������') ;
insert into ID_G_SUB_SUB_CATEGORY (g_sub_category_code, g_sub_sub_category_code, g_sub_sub_category_name) values(3,9,'û�ұ�') ;

select * from ID_G_SUB_SUB_CATEGORY

commit

-- ������ ȿ����� insert

insert into energy_grade (energy_grade_code, energy_grade_name) values(1,'1���') ;
insert into energy_grade (energy_grade_code, energy_grade_name) values(2,'2���') ;
insert into energy_grade (energy_grade_code, energy_grade_name) values(3,'3���') ;
insert into energy_grade (energy_grade_code, energy_grade_name) values(4,'4���') ;
insert into energy_grade (energy_grade_code, energy_grade_name) values(5,'5���') ;

select * from energy_grade

commit

-- �귣�� insert

insert into brand (brand_code, brand_name) values(1,'�Ｚ����');
insert into brand (brand_code, brand_name) values(2,'LG����');
insert into brand (brand_code, brand_name) values(3,'ĳ����');
insert into brand (brand_code, brand_name) values(4,'���ϾƵ�ä');
insert into brand (brand_code, brand_name) values(5,'�ļ���');
insert into brand (brand_code, brand_name) values(6,'���н�');
insert into brand (brand_code, brand_name) values(7,'ȫ����ũ');
insert into brand (brand_code, brand_name) values(8,'���ϸƽ�');
insert into brand (brand_code, brand_name) values(9,'��������');
insert into brand (brand_code, brand_name) values(10,'������');
insert into brand (brand_code, brand_name) values(11,'ĳ�ν�');
insert into brand (brand_code, brand_name) values(12,'��������');
insert into brand (brand_code, brand_name) values(13,'�Ե����̸�Ʈ');
insert into brand (brand_code, brand_name) values(14,'��Ÿ����');
insert into brand (brand_code, brand_name) values(15,'����');
insert into brand (brand_code, brand_name) values(16,'��þ');
insert into brand (brand_code, brand_name) values(17,'PNǳ��');
insert into brand (brand_code, brand_name) values(18,'���ض�');
insert into brand (brand_code, brand_name) values(19,'422');
insert into brand (brand_code, brand_name) values(20,'�̸�Ʈ');
insert into brand (brand_code, brand_name) values(21,'����');
insert into brand (brand_code, brand_name) values(22,'����');
insert into brand (brand_code, brand_name) values(23,'������̵�');
insert into brand (brand_code, brand_name) values(24,'��������');
insert into brand (brand_code, brand_name) values(25,'�������');
insert into brand (brand_code, brand_name) values(26,'���');
insert into brand (brand_code, brand_name) values(27,'�����ڸ���');
insert into brand (brand_code, brand_name) values(28,'���Ϸ�');
insert into brand (brand_code, brand_name) values(29,'Űģ��Ʈ');
insert into brand (brand_code, brand_name) values(30,'�߻깰��');

insert into brand (brand_code, brand_name) values(31,'���Ͼ�����');
insert into brand (brand_code, brand_name) values(32,'�̵��');
insert into brand (brand_code, brand_name) values(33,'���̽�');

insert into brand (brand_code, brand_name) values(34,'����');
insert into brand (brand_code, brand_name) values(35,'�����');
insert into brand (brand_code, brand_name) values(36,'��Ŭ��Ʈ');
insert into brand (brand_code, brand_name) values(37,'��Ŭ');
insert into brand (brand_code, brand_name) values(38,'CHUWI');
insert into brand (brand_code, brand_name) values(39,'��������');
insert into brand (brand_code, brand_name) values(40,'�Ƹ���');
insert into brand (brand_code, brand_name) values(41,'HP');
insert into brand (brand_code, brand_name) values(42,'�Ѽ�');
insert into brand (brand_code, brand_name) values(43,'DELL');
insert into brand (brand_code, brand_name) values(44,'ASUS');
insert into brand (brand_code, brand_name) values(45,'MSI');
insert into brand (brand_code, brand_name) values(46,'�Ѽ���ǻ��');
insert into brand (brand_code, brand_name) values(47,'ACER');
insert into brand (brand_code, brand_name) values(48,'�ͻ�����');
insert into brand (brand_code, brand_name) values(49,'�̳뽺');
insert into brand (brand_code, brand_name) values(50,'TNM');
insert into brand (brand_code, brand_name) values(51,'��Ƽ��');


select * from brand

commit

--�������� - ������
�Ｚ����
LG����
ĳ����
���ϾƵ�ä
�ļ���

-- �������� - ����û��
LG����
�Ｚ����
���н�
���ϾƵ�ä

--�������� - ������
ȫ����ũ
���ϸƽ�
��������
������
ĳ�ν�
��������

--�ֹ氡�� - �����
LG����
�Ｚ����
ĳ����
���ϾƵ�ä
�Ե����̸�Ʈ
��Ÿ����

--�ֹ氡�� - ������
����
��þ
PNǳ��
���ϾƵ�ä

--�ֹ氡�� - ���������̾�
���ض�
422
�̸�Ʈ
����
����
����
������̵�
��������
�������
���
�����ڸ���
���Ϸ�
Űģ��Ʈ
�߻깰��

-- ��Ȱ���� - ��Ź��
�̵��
-- ��Ȱ���� - ������
���Ͼ�����
-- ��Ȱ���� - û�ұ�
���̽�

--tv pc ����� �߰� �귣��
����
�����
��Ŭ��Ʈ
��Ŭ
CHUWI
��������
�Ƹ���
HP
�Ѽ�
DELL
ASUS
MSI
�Ѽ���ǻ��
ACER
�ͻ�����
�̳뽺
TNM
��Ƽ��






-- �÷� insert

insert into color (color_code, color_name) values(1,'���ȭ��Ʈ');
insert into color (color_code, color_name) values(2,'new NFD Gray');
insert into color (color_code, color_name) values(3,'ȭ��Ʈ');
insert into color (color_code, color_name) values(4,'��Żȭ��Ʈ');
insert into color (color_code, color_name) values(5,'���� ĵ�������');
insert into color (color_code, color_name) values(6,'Serene Green');
insert into color (color_code, color_name) values(7,'���������');
insert into color (color_code, color_name) values(8,'�θ�ƽ����');
insert into color (color_code, color_name) values(9,'ī�ֺ�����');
insert into color (color_code, color_name) values(10,'ī�ֱ׸�');
insert into color (color_code, color_name) values(11,'Ŭ��ȭ��Ʈ');
insert into color (color_code, color_name) values(12,'ũ���̽����');
insert into color (color_code, color_name) values(13,'���̾�׷���');
insert into color (color_code, color_name) values(14,'��ũƼ��');
insert into color (color_code, color_name) values(15,'����Ż����');
insert into color (color_code, color_name) values(16,'����ó�׸�');
insert into color (color_code, color_name) values(17,'�ǹ�');
insert into color (color_code, color_name) values(18,'�׷���');
insert into color (color_code, color_name) values(19,'������');
insert into color (color_code, color_name) values(20,'��Ʈ�׸�');
insert into color (color_code, color_name) values(21,'��Ÿ�׸�');
insert into color (color_code, color_name) values(22,'����Ʈ ������');
insert into color (color_code, color_name) values(23,'ǻ�� ȭ��Ʈ');
insert into color (color_code, color_name) values(24,'����');
insert into color (color_code, color_name) values(25,'���̸�Ż');
insert into color (color_code, color_name) values(26,'ȭ��Ʈ��');

insert into color (color_code, color_name) values(27,'���̴ϴ��̾ƺ�');
insert into color (color_code, color_name) values(28,'�۷�������');
insert into color (color_code, color_name) values(29,'���ݴ�ũ�׷���');
insert into color (color_code, color_name) values(30,'������ǹ�');
insert into color (color_code, color_name) values(31,'��Ż');
insert into color (color_code, color_name) values(32,'��ġ���');
insert into color (color_code, color_name) values(33,'��');
insert into color (color_code, color_name) values(34,'����Ű�׷���');
insert into color (color_code, color_name) values(35,'�ø���׸�');
insert into color (color_code, color_name) values(36,'��������θ���');
insert into color (color_code, color_name) values(37,'���ɺ��');
insert into color (color_code, color_name) values(38,'�̳콺');
insert into color (color_code, color_name) values(39,'�󺥴��׷���');
insert into color (color_code, color_name) values(40,'�̵������ǹ�');
insert into color (color_code, color_name) values(41,'�������θ���');
insert into color (color_code, color_name) values(42,'�̵��');
insert into color (color_code, color_name) values(43,'����ǹ�');
insert into color (color_code, color_name) values(44,'�̵�׷���');
insert into color (color_code, color_name) values(45,'�׸�');
insert into color (color_code, color_name) values(46,'���');
insert into color (color_code, color_name) values(47,'����');
insert into color (color_code, color_name) values(48,'���ǵ�');
insert into color (color_code, color_name) values(49,'����');
insert into color (color_code, color_name) values(50,'���ο�');

insert into color (color_code, color_name) values(51,'���� ��');
insert into color (color_code, color_name) values(52,'���� �׸�');
insert into color (color_code, color_name) values(53,'���� �ǹ�');
insert into color (color_code, color_name) values(54,'ũ��');
insert into color (color_code, color_name) values(55,'�󺥴�');
insert into color (color_code, color_name) values(56,'���� �׷���');
insert into color (color_code, color_name) values(57,'���� ��ũ');
insert into color (color_code, color_name) values(58,'���� ���̿÷�');
insert into color (color_code, color_name) values(59,'���� ȭ��Ʈ');
insert into color (color_code, color_name) values(60,'�̽�ƽ ��');
insert into color (color_code, color_name) values(61,'�̽�ƽ �����');
insert into color (color_code, color_name) values(62,'Ŭ����� �󺥴�');
insert into color (color_code, color_name) values(63,'Ŭ���� ���̺�');
insert into color (color_code, color_name) values(64,'Ŭ���� ��Ʈ');
insert into color (color_code, color_name) values(65,'Ŭ���� ����');
insert into color (color_code, color_name) values(66,'Ŭ���� ȭ��Ʈ');
insert into color (color_code, color_name) values(67,'���');
insert into color (color_code, color_name) values(68,'��ũ');
insert into color (color_code, color_name) values(69,'�۽��� ���');
insert into color (color_code, color_name) values(70,'�����̽� �׷���');
insert into color (color_code, color_name) values(71,'�ƽ�Ʈ�� ��');
insert into color (color_code, color_name) values(72,'��Ż�� �ǹ�');
insert into color (color_code, color_name) values(73,'������Ʈ Ƽź');
insert into color (color_code, color_name) values(74,'������ ȭ��Ʈ');
insert into color (color_code, color_name) values(75,'���ζ� ��');
insert into color (color_code, color_name) values(76,'����� ȭ��Ʈ');
insert into color (color_code, color_name) values(77,'�̷� Ƽź');
insert into color (color_code, color_name) values(78,'�̷� ����');
insert into color (color_code, color_name) values(79,'���ζ� ȭ��Ʈ');
insert into color (color_code, color_name) values(80,'���ζ� �׷���');
insert into color (color_code, color_name) values(81,'���ζ� �׸�');
insert into color (color_code, color_name) values(82,'�Ϸ��� ����');
insert into color (color_code, color_name) values(83,'�� ���ζ� ��');
insert into color (color_code, color_name) values(84,'�� ���ĭ ��');
insert into color (color_code, color_name) values(85,'ī�� ����');
insert into color (color_code, color_name) values(86,'�� ���ĭ ���');
insert into color (color_code, color_name) values(87,'�̵峪��Ʈ �׷���');
insert into color (color_code, color_name) values(88,'���� ȭ��Ʈ');
insert into color (color_code, color_name) values(89,'������Ʈ �׸�');
insert into color (color_code, color_name) values(90,'���н� ��');
insert into color (color_code, color_name) values(91,'��Ʈ');
insert into color (color_code, color_name) values(92,'��� ȭ��Ʈ');
insert into color (color_code, color_name) values(93,'���н� �׷���');
insert into color (color_code, color_name) values(94,'�۷��þ� ���');
insert into color (color_code, color_name) values(95,'�׶���Ʈ �����');
insert into color (color_code, color_name) values(96,'������Ʈ �׷���');
insert into color (color_code, color_name) values(97,'������');
insert into color (color_code, color_name) values(98,'�󾾰��');
insert into color (color_code, color_name) values(99,'���α׷���');
insert into color (color_code, color_name) values(100,'�����');
insert into color (color_code, color_name) values(101,'��ũ�ǹ�');
insert into color (color_code, color_name) values(102,'��Ʈ���� �׷���');
insert into color (color_code, color_name) values(103,'��Ŭ���� �׷���');
insert into color (color_code, color_name) values(104,'��Ŭ�����ǹ�');
insert into color (color_code, color_name) values(105,'�����θ�����ƿ');
insert into color (color_code, color_name) values(106,'Ÿ��ź��');
insert into color (color_code, color_name) values(107,'����ư�̵峪��');
insert into color (color_code, color_name) values(108,'���̴� ���ǾƳ�');
insert into color (color_code, color_name) values(109,'���̴�ǻ��');
insert into color (color_code, color_name) values(110,'�׷��� ��');
insert into color (color_code, color_name) values(111,'Ŭ���̺���+������');
insert into color (color_code, color_name) values(112,'�׸� �ǹ�');
insert into color (color_code, color_name) values(113,'�����');
insert into color (color_code, color_name) values(114,'��Ÿ �� �׸�');
insert into color (color_code, color_name) values(115,'�۷�ȭ��Ʈ �۷���ũ');
insert into color (color_code, color_name) values(116,'�۷���ƾ');
insert into color (color_code, color_name) values(117,'����Ͻǹ�');
insert into color (color_code, color_name) values(118,'��ƾ������ ��ƾ����');
insert into color (color_code, color_name) values(119,'������Ʈ�̳콺');
insert into color (color_code, color_name) values(120,'���߷�');
insert into color (color_code, color_name) values(121,'�����Ż');
insert into color (color_code, color_name) values(122,'��Ʋ��');
insert into color (color_code, color_name) values(123,'�ǹ���Ż');
insert into color (color_code, color_name) values(124,'���ε�ǹ�');
insert into color (color_code, color_name) values(125,'�׷���ǹ�');
insert into color (color_code, color_name) values(126,'��Ʈ�׸�');
insert into color (color_code, color_name) values(127,'��ũŸ��ź�ǹ�');
insert into color (color_code, color_name) values(128,'��ݱ׷���');
insert into color (color_code, color_name) values(129,'��Ʈȭ��Ʈ');
insert into color (color_code, color_name) values(130,'�÷�Ƽ������');
insert into color (color_code, color_name) values(131,'�̳콺�ǹ�');
insert into color (color_code, color_name) values(132,'��ƾ����Ʈ������');
insert into color (color_code, color_name) values(133,'��Ż���׷���');
insert into color (color_code, color_name) values(134,'���ǹ�');
insert into color (color_code, color_name) values(135,'���庣����');
insert into color (color_code, color_name) values(136,'�̵��');
insert into color (color_code, color_name) values(137,'�̵������ǹ�');

select * from color

commit

--==============================================================================


-- �׽�Ʈ ����
delete from color where color_code = 4
drop table color

-- �������� - ������
���ȭ��Ʈ
new NFD Gray
ȭ��Ʈ
��Żȭ��Ʈ
���� ĵ�������
Serene Green
���������
�θ�ƽ����
ī�ֺ�����
ī�ֱ׸�
Ŭ��ȭ��Ʈ

-- �������� -����û����
ũ���̽����
���̾�׷���
��ũƼ��
����Ż����
����ó�׸�
�ǹ�
�׷���
������

��Ʈ�׸�
��Ÿ�׸�
����Ʈ ������
ǻ�� ȭ��Ʈ

-- �������� - ������
����
���̸�Ż
ȭ��Ʈ��


-- �Ʒ��� �߰��ؾߵ�

-- �ֹ氡�� - �����
���̴ϴ��̾ƺ�
�۷�������
���ݴ�ũ�׷���
������ǹ�
��Ż
��Ż

-- �ֹ氡�� - ������
��ġ���
�ǹ�
�ǹ�
��

-- �ֹ氡�� - ���������̾�
����Ű�׷���
��
��Ż
������
��
ȭ��Ʈ
�ǹ�
��
��
�ø���׸�
ȭ��Ʈ
��
��
��

-- ��Ȱ���� - ������
ȭ��Ʈ
ȭ��Ʈ
ȭ��Ʈ
��������θ���

-- ��Ȱ���� - ��Ź��
ȭ��Ʈ
�׷���
���ɺ��
�̳콺
�󺥴��׷���
�̵��
�̵������ǹ�
�̵������ǹ�
�������θ���
��������θ���
�̵��
����ǹ�
�̵�׷���
�ǹ�

-- ��Ȱ���� -û�ұ�
�׷���
�׸�
��
���
����
�ǹ�
����
���ǵ�
����
���ο�
ȭ��Ʈ

--tv pc ����� �߰� �÷�
���� ��
���� �׸�
���� �ǹ�
ũ��
�󺥴�
���� �׷���
���� ��ũ
���� ���̿÷�
���� ȭ��Ʈ
�̽�ƽ ��
�̽�ƽ �����
Ŭ����� �󺥴�
Ŭ���� ���̺�
Ŭ���� ��Ʈ
Ŭ���� ����
Ŭ���� ȭ��Ʈ
���
��ũ
�۽��� ���
�����̽� �׷���
�ƽ�Ʈ�� ��
��Ż�� �ǹ�
������Ʈ Ƽź
������ ȭ��Ʈ
���ζ� ��
����� ȭ��Ʈ
�̷� Ƽź
�̷� ����
���ζ� ȭ��Ʈ
���ζ� �׷���
���ζ� �׸�
�Ϸ��� ����
�� ���ζ� ��
�� ���ĭ ��
ī�� ����
�� ���ĭ ���
�̵峪��Ʈ �׷���
���� ȭ��Ʈ
������Ʈ �׸�
���н� ��
��Ʈ
��� ȭ��Ʈ
���н� �׷���
�۷��þ� ���
�׶���Ʈ �����
������Ʈ �׷���
������
�󾾰��
���α׷���
�����
��ũ�ǹ�
��Ʈ���� �׷���
��Ŭ���� �׷���
��Ŭ�����ǹ�
�����θ�����ƿ
Ÿ��ź��
����ư�̵峪��
���̴� ���ǾƳ�
���̴�ǻ��
�׷��� ��
Ŭ���̺���+������
�׸� �ǹ�
�����
��Ÿ �� �׸�
�۷�ȭ��Ʈ �۷���ũ
�۷���ƾ
����Ͻǹ�
��ƾ������ ��ƾ����
������Ʈ�̳콺
���߷�
�����Ż

��Ʋ��
�ǹ���Ż
���ε�ǹ�
�׷���ǹ�
��Ʈ�׸�
��ũŸ��ź�ǹ�
��ݱ׷���
��Ʈȭ��Ʈ
�÷�Ƽ������
�̳콺�ǹ�
��ƾ����Ʈ������
��Ż���׷���
���ǹ�
���庣����
�̵��
�̵������ǹ�


-- =================
-- �׽�Ʈ�� ����

select * from BO_ID_G_ITEMS
select * from color
select * from energy_grade
select * from brand

SELECT * FROM BO_ID_G_ITEMS BOI, COLOR C, BRAND B WHERE BOI.COLOR_CODE = C.COLOR_CODE AND B.BRAND_CODE = BOI.BRAND_CODE
SELECT * FROM  BO_ID_CATEGORies
SELECT * FROM  BO_ID_G_SUB_CATEGORY
SELECT * FROM  BO_ID_G_SUB_SUB_CATEGORY


select * from brand

DELETE FROM BO_ID_G_ITEMS WHERE G_SUB_CATEGORY_CODE = 1

COMMIT
