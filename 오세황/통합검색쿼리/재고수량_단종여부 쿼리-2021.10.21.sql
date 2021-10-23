/* 재고수량이 0인 애들 & 단종여부 */

/* where 절에 조건 추가. <-- 서버에 부담이 많음 */
select
items.*
from
ID_G_ITEMS items
where
items.G_DISCONTINUED = 'false'
or
((select nvl(sum(G_STOCK_IN_CNT),0) from ID_G_INPUT_DATE indate where indate.G_ITEM_CODE = G_ITEM_CODE)-(select nvl(sum(G_STOCK_OUT_CNT),0) from ID_G_OUTPUT_DATE outdate where outdate.G_ITEM_CODE = G_ITEM_CODE)) = 1
and
    items.energy_grade_code < 4



/*ansi 방식 inner join 으로 테이블을 추가 서버에 부담이 적음 */
/* inday 테이블과 outday 테이블의 CNT 빼면 남은 재고수량*/
select items.*, inday.*, outday.* from
ID_G_ITEMS items inner join
(select nvl(sum(G_STOCK_IN_CNT),0), G_ITEM_CODE from ID_G_INPUT_DATE where 1=1 and to_date('2021-10-05','YYYY-MM-DD') < G_INPUT_DATE  group by G_ITEM_CODE) inday on inday.G_ITEM_CODE = items.G_ITEM_CODE inner join
(select nvl(sum(G_STOCK_OUT_CNT),0), G_ITEM_CODE from ID_G_OUTPUT_DATE group by G_ITEM_CODE having 1=1) outday on outday.G_ITEM_CODE = items.G_ITEM_CODE



where
items.G_DISCONTINUED = 'false'
or
items.ENERGY_GRADE_CODE < 4



insert into ID_G_INPUT_DATE  values(1,'AW05A5171GZA',sysdate,3);
insert into ID_G_INPUT_DATE  values(3,'AW05A5171GZA',sysdate,5);
insert into ID_G_INPUT_DATE  values(4,'AW05A5171GZA',sysdate,7);
insert into ID_G_INPUT_DATE  values(2,'AF18T5774WZK',sysdate,3);
insert into ID_G_INPUT_DATE  values(5,'AF18T5774WZK',sysdate,4);
insert into ID_G_INPUT_DATE  values(6,'AF18T5774WZK',sysdate,3);

insert into ID_G_OUTPUT_DATE  values(1,'AW05A5171GZA',sysdate,3);
insert into ID_G_OUTPUT_DATE  values(3,'AW05A5171GZA',sysdate,5);
insert into ID_G_OUTPUT_DATE  values(4,'AW05A5171GZA',sysdate,7);
insert into ID_G_OUTPUT_DATE  values(2,'AF18T5774WZK',sysdate,3);
insert into ID_G_OUTPUT_DATE  values(5,'AF18T5774WZK',sysdate,4);
insert into ID_G_OUTPUT_DATE  values(6,'AF18T5774WZK',sysdate,3);
commit

            AW05A5171GZA
AF18T5774WZK

                                            select * from ID_G_ITEMS    where G_ITEM_CODE = '777'


