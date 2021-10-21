/* 카테고리 가져오는 쿼리 */

select * from ID_CATEGORIES

select * from ID_G_SUB_CATEGORY where CATEGORY_CODE = 1

select * from ID_G_SUB_SUB_CATEGORY where G_SUB_CATEGORY_CODE = 1

/* 각각 카테고리별로 가지고 있는 브랜드 / 컬러 가져오는 쿼리                       ▽ 여기에 추가 조건(카테고리)이 들어가면 됩니다.*/
select * from brand where brand_code in (select distinct(brand_code) from ID_G_ITEMS where category_code = 1)
select * from color where color_code in (select distinct(color_code) from ID_G_ITEMS where category_code = 1 )


commit