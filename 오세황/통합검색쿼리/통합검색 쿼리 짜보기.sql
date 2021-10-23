select items.* from





(



select sortedTable.*, rownum "RNUM"  from


(
select * from

(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS   /* ��� ������ǰ ���̺� ���̱� */
) g1 inner join
(
select G_INPUT_DATE, G_ITEM_CODE from (select * from ID_G_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_M_INPUT_DATE ) group by G_ITEM_CODE
)

order by G_ITEM_REG_DATE  /* ���⼭ ������ ����.*/
) sortedTable

where
rownum <= 100   /*<![CDATA[rownum <= ${selectPageNo*rowCntPerPage}]]> */
/*===================================================================*/
/*�˻����� ���� �ڸ� �Դϴ�.*/
/*===================================================================*/
/* ��ǰNAME �˻� ���� */
 and
 sortedTable.G_ITEM_NAME like '%${G_ITEM_NAME}%'
 /* ��ǰCODE �˻� ���� */
 and
 sortedTable.G_ITEM_CODE like '%${G_ITEM_CODE}%'
 /* ��ǰǰ�� �˻� ���� */
 and
 sortedTable.CATEGORY_CODE = ${CATEGORY_CODE}
 /* ��ǰ����ǰ�� �˻� ���� */
 and
 sortedTable.G_SUB_CATEGORY_CODE = ${G_SUB_CATEGORY_CODE}
 /* ��ǰ����ǰ��2 �˻� ���� */
 and
 sortedTable.G_SUB_SUB_CATEGORY_CODE = ${G_SUB_SUB_CATEGORY_CODE}
 /* ���� �˻� ���� */
 and
 sortedTable.COLOR_CODE = ${COLOR_CODE}
 /* �귣�� �˻� ���� */
 and
 sortedTable.BRAND_CODE = ${BRAND_CODE}
 /* ������ �Һ��� �˻� ���� */
 and
 sortedTable.ENERGY_GRADE_CODE = ${ENERGY_GRADE_CODE}
 /* ������ �˻� ���� */
 and
 (
 /*������ first �� ������ */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) > TO_NUMBER(${first_build_day_year}${first_build_day_month})
 /* ������ first, last �Ѵ� ������ */
 and
 /* ������ lasta �� ������ */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) < TO_NUMBER(${last_build_day_year}${last_build_day_month})
 )





) items /*inner join*/



/*===================================================================*/
/*===================================================================*/
/*��� �������� �� ������ �������� ���̺��Դϴ�. (�� ������ ������ȣ ����)
(
select count(*) "TOTCNT" from

(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS
)
) totalcnt
 on
 1=1
===================================================================*/
/*===================================================================*/

 where
  items.RNUM >= 1     /* <![CDATA[items.RNUM >= ${(selectPageNo*rowCntPerPage)-rowCntPerPage+1}]]> */







  SELECT count(*) "TOTCNT", TO_CHAR(G_INPUT_DATE,'yyyy') "YEAR" FROM id_g_input_date group by TO_CHAR(G_INPUT_DATE,'yyyy')