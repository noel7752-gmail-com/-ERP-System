select items.* from








/*페이징 처리를 위해 rwonum 을 바깥 쿼리로 빼주고, 검색 조건을 넣는 쿼리입니다.(items)*/
(

/* 여기서 부터 드래그해서 */
select sortedTable.*, rownum "RNUM"  from



/*페이징 처리를 위해 rownum을 쓰기전에 미리 정렬 해놓는 쿼리 입니다.*/
(
select * from



 /* 모든 전자제품 테이블 붙이기 */
(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS
) AIT
 /* 모든 전자제품 테이블 붙이기 끝*/

inner join

/*모든 전자제품 입고 테이블 붙이기.*/
(
select sum(aid.G_STOCK_IN_CNT) "TOTINPUTCNT", aid.G_ITEM_CODE from
(
select * from
(
select * from ID_G_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_M_INPUT_DATE
)
/* 여기 where 절에 입고일 검색 조건 들어갑니다. */
where
1=1
)
aid group by G_ITEM_CODE
) AID

on AIT.G_ITEM_CODE = AID.G_ITEM_CODE
 /*모든 전자제품 입고 테이블 붙이기. 끝*/

inner join

/*모든 전자제품 출고 테이블 붙이기.*/
(
select sum(aod.G_STOCK_OUT_CNT) "TOTOUTPUTCNT", aod.G_ITEM_CODE from
(
select * from
(
select * from ID_G_OUTPUT_DATE union all select * from ID_T_OUTPUT_DATE union all select * from ID_P_OUTPUT_DATE union all select * from ID_M_OUTPUT_DATE
)
/* 여기 where 절에 출고일 검색 조건 들어갑니다. */
where
1=1
)
aod group by G_ITEM_CODE
) AOD
on AIT.G_ITEM_CODE = AOD.G_ITEM_CODE
/*모든 전자제품 출고 테이블 붙이기. 끝*/



order by G_ITEM_REG_DATE  /* 여기서 정렬 먼저 해야합니다.*/

) sortedTable

/*페이징 처리를 위해 rownum을 쓰기전에 미리 정렬 해놓는 쿼리 입니다. 끝.*/

where
rownum <= 100   /*<![CDATA[rownum <= ${selectPageNo*rowCntPerPage}]]> */

/* 위에서부터 여기까지 드래그 한후 F5 하면 실행결과 볼 수 있습니다.*/

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
 /* 제조일 last 만 있을때 */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) < TO_NUMBER(${last_build_day_year}${last_build_day_month})
 )
 /* 입고일/출고일  검색 조건은 위에도 있습니다. 검색 조건 있을시 */
 and
 /*입고일*/
 TOTINPUTCNT > 0
 /*출고일*/
 TOTOUTPUTCNT > 0





) items

/*페이징 처리를 위해 rwonum 을 바깥 쿼리로 빼주고, 검색 조건을 넣는 쿼리입니다. 끝*/



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

 where         /*<-- items subquery where 절입니다. */
  items.RNUM >= 1     /* <![CDATA[items.RNUM >= ${(selectPageNo*rowCntPerPage)-rowCntPerPage+1}]]> */







  SELECT count(*) "TOTCNT", TO_CHAR(G_INPUT_DATE,'yyyy') "YEAR" FROM id_g_input_date group by TO_CHAR(G_INPUT_DATE,'yyyy')
