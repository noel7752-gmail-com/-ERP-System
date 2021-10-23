select items.* from








/*����¡ ó���� ���� rwonum �� �ٱ� ������ ���ְ�, �˻� ������ �ִ� �����Դϴ�.(items)*/
(

/* ���⼭ ���� �巡���ؼ� */
select sortedTable.*, rownum "RNUM"  from



/*����¡ ó���� ���� rownum�� �������� �̸� ���� �س��� ���� �Դϴ�.*/
(
select * from



 /* ��� ������ǰ ���̺� ���̱� */
(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS
) AIT
 /* ��� ������ǰ ���̺� ���̱� ��*/

inner join

/*��� ������ǰ �԰� ���̺� ���̱�.*/
(
select sum(aid.G_STOCK_IN_CNT) "TOTINPUTCNT", aid.G_ITEM_CODE from
(
select * from
(
select * from ID_G_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_M_INPUT_DATE
)
/* ���� where ���� �԰��� �˻� ���� ���ϴ�. */
where
1=1
)
aid group by G_ITEM_CODE
) AID

on AIT.G_ITEM_CODE = AID.G_ITEM_CODE
 /*��� ������ǰ �԰� ���̺� ���̱�. ��*/

inner join

/*��� ������ǰ ��� ���̺� ���̱�.*/
(
select sum(aod.G_STOCK_OUT_CNT) "TOTOUTPUTCNT", aod.G_ITEM_CODE from
(
select * from
(
select * from ID_G_OUTPUT_DATE union all select * from ID_T_OUTPUT_DATE union all select * from ID_P_OUTPUT_DATE union all select * from ID_M_OUTPUT_DATE
)
/* ���� where ���� ����� �˻� ���� ���ϴ�. */
where
1=1
)
aod group by G_ITEM_CODE
) AOD
on AIT.G_ITEM_CODE = AOD.G_ITEM_CODE
/*��� ������ǰ ��� ���̺� ���̱�. ��*/



order by G_ITEM_REG_DATE  /* ���⼭ ���� ���� �ؾ��մϴ�.*/

) sortedTable

/*����¡ ó���� ���� rownum�� �������� �̸� ���� �س��� ���� �Դϴ�. ��.*/

where
rownum <= 100   /*<![CDATA[rownum <= ${selectPageNo*rowCntPerPage}]]> */

/* ���������� ������� �巡�� ���� F5 �ϸ� ������ �� �� �ֽ��ϴ�.*/

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
 /* ������ last �� ������ */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) < TO_NUMBER(${last_build_day_year}${last_build_day_month})
 )
 /* �԰���/�����  �˻� ������ ������ �ֽ��ϴ�. �˻� ���� ������ */
 and
 /*�԰���*/
 TOTINPUTCNT > 0
 /*�����*/
 TOTOUTPUTCNT > 0





) items

/*����¡ ó���� ���� rwonum �� �ٱ� ������ ���ְ�, �˻� ������ �ִ� �����Դϴ�. ��*/



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

 where         /*<-- items subquery where ���Դϴ�. */
  items.RNUM >= 1     /* <![CDATA[items.RNUM >= ${(selectPageNo*rowCntPerPage)-rowCntPerPage+1}]]> */







  SELECT count(*) "TOTCNT", TO_CHAR(G_INPUT_DATE,'yyyy') "YEAR" FROM id_g_input_date group by TO_CHAR(G_INPUT_DATE,'yyyy')
