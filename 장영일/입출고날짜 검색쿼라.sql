
-- 입고 날짜 00 이후 입고된 목록 검색 --
<if test="input_date_year_first!=null and input_date_year_first.length()>0">
and ITEM_CODE in(
select entire.ITEM_CODE from
(select G_ITEM_CODE    "ITEM_CODE"
       ,G_INPUT_DATE   "INPUT_DATE"
       ,G_STOCK_IN_CNT "STOCK_IN_CNT"
from ID_G_INPUT_DATE
union all
select T_ITEM_CODE
      ,T_INPUT_DATE
      ,T_STOCK_IN_CNT
from ID_T_INPUT_DATE
union all
select P_ITEM_CODE
      ,P_INPUT_DATE
      ,P_STOCK_IN_CNT
from ID_P_INPUT_DATE
union all
select M_ITEM_CODE
      ,M_INPUT_DATE
      ,M_STOCK_IN_CNT
from ID_M_INPUT_DATE) entire
where 1=1
  and INPUT_DATE > to_date('%${input_date_year_first}%-%${input_date_month_first}%','YYYY_MM')
)
</if>


-- 입고 날짜 00 이전 입고된 목록 검색 --
<if test="input_date_year_last!=null and input_date_year_last.length()>0">
and ITEM_CODE in(
select entire.ITEM_CODE from
(select G_ITEM_CODE    "ITEM_CODE"
       ,G_INPUT_DATE   "INPUT_DATE"
       ,G_STOCK_IN_CNT "STOCK_IN_CNT"
from ID_G_INPUT_DATE
union all
select T_ITEM_CODE
      ,T_INPUT_DATE
      ,T_STOCK_IN_CNT
from ID_T_INPUT_DATE
union all
select P_ITEM_CODE
      ,P_INPUT_DATE
      ,P_STOCK_IN_CNT
from ID_P_INPUT_DATE
union all
select M_ITEM_CODE
      ,M_INPUT_DATE
      ,M_STOCK_IN_CNT
from ID_M_INPUT_DATE) entire
where 1=1
  and INPUT_DATE < to_date('%${input_date_year_last}%-%${input_date_month_last}%','YYYY_MM')
)
</if>


-- 출고 날짜 00 이후 입고된 목록 검색 --
<if test="output_date_year_first!=null and output_date_year_first.length()>0">
and ITEM_CODE in(
select entire.ITEM_CODE from
(select G_ITEM_CODE    "ITEM_CODE"
       ,G_OUTPUT_DATE   "OUTPUT_DATE"
       ,G_STOCK_IN_CNT "STOCK_IN_CNT"
from ID_G_OUTPUT_DATE
union all
select T_ITEM_CODE
      ,T_OUTPUT_DATE
      ,T_STOCK_IN_CNT
from ID_T_OUTPUT_DATE
union all
select P_ITEM_CODE
      ,P_OUTPUT_DATE
      ,P_STOCK_IN_CNT
from ID_P_OUTPUT_DATE
union all
select M_ITEM_CODE
      ,M_OUTPUT_DATE
      ,M_STOCK_IN_CNT
from ID_M_OUTPUT_DATE) entire
where 1=1
  and OUTPUT_DATE > to_date('%${output_date_year_first}%-%${output_date_month_first}%','YYYY_MM')
)
</if>


-- 출고 날짜 00 이전 입고된 목록 검색 --
<if test="output_date_year_last!=null and output_date_year_last.length()>0">
and ITEM_CODE in(
select entire.ITEM_CODE from
(select G_ITEM_CODE    "ITEM_CODE"
       ,G_OUTPUT_DATE   "OUTPUT_DATE"
       ,G_STOCK_IN_CNT "STOCK_IN_CNT"
from ID_G_OUTPUT_DATE
union all
select T_ITEM_CODE
      ,T_OUTPUT_DATE
      ,T_STOCK_IN_CNT
from ID_T_OUTPUT_DATE
union all
select P_ITEM_CODE
      ,P_OUTPUT_DATE
      ,P_STOCK_IN_CNT
from ID_P_OUTPUT_DATE
union all
select M_ITEM_CODE
      ,M_OUTPUT_DATE
      ,M_STOCK_IN_CNT
from ID_M_OUTPUT_DATE) entire
where 1=1
  and OUTPUT_DATE < to_date('%${output_date_year_last}%-%${output_date_month_last}%','YYYY_MM')
)
</if>

