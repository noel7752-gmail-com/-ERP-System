select items.* from








/*페이징 처리를 위해 rwonum 을 바깥 쿼리로 빼주고, 검색 조건을 넣는 쿼리입니다.(items)*/
(
/* 여기서 부터 드래그해서 */
select
sortedTable.*, rownum "RNUM"
from



/*페이징 처리를 위해 rownum을 쓰기전에 미리 정렬 해놓는 쿼리 입니다.*/
(
select
*
from



 /* 모든 전자제품 테이블 붙이기 */
(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS
) AIT
 /* 모든 전자제품 테이블 붙이기 끝*/

left outer join

/*모든 전자제품 입고 테이블 붙이기.*/
(
select sum(aid.G_STOCK_IN_CNT) "TOTINPUTCNT", aid.G_ITEM_CODE "G_ITEM_CODE" from
(
select * from
(
select * from ID_G_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_M_INPUT_DATE
)
/* 여기 where 절에 입고일 검색 조건 들어갑니다. */
where
1=1 and
/* and (
 첫 번째 입고일만 있을때.
TO_NUMBER(TO_CHAR(G_INPUT_DATE,'yyyymm')) > TO_NUMBER('${first_input_date_year}${first_input_date_month}')
첫번째, 두 번째 입고일 둘다 있을 때
and
두 번째 입고일만 있을 때
TO_NUMBER(TO_CHAR(G_INPUT_DATE,'yyyymm')) < TO_NUMBER('${second_input_date_year}${second_input_date_month}')
)  */
) aid
group by aid.G_ITEM_CODE
) AID

on AIT.G_ITEM_CODE = AID.G_ITEM_CODE
 /*모든 전자제품 입고 테이블 붙이기. 끝*/

left outer join

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
/*
and (
 첫 번째 입고일만 있을때.
TO_NUMBER(TO_CHAR(G_OUTPUT_DATE,'yyyymm')) > TO_NUMBER('${first_output_date_year}${first_output_date_month}')

첫번째, 두 번째 입고일 둘다 있을 때
and
두 번째 입고일만 있을 때
TO_NUMBER(TO_CHAR(G_OUTPUT_DATE,'yyyymm')) < TO_NUMBER('${second_output_date_year}${second_output_date_month}')
)
*/
) aod
group by G_ITEM_CODE
)AOD
on AIT.G_ITEM_CODE = AOD.G_ITEM_CODE

left outer join
/*모든 전자제품 출고 테이블 붙이기. 끝*/
/* 모든 서브 카테고리, 서브서브 카테고리 테이블 합치기. */
(
 select
 CATEGORY_CODE "CC"
 ,SCC
 ,SSCC
 ,CATEGORY_NAME
 ,G_SUB_CATEGORY_NAME
 ,G_SUB_SUB_CATEGORY_NAME
  from
 (
select
*
from ID_CATEGORIES c
inner join
(select CATEGORY_CODE "CC", G_SUB_CATEGORY_CODE, G_SUB_CATEGORY_NAME from ID_G_SUB_CATEGORY) c1
on c.CATEGORY_CODE = c1.CC
inner join
(select G_SUB_CATEGORY_CODE "SCC", G_SUB_SUB_CATEGORY_NAME, G_SUB_SUB_CATEGORY_CODE "SSCC" from ID_G_SUB_SUB_CATEGORY) c2
on c1.G_SUB_CATEGORY_CODE = c2.SCC union all
select
*
from ID_CATEGORIES c
inner join
(select CATEGORY_CODE "CC", T_SUB_CATEGORY_CODE, T_SUB_CATEGORY_NAME from ID_T_SUB_CATEGORY) c1
on c.CATEGORY_CODE = c1.CC
inner join
(select T_SUB_CATEGORY_CODE "SCC", T_SUB_SUB_CATEGORY_NAME, T_SUB_SUB_CATEGORY_CODE "SSCC" from ID_T_SUB_SUB_CATEGORY) c2
on c1.T_SUB_CATEGORY_CODE = c2.SCC union all
select
*
from ID_CATEGORIES c
inner join
(select CATEGORY_CODE "CC", P_SUB_CATEGORY_CODE, P_SUB_CATEGORY_NAME from ID_P_SUB_CATEGORY) c1
on c.CATEGORY_CODE = c1.CC
inner join
(select P_SUB_CATEGORY_CODE "SCC", P_SUB_SUB_CATEGORY_NAME, P_SUB_SUB_CATEGORY_CODE "SSCC" from ID_P_SUB_SUB_CATEGORY) c2
on c1.P_SUB_CATEGORY_CODE = c2.SCC union all
select
*
from ID_CATEGORIES c
inner join
(select CATEGORY_CODE "CC", M_SUB_CATEGORY_CODE, M_SUB_CATEGORY_NAME from ID_M_SUB_CATEGORY) c1
on c.CATEGORY_CODE = c1.CC
inner join
(select M_SUB_CATEGORY_CODE "SCC", M_SUB_SUB_CATEGORY_NAME, M_SUB_SUB_CATEGORY_CODE "SSCC" from ID_M_SUB_SUB_CATEGORY) c2
on c1.M_SUB_CATEGORY_CODE = c2.SCC
)
) cable
on cable.CC = AIT.CATEGORY_CODE and cable.SCC = AIT.G_SUB_CATEGORY_CODE and cable.SSCC = AIT.G_SUB_SUB_CATEGORY_CODE

