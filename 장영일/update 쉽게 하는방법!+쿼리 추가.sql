CREATE or replace trigger G_ITEM_CODE_UPDATE
after update of G_ITEM_CODE on ID_G_ITEMS for each row
begin
    update ID_G_INPUT_DATE
    set G_ITEM_CODE = :new.G_ITEM_CODE
    where G_ITEM_CODE = :old.G_ITEM_CODE;
    update ID_G_OUTPUT_DATE
    set G_ITEM_CODE = :new.G_ITEM_CODE
    where G_ITEM_CODE = :old.G_ITEM_CODE;
end;
--------------------------------------------------------------------------------------
CREATE or replace trigger T_ITEM_CODE_UPDATE
after update of T_ITEM_CODE on ID_T_ITEMS for each row
begin
    update ID_T_INPUT_DATE
    set T_ITEM_CODE = :new.T_ITEM_CODE
    where T_ITEM_CODE = :old.T_ITEM_CODE;
    update ID_T_OUTPUT_DATE
    set T_ITEM_CODE = :new.T_ITEM_CODE
    where T_ITEM_CODE = :old.T_ITEM_CODE;
end;
--------------------------------------------------------------------------------------
CREATE or replace trigger P_ITEM_CODE_UPDATE
after update of P_ITEM_CODE on ID_P_ITEMS for each row
begin
    update ID_P_INPUT_DATE
    set P_ITEM_CODE = :new.P_ITEM_CODE
    where P_ITEM_CODE = :old.P_ITEM_CODE;
    update ID_P_OUTPUT_DATE
    set P_ITEM_CODE = :new.P_ITEM_CODE
    where P_ITEM_CODE = :old.P_ITEM_CODE;
end;
--------------------------------------------------------------------------------------
CREATE or replace trigger M_ITEM_CODE_UPDATE
after update of M_ITEM_CODE on ID_M_ITEMS for each row
begin
    update ID_M_INPUT_DATE
    set M_ITEM_CODE = :new.M_ITEM_CODE
    where M_ITEM_CODE = :old.M_ITEM_CODE;
    update ID_M_OUTPUT_DATE
    set M_ITEM_CODE = :new.M_ITEM_CODE
    where M_ITEM_CODE = :old.M_ITEM_CODE;
end;
--------------------------------------------------------------------------------------
/* ������� �ܾ �����ϸ� ���Դϴ� */





/* Ʈ���� ����

    ���� �ڼ��Ѱ��� �𸣰� �����ؿԽ��ϴ�.
    ITEM_CODE_UPDATE ��� �̸����� trigger�� ����,
    �� Ʈ���Ŵ� ID_G_ITEMS ���̺� G_ITEM_CODE �� update �� �� ����˴ϴ�.
    ����
        ���� input_date ���̺� ��ǰ�ڵ尡 �����Ŷ�� ��� �ٲ� �� ���� �־���.
        ���� output_date ���̺� ��ǰ�ڵ尡 �����Ŷ�� ��� �ٲ� �� ���� �־���.
    ��
 */

drop trigger ITEM_CODE_UPDATE
commit
rollback

update ID_G_ITEMS set G_ITEM_CODE = 'iuoy1' where G_ITEM_CODE = 'iuoy'

select * from ID_G_ITEMS where g_item_code ='iuoy'
select * from ID_G_INPUT_DATE where g_item_code ='iuoy'
select * from ID_G_OUTPUT_DATE where g_item_code ='iuoy'

select * from ID_G_ITEMS where g_item_code ='iuoy1'
select * from ID_G_INPUT_DATE where g_item_code ='iuoy1'
select * from ID_G_OUTPUT_DATE where g_item_code ='iuoy1'

select * from ID_M_ITEMS where M_item_code = '?A2633'

update ID_M_ITEMS set m_ITEM_CODE = 'A2633gg' where m_ITEM_CODE = '?A2633'

