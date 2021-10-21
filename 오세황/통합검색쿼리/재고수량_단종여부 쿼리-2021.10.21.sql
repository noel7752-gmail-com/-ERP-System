/* �������� 0�� �ֵ� & �������� */

/* where ���� ���� �߰�. <-- ������ �δ��� ���� */
select
items.*
from
ID_G_ITEMS items
where
items.G_DISCONTINUED = 'false'
or
((select nvl(sum(G_STOCK_IN_CNT),0) from ID_G_INPUT_DATE indate where indate.G_ITEM_CODE = G_ITEM_CODE)-(select nvl(sum(G_STOCK_OUT_CNT),0) from ID_G_OUTPUT_DATE outdate where outdate.G_ITEM_CODE = G_ITEM_CODE)) = 1



/*ansi ��� inner join ���� ���̺��� �߰� ������ �δ��� ���� */
/* inday ���̺�� outday ���̺��� CNT ���� ���� ������*/
select items.*, inday.*, outday.* from
ID_G_ITEMS items inner join
(select nvl(sum(G_STOCK_IN_CNT),0), G_ITEM_CODE from ID_G_INPUT_DATE group by G_ITEM_CODE) inday on inday.G_ITEM_CODE = items.G_ITEM_CODE inner join
(select nvl(sum(G_STOCK_OUT_CNT),0), G_ITEM_CODE from ID_G_OUTPUT_DATE group by G_ITEM_CODE) outday on outday.G_ITEM_CODE = items.G_ITEM_CODE
where
items.G_DISCONTINUED = 'true'