/* 모든 서브 카테고리, 서브서브 카테고리 테이블 합치기. 끝 */

left outer join

/* 브랜드 테이블 합치기*/
(select BRAND_CODE "BC", BRAND_NAME from brand) brble
on brble.BC = AIT.BRAND_CODE
/* 브랜드 테이블 합치기 끝*/

left outer join

/* 컬러 테이블 합치기 */
(select COLOR_CODE "CC", COLOR_NAME from COLOR) coble
on coble.CC = AIT.COLOR_CODE
/* 컬러 테이블 합치기  끝*/

left outer join

/* 에너지 등급 테이블 합치기. */
(select ENERGY_GRADE_CODE "EGC", ENERGY_GRADE_NAME from ENERGY_GRADE) enble
on enble.EGC = AIT.ENERGY_GRADE_CODE
/* 에너지 등급 테이블 합치기. 끝 */

order by G_ITEM_REG_DATE  /* 여기서 정렬 먼저 해야합니다.*/

) sortedTable

/*페이징 처리를 위해 rownum을 쓰기전에 미리 정렬 해놓는 쿼리 입니다. 끝.*/


/* 위에서부터 여기까지 드래그 한후 F5 하면 실행결과 볼 수 있습니다.*/

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
 /* 제조일 last 만 있을때 */
 TO_NUMBER(TO_CHAR(sortedTable.G_BUILD_DAY,'YYYYMM')) < TO_NUMBER(${last_build_day_year}${last_build_day_month})
 )


 /* 입고일/출고일  검색 조건은 위에도 있습니다. 검색 조건 있을시 */
 and
 /*입고일*/
 sortedTable.TOTINPUTCNT > 0
 /*출고일*/
 sortedTable.TOTOUTPUTCNT > 0


 /* 소비전력 검색 조건 */
 and(
  /*첫번째 값 있을때.*/
  sortedTable.G_POWER_CONSUM > ${fisrt_power_consum}
  /*첫번째, 두번째 값 다 있을때*/
  and
  /*두번째 값 있을때*/
  sortedTable.G_POWER_CONSUM < ${second_power_consum}
 )


 /* 사이즈 검색 조건(가로기준) */
 and(
  /*첫번째 값 있을때.*/
  sortedTable.G_ITEM_SIZE_X > ${fisrt_size_x}
  /*첫번째, 두번째 값 다 있을때*/
  and
  /*두번째 값 있을때*/
  sortedTable.G_ITEM_SIZE_X < ${second_size_x}
 )


 /* 단종 검색 조건 */
  and
  sortedTable.G_DISCONTINUED = 'true'


 /* 재고 수량 0 검색 조건 */
 and(
    sortedTable.NOW_STOCK = 0
 )





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

  select * from ID_G_ITEMS where CATEGORY_CODE = 1 and G_SUB_CATEGORY_CODE = 1