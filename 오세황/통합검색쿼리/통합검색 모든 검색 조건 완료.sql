select items.* from








/*����¡ ó���� ���� rwonum �� �ٱ� ������ ���ְ�, �˻� ������ �ִ� �����Դϴ�.(items)*/

/* ���⼭ ���� �巡���ؼ� */
select
sortedTable.G_ITEM_NO
,sortedTable.G_ITEM_REG_DATE
,sortedTable.CATEGORY_CODE
,sortedTable.G_SUB_CATEGORY_CODE
,sortedTable.G_SUB_SUB_CATEGORY_CODE
,sortedTable.BRAND_CODE
,sortedTable.G_ITEM_CODE
,sortedTable.G_ITEM_NAME
,sortedTable.G_BUILD_DAY
,sortedTable.ENERGY_GRADE_CODE
,sortedTable.G_POWER_CONSUM
,sortedTable.COLOR_CODE
,sortedTable.G_ITEM_SIZE_X
,sortedTable.G_ITEM_SIZE_Y
,sortedTable.G_ITEM_SIZE_Z
,sortedTable.G_DISCONTINUED
,sortedTable.G_PIC
,nvl(sortedTable.TOTINPUTCNT,0) "TOTINPUTCNT"
,nvl(sortedTable.TOTOUTPUTCNT,0) "TOTOUTPUTCNT"
,(nvl(sortedTable.TOTINPUTCNT,0)-nvl(sortedTable.TOTOUTPUTCNT,0)) "NOW_STOCK"
,rownum "RNUM"
from



/*����¡ ó���� ���� rownum�� �������� �̸� ���� �س��� ���� �Դϴ�.*/
(
select * from



 /* ��� ������ǰ ���̺� ���̱� */
(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS
) AIT
 /* ��� ������ǰ ���̺� ���̱� ��*/

left outer join

/*��� ������ǰ �԰� ���̺� ���̱�.*/
(
select sum(aid.G_STOCK_IN_CNT) "TOTINPUTCNT", aid.G_ITEM_CODE "G_ITEM_CODE" from
(
select * from
(
select * from ID_G_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_M_INPUT_DATE
)
/* ���� where ���� �԰��� �˻� ���� ���ϴ�. */
where
1=1
/* and (
 ù ��° �԰��ϸ� ������.
TO_NUMBER(TO_CHAR(G_INPUT_DATE,'yyyymm')) > TO_NUMBER('${first_input_date_year}${first_input_date_month}')
ù��°, �� ��° �԰��� �Ѵ� ���� ��
and
�� ��° �԰��ϸ� ���� ��
TO_NUMBER(TO_CHAR(G_INPUT_DATE,'yyyymm')) < TO_NUMBER('${second_input_date_year}${second_input_date_month}')
)  */
) aid
group by aid.G_ITEM_CODE
) AID

on AIT.G_ITEM_CODE = AID.G_ITEM_CODE
 /*��� ������ǰ �԰� ���̺� ���̱�. ��*/

left outer join

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
/*
and (
 ù ��° �԰��ϸ� ������.
TO_NUMBER(TO_CHAR(G_OUTPUT_DATE,'yyyymm')) > TO_NUMBER('${first_output_date_year}${first_output_date_month}')

ù��°, �� ��° �԰��� �Ѵ� ���� ��
and
�� ��° �԰��ϸ� ���� ��
TO_NUMBER(TO_CHAR(G_OUTPUT_DATE,'yyyymm')) < TO_NUMBER('${second_output_date_year}${second_output_date_month}')
)
*/
) aod
group by G_ITEM_CODE
)AOD
on AIT.G_ITEM_CODE = AOD.G_ITEM_CODE
/*��� ������ǰ ��� ���̺� ���̱�. ��*/

order by G_ITEM_REG_DATE  /* ���⼭ ���� ���� �ؾ��մϴ�.*/

) sortedTable

/*����¡ ó���� ���� rownum�� �������� �̸� ���� �س��� ���� �Դϴ�. ��.*/


/* ���������� ������� �巡�� ���� F5 �ϸ� ������ �� �� �ֽ��ϴ�.*/

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
 /* ������ last �� ������ */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) < TO_NUMBER(${last_build_day_year}${last_build_day_month})
 )


 /* �԰���/�����  �˻� ������ ������ �ֽ��ϴ�. �˻� ���� ������ */
 and
 /*�԰���*/
 sortedTable.TOTINPUTCNT > 0
 /*�����*/
 sortedTable.TOTOUTPUTCNT > 0


 /* �Һ����� �˻� ���� */
 and(
  /*ù��° �� ������.*/
  sortedTable.G_POWER_CONSUM > ${fisrt_power_consum}
  /*ù��°, �ι�° �� �� ������*/
  and
  /*�ι�° �� ������*/
  sortedTable.G_POWER_CONSUM < ${second_power_consum}
 )


 /* ������ �˻� ����(���α���) */
 and(
  /*ù��° �� ������.*/
  sortedTable.G_ITEM_SIZE_X > ${fisrt_size_x}
  /*ù��°, �ι�° �� �� ������*/
  and
  /*�ι�° �� ������*/
  sortedTable.G_ITEM_SIZE_X < ${second_size_x}
 )


 /* ���� �˻� ���� */
  and
  sortedTable.G_DISCONTINUED = 'true'


 /* ��� ���� 0 �˻� ���� */
 and(
    sortedTable.NOW_STOCK = 0
 )





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

  select * from ID_G_ITEMS where CATEGORY_CODE = 1 and G_SUB_CATEGORY_CODE = 1