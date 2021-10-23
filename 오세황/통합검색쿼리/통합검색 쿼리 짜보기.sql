select items.* from





(



select sortedTable.*, rownum "RNUM"  from


(
select * from

(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS   /* 모든 전자제품 테이블 붙이기 */
) g1 inner join
(
select G_INPUT_DATE, G_ITEM_CODE from (select * from ID_G_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_M_INPUT_DATE ) group by G_ITEM_CODE
)

order by G_ITEM_REG_DATE  /* 여기서 정렬을 먼저.*/
) sortedTable

where
rownum <= 100   /*<![CDATA[rownum <= ${selectPageNo*rowCntPerPage}]]> */
/*===================================================================*/
/*검색조건 들어가는 자리 입니다.*/
/*===================================================================*/
/* 제품NAME 검색 조건 */
 and
 sortedTable.G_ITEM_NAME like '%${G_ITEM_NAME}%'
 /* 제품CODE 검색 조건 */
 and
 sortedTable.G_ITEM_CODE like '%${G_ITEM_CODE}%'
 /* 제품품목 검색 조건 */
 and
 sortedTable.CATEGORY_CODE = ${CATEGORY_CODE}
 /* 제품세부품목 검색 조건 */
 and
 sortedTable.G_SUB_CATEGORY_CODE = ${G_SUB_CATEGORY_CODE}
 /* 제품세부품목2 검색 조건 */
 and
 sortedTable.G_SUB_SUB_CATEGORY_CODE = ${G_SUB_SUB_CATEGORY_CODE}
 /* 색상 검색 조건 */
 and
 sortedTable.COLOR_CODE = ${COLOR_CODE}
 /* 브랜드 검색 조건 */
 and
 sortedTable.BRAND_CODE = ${BRAND_CODE}
 /* 에너지 소비등급 검색 조건 */
 and
 sortedTable.ENERGY_GRADE_CODE = ${ENERGY_GRADE_CODE}
 /* 제조일 검색 조건 */
 and
 (
 /*제조일 first 만 있을때 */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) > TO_NUMBER(${first_build_day_year}${first_build_day_month})
 /* 제조일 first, last 둘다 있을때 */
 and
 /* 제조일 lasta 만 있을때 */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) < TO_NUMBER(${last_build_day_year}${last_build_day_month})
 )





) items /*inner join*/



/*===================================================================*/
/*===================================================================*/
/*모든 아이템의 총 갯수를 가져오는 테이블입니다. (총 개수로 역순번호 만듬)
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