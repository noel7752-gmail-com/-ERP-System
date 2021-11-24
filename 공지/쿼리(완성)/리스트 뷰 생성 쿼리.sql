CREATE OR REPLACE VIEW ERP_LIST
AS

select
            IGI.G_ITEM_NO "ITEM_NO"
            ,IGI.G_PIC "PIC"
            ,IGI.CATEGORY_CODE "CATEGORY_CODE"
            ,C.CATEGORY_NAME "CATEGORY_NAME"
            ,IGI.G_SUB_CATEGORY_CODE     "SUB_CATEGORY_CODE"
            ,IGSC.G_SUB_CATEGORY_NAME    "SUB_CATEGORY_NAME"
            ,IGI.G_SUB_SUB_CATEGORY_CODE     "SUB_SUB_CATEGORY_CODE"
            ,GSSC.G_SUB_SUB_CATEGORY_NAME   "SUB_SUB_CATEGORY_NAME"
            ,IGI.G_ITEM_CODE "ITEM_CODE"
            ,IGI.G_ITEM_NAME "ITEM_NAME"
            ,to_char(IGI.G_BUILD_DAY, 'YYYY-MM') "BUILD_DAY"
            ,B.BRAND_NAME "BRAND_NAME"
            ,IGI.BRAND_CODE "BRAND_CODE"
            ,nvl(EG.ENERGY_GRADE_NAME, '') "ENERGY_GRADE_NAME"
            ,IGI.ENERGY_GRADE_CODE "ENERGY_GRADE_CODE"
            ,IGI.G_POWER_CONSUM "POWER_CONSUM"
            ,IGI.G_ITEM_SIZE_X  "ITEM_SIZE_X"
            ,IGI.G_ITEM_SIZE_Y  "ITEM_SIZE_Y"
            ,IGI.G_ITEM_SIZE_Z  "ITEM_SIZE_Z"
            ,IGI.COLOR_CODE  "COLOR_CODE"
            ,COL.COLOR_NAME  "COLOR_NAME"
            ,IGI.G_DISCONTINUED "DISCONTINUED"
            ,IGI.G_ITEM_REG_DATE "ITEM_REG_DATE"
            ,nvl(GIPS.G_INSTOCK,0)-nvl(GOPS.G_OUTSTOCK,0) "STOCK"
        from (((((((ID_G_ITEMS IGI inner join ID_G_SUB_CATEGORY IGSC
        on  IGI.G_SUB_CATEGORY_CODE =  IGSC.G_SUB_CATEGORY_CODE ) inner join BRAND B on B.BRAND_CODE=IGI.BRAND_CODE)
        inner join ID_CATEGORIES C on C.CATEGORY_CODE=IGI.CATEGORY_CODE)
        inner join ID_G_SUB_SUB_CATEGORY GSSC on GSSC.G_SUB_SUB_CATEGORY_CODE=IGI.G_SUB_SUB_CATEGORY_CODE)
        left outer join ENERGY_GRADE EG on IGI.ENERGY_GRADE_CODE=EG.ENERGY_GRADE_CODE)
        inner join COLOR COL on COL.COLOR_CODE=IGI.COLOR_CODE)left outer join(select  IGI.G_ITEM_CODE ,nvl(SUM(GIPD.G_STOCK_IN_CNT),0) "G_INSTOCK" from
        ID_G_ITEMS IGI inner join ID_G_INPUT_DATE GIPD on IGI.G_ITEM_CODE=GIPD.G_ITEM_CODE group by IGI.G_ITEM_CODE) GIPS on GIPS.G_ITEM_CODE=IGI.G_ITEM_CODE)
        left outer join (select  IGI.G_ITEM_CODE ,nvl(SUM(GOPD.G_STOCK_OUT_CNT),0) "G_OUTSTOCK" from
        ID_G_ITEMS IGI inner join ID_G_OUTPUT_DATE GOPD on IGI.G_ITEM_CODE=GOPD.G_ITEM_CODE group by IGI.G_ITEM_CODE) GOPS on GOPS.G_ITEM_CODE=IGI.G_ITEM_CODE
        union all
        select
            ITI.T_ITEM_NO
            ,ITI.T_PIC
            ,ITI.CATEGORY_CODE
            ,C.CATEGORY_NAME
            ,ITI.T_SUB_CATEGORY_CODE
            ,ITSC.T_SUB_CATEGORY_NAME
            ,ITI.T_SUB_SUB_CATEGORY_CODE
            ,TSSC.T_SUB_SUB_CATEGORY_NAME
            ,ITI.T_ITEM_CODE
            ,ITI.T_ITEM_NAME
            ,to_char(ITI.T_BUILD_DAY, 'YYYY-MM')
            ,B.BRAND_NAME
            ,ITI.BRAND_CODE
            ,nvl(EG.ENERGY_GRADE_NAME, '')
            ,ITI.ENERGY_GRADE_CODE
            ,ITI.T_POWER_CONSUM
            ,ITI.T_ITEM_SIZE_X
            ,ITI.T_ITEM_SIZE_Y
            ,ITI.T_ITEM_SIZE_Z
            ,ITI.COLOR_CODE
            ,COL.COLOR_NAME
            ,ITI.T_DISCONTINUED
            ,ITI.T_ITEM_REG_DATE
            ,nvl(TIPS.T_INSTOCK,0)-nvl(TOPS.T_OUTSTOCK,0)
        from (((((((ID_T_ITEMS ITI inner join ID_T_SUB_CATEGORY ITSC
        on  ITI.T_SUB_CATEGORY_CODE =  ITSC.T_SUB_CATEGORY_CODE ) inner join BRAND B on B.BRAND_CODE=ITI.BRAND_CODE)
        inner join ID_CATEGORIES C on C.CATEGORY_CODE=ITI.CATEGORY_CODE)
        inner join ID_T_SUB_SUB_CATEGORY TSSC on TSSC.T_SUB_SUB_CATEGORY_CODE=ITI.T_SUB_SUB_CATEGORY_CODE)
        left outer join ENERGY_GRADE EG on ITI.ENERGY_GRADE_CODE=EG.ENERGY_GRADE_CODE)
        inner join COLOR COL on COL.COLOR_CODE=ITI.COLOR_CODE)left outer join(select  ITI.T_ITEM_CODE ,nvl(SUM(TIPD.T_STOCK_IN_CNT),0) "T_INSTOCK" from
        ID_T_ITEMS ITI inner join ID_T_INPUT_DATE TIPD on ITI.T_ITEM_CODE=TIPD.T_ITEM_CODE group by ITI.T_ITEM_CODE) TIPS on TIPS.T_ITEM_CODE=ITI.T_ITEM_CODE)
        left outer join (select  ITI.T_ITEM_CODE ,nvl(SUM(TOPD.T_STOCK_OUT_CNT),0) "T_OUTSTOCK" from
        ID_T_ITEMS ITI inner join ID_T_OUTPUT_DATE TOPD on ITI.T_ITEM_CODE=TOPD.T_ITEM_CODE group by ITI.T_ITEM_CODE) TOPS on TOPS.T_ITEM_CODE=ITI.T_ITEM_CODE
        union all
        select
            IPI.P_ITEM_NO
            ,IPI.P_PIC
            ,IPI.CATEGORY_CODE
            ,C.CATEGORY_NAME
            ,IPI.P_SUB_CATEGORY_CODE
            ,IPSC.P_SUB_CATEGORY_NAME
            ,IPI.P_SUB_SUB_CATEGORY_CODE
            ,PSSC.P_SUB_SUB_CATEGORY_NAME
            ,IPI.P_ITEM_CODE
            ,IPI.P_ITEM_NAME
            ,to_char(IPI.P_BUILD_DAY, 'YYYY-MM')
            ,B.BRAND_NAME
            ,IPI.BRAND_CODE
            ,nvl(EG.ENERGY_GRADE_NAME, '')
            ,IPI.ENERGY_GRADE_CODE
            ,IPI.P_POWER_CONSUM
            ,IPI.P_ITEM_SIZE_X
            ,IPI.P_ITEM_SIZE_Y
            ,IPI.P_ITEM_SIZE_Z
            ,IPI.COLOR_CODE
            ,COL.COLOR_NAME
            ,IPI.P_DISCONTINUED
            ,IPI.P_ITEM_REG_DATE
            ,nvl(PIPS.P_INSTOCK,0)-nvl(POPS.P_OUTSTOCK,0)
        from (((((((ID_P_ITEMS IPI inner join ID_P_SUB_CATEGORY IPSC
        on  IPI.P_SUB_CATEGORY_CODE =  IPSC.P_SUB_CATEGORY_CODE ) inner join BRAND B on B.BRAND_CODE=IPI.BRAND_CODE)
        inner join ID_CATEGORIES C on C.CATEGORY_CODE=IPI.CATEGORY_CODE)
        inner join ID_P_SUB_SUB_CATEGORY PSSC on PSSC.P_SUB_SUB_CATEGORY_CODE=IPI.P_SUB_SUB_CATEGORY_CODE)
        left outer join ENERGY_GRADE EG on IPI.ENERGY_GRADE_CODE=EG.ENERGY_GRADE_CODE)
        inner join COLOR COL on COL.COLOR_CODE=IPI.COLOR_CODE)left outer join(select  IPI.P_ITEM_CODE ,nvl(SUM(PIPD.P_STOCK_IN_CNT),0) "P_INSTOCK" from
        ID_P_ITEMS IPI inner join ID_P_INPUT_DATE PIPD on IPI.P_ITEM_CODE=PIPD.P_ITEM_CODE group by IPI.P_ITEM_CODE) PIPS on PIPS.P_ITEM_CODE=IPI.P_ITEM_CODE)
        left outer join (select  IPI.P_ITEM_CODE ,nvl(SUM(POPD.P_STOCK_OUT_CNT),0) "P_OUTSTOCK" from
        ID_P_ITEMS IPI inner join ID_P_OUTPUT_DATE POPD on IPI.P_ITEM_CODE=POPD.P_ITEM_CODE group by IPI.P_ITEM_CODE) POPS on POPS.P_ITEM_CODE=IPI.P_ITEM_CODE
        union all
        select
            IMI.M_ITEM_NO
            ,IMI.M_PIC
            ,IMI.CATEGORY_CODE
            ,C.CATEGORY_NAME
            ,IMI.M_SUB_CATEGORY_CODE
            ,IMSC.M_SUB_CATEGORY_NAME
            ,IMI.M_SUB_SUB_CATEGORY_CODE
            ,MSSC.M_SUB_SUB_CATEGORY_NAME
            ,IMI.M_ITEM_CODE
            ,IMI.M_ITEM_NAME
            ,to_char(IMI.M_BUILD_DAY, 'YYYY-MM')
            ,B.BRAND_NAME
            ,IMI.BRAND_CODE
            ,nvl(EG.ENERGY_GRADE_NAME, '')
            ,IMI.ENERGY_GRADE_CODE
            ,IMI.M_POWER_CONSUM
            ,IMI.M_ITEM_SIZE_X
            ,IMI.M_ITEM_SIZE_Y
            ,IMI.M_ITEM_SIZE_Z
            ,IMI.COLOR_CODE
            ,COL.COLOR_NAME
            ,IMI.M_DISCONTINUED
            ,IMI.M_ITEM_REG_DATE
            ,nvl(MIPS.M_INSTOCK,0)-nvl(MOPS.M_OUTSTOCK,0)
        from (((((((ID_M_ITEMS IMI inner join ID_M_SUB_CATEGORY IMSC
        on  IMI.M_SUB_CATEGORY_CODE =  IMSC.M_SUB_CATEGORY_CODE ) inner join BRAND B on B.BRAND_CODE=IMI.BRAND_CODE)
        inner join ID_CATEGORIES C on C.CATEGORY_CODE=IMI.CATEGORY_CODE)
        inner join ID_M_SUB_SUB_CATEGORY MSSC on MSSC.M_SUB_SUB_CATEGORY_CODE=IMI.M_SUB_SUB_CATEGORY_CODE)
        left outer join ENERGY_GRADE EG on IMI.ENERGY_GRADE_CODE=EG.ENERGY_GRADE_CODE)
        inner join COLOR COL on COL.COLOR_CODE=IMI.COLOR_CODE)left outer join(select  IMI.M_ITEM_CODE ,nvl(SUM(MIPD.M_STOCK_IN_CNT),0) "M_INSTOCK" from
        ID_M_ITEMS IMI inner join ID_M_INPUT_DATE MIPD on IMI.M_ITEM_CODE=MIPD.M_ITEM_CODE group by IMI.M_ITEM_CODE) MIPS on MIPS.M_ITEM_CODE=IMI.M_ITEM_CODE)
        left outer join (select  IMI.M_ITEM_CODE ,nvl(SUM(MOPD.M_STOCK_OUT_CNT),0) "M_OUTSTOCK" from
        ID_M_ITEMS IMI inner join ID_M_OUTPUT_DATE MOPD on IMI.M_ITEM_CODE=MOPD.M_ITEM_CODE group by IMI.M_ITEM_CODE) MOPS on MOPS.M_ITEM_CODE=IMI.M_ITEM_CODE


;



-- 뷰 생성하고 나서 확인하세요!!

select * from ERP_LIST