update ID_G_ITEMS set G_ITEM_CODE = 'xxx' where G_ITEM_CODE = 'ggggg'


/* Ʈ���Ÿ� ����ϴ�. �׸��� ���� ID_G_ITEMS �� ��ǰ�ڵ带 ������Ʈ �մϴ�. ��. */
CREATE or replace trigger ITEM_CODE_UPDATE
after update of G_ITEM_CODE on ID_G_ITEMS for each row
begin
    update ID_G_INPUT_DATE
    set G_ITEM_CODE = :new.G_ITEM_CODE
    where G_ITEM_CODE = :old.G_ITEM_CODE;
    update ID_G_OUTPUT_DATE
    set G_ITEM_CODE = :new.G_ITEM_CODE
    where G_ITEM_CODE = :old.G_ITEM_CODE;
end;


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
