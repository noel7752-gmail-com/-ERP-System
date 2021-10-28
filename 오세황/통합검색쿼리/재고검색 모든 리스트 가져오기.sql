
  select
*
 from
(
select
sortedTable.*, rownum "RNUM"
from



(
select
*

from



(
select * from ID_G_ITEMS union all select * from ID_T_ITEMS union all select * from ID_P_ITEMS union all select * from ID_M_ITEMS
) AIT

left outer join
(
select distinct(inout.G_INPUT_DATE), input.G_ITEM_CODE "ITEM_CODE", input.G_INPUT_DATE "INPUT_DATE", input.G_STOCK_IN_CNT, output.G_OUTPUT_DATE, output.G_STOCK_OUT_CNT from
(
    select G_INPUT_DATE, G_ITEM_CODE from ID_G_INPUT_DATE union all select P_INPUT_DATE, P_ITEM_CODE from ID_P_INPUT_DATE union all select T_INPUT_DATE, T_ITEM_CODE from ID_T_INPUT_DATE union all select M_INPUT_DATE, M_ITEM_CODE from ID_M_INPUT_DATE
    union all
    select G_OUTPUT_DATE, G_ITEM_CODE from ID_G_OUTPUT_DATE union all select P_OUTPUT_DATE, P_ITEM_CODE from ID_P_OUTPUT_DATE union all select T_OUTPUT_DATE, T_ITEM_CODE from ID_T_OUTPUT_DATE union all select M_OUTPUT_DATE, M_ITEM_CODE from ID_M_OUTPUT_DATE
) inout LEFT OUTER join
(
 select * from ID_G_INPUT_DATE union all select * from ID_P_INPUT_DATE union all select * from ID_T_INPUT_DATE union all select * from ID_M_INPUT_DATE
) input
on input.G_ITEM_CODE = inout.G_ITEM_CODE
 LEFT OUTER join
(
select * from ID_G_OUTPUT_DATE union all select * from ID_P_OUTPUT_DATE union all select * from ID_T_OUTPUT_DATE union all select * from ID_M_OUTPUT_DATE
) output
on output.G_ITEM_CODE = inout.G_ITEM_CODE
) inoutdate
on AIT.G_ITEM_CODE = inoutdate.ITEM_CODE


left outer join

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

left outer join

(select BRAND_CODE "BC", BRAND_NAME from brand) brble
on brble.BC = AIT.BRAND_CODE

) sortedTable

) items