update ID_G_ITEMS set G_ITEM_CODE = 'oooo' where G_ITEM_CODE = 'CRP-R069FP'


/* 트리거를 만듭니다. 그리고 나서 ID_G_ITEMS 에 제품코드를 업데이트 합니다. 끝. */
CREATE or replace trigger ITEM_CODE_UPDATE
after update of G_ITEM_CODE on ID_G_ITEMS for each row
begin
    update ID_G_INPUT_DATE
    set G_ITEM_CODE = :new.G_ITEM_CODE
    where G_ITEM_CODE = :old.G_ITEM_CODE;
    update ID_G_OUTPUT_DATE
    set G_ITEM_CODE = :new.G_ITEM_CODE
    where G_ITEM_CODE = :old.G_ITEM_CODE;
end;


/* 트리거 설명

    저도 자세한것은 모르고 복붙해왔습니다.
    ITEM_CODE_UPDATE 라는 이름으로 trigger를 생성,
    이 트리거는 ID_GI_ITEMS 테이블에 G_ITEM_CODE 가 update 된 후 실행됩니다.
    시작
        만약 input_date 테이블 제품코드가 예전거라면 방금 바뀐 새 값을 넣어줌.
        만약 output_date 테이블 제품코드가 예전거라면 방금 바뀐 새 값을 넣어줌.
    끝
 */



drop trigger ITEM_CODE_UPDATE
commit
