/* ī�װ� �������� ���� */

select * from ID_CATEGORIES

select * from ID_G_SUB_CATEGORY where CATEGORY_CODE = 1

select * from ID_G_SUB_SUB_CATEGORY where G_SUB_CATEGORY_CODE = 1

/* ���� ī�װ����� ������ �ִ� �귣�� / �÷� �������� ����                       �� ���⿡ �߰� ����(ī�װ�)�� ���� �˴ϴ�.*/
select * from brand where brand_code in (select brand_code from ID_G_ITEMS where category_code = 1 group by(brand_code))
select * from color where color_code in (select color_code from ID_G_ITEMS where category_code = 1 group by(color_code))


