

insert ALL

 into ID_g_items(
          g_item_no
          ,category_code
          ,g_sub_category_code
          ,g_sub_sub_category_code
          ,brand_code
          ,g_item_code
          ,g_item_name
          ,g_build_day
          <!-- 만약에 ERPDTO 객체안의 pic 속성변수에 데이터가 있으면 -->
          <!-- <참고> pic 속성변수에는 업로드된 파일의 새이름이 저장되어 있다. -->
          <if test="g_pic!=null and g_pic.length()>0">
          ,g_pic
          </if>
          ,energy_grade_code
          ,g_power_consum
          ,color_code
          ,g_item_size_x
          ,g_item_size_y
          ,g_item_size_z
          ,g_discontinued
     ) values (
             (select nvl(max(g_item_no),0)+1 from ID_g_items)
          ,#{reg_category_code}
          ,#{reg_sub_category_code}
          ,#{reg_sub_sub_category_code}
          ,#{reg_brand_code}
          ,#{reg_item_code}
          ,#{reg_item_name}
          ,#{reg_build_day}
          <!-- 만약에 BoardDTO 객체안의 pic 속성변수에 데이터가 있으면 -->
          <if test="g_pic!=null and g_pic.length()>0">
          <!-- pic 속성변수에 데이터 꺼내서 '를 붙여서 표현하기 -->
          ,#{g_pic }
          </if>
          ,#{reg_energy_grade_code}
          ,#{reg_power_consum}
          ,#{reg_color_code}
          ,#{reg_item_size_x}
          ,#{reg_item_size_y}
          ,#{reg_item_size_z}
          ,#{reg_discontinued}
     )

  INTO  ID_G_INPUT_DATE   (
  G_INPUT_DATE_NO
  ,G_ITEM_CODE

  ,G_STOCK_IN_CNT   )

  values (
          (select nvl(max(G_INPUT_DATE_NO),0)+1 from ID_G_INPUT_DATE)
          ,#{reg_item_code}
          ,0
  )


    INTO  ID_G_OUTPUT_DATE   (
  G_OUTPUT_DATE_NO
  ,G_ITEM_CODE

  ,G_STOCK_OUT_CNT   )

  values (
          (select nvl(max(G_OUTPUT_DATE_NO),0)+1 from ID_G_OUTPUT_DATE)
          ,#{reg_item_code}
          ,0
  )
