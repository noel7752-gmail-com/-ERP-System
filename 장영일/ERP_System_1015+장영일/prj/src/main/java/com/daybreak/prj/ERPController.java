package com.daybreak.prj;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ERPController {
    
    @RequestMapping(value = "/daybreak.do")
    public ModelAndView daybreak() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("daybreak.jsp");
        return mav;
    }


    // 통합검색 접속.
    @RequestMapping( value="/searchAll.do" )
    public ModelAndView goSearchAll( 
            
    ){
        //*******************************************
        // [ModelAndView 객체] 생성하기
        // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
        //*******************************************
        ModelAndView mav = new ModelAndView( );
        mav.setViewName("allSearch.jsp");
        // mav.addObject("boardDTO", boardDTO);

        //*******************************************
        // [ModelAndView 객체] 리턴하기
        //*******************************************
        return mav;
    }

    // 게시판 접속.
    // boardList.do로 바로 접속하게함.  
    // @RequestMapping(value = "/board.do")
    // public ModelAndView goBoard() {
    //     System.out.println("ERPController 쪽, ==> board.do 접속!@#!@#");

    //     ModelAndView mav = new ModelAndView();
    //     mav.setViewName("board.jsp");
    //     return mav;
    // }

    // 통계화면 접속.
    @RequestMapping(value = "/statistics.do")
    public ModelAndView goStatistics() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("statistics.jsp");
        return mav;
    }

    // 재고관리 접속.
    @RequestMapping(value = "/stock_management.do")
    public ModelAndView goSstock_management() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("stock_in_out.jsp");
        return mav;
    }

    // 재고관리 안에서 가전 검색.
    @RequestMapping(value = "/jaego_search.do")
    public ModelAndView goJaego_search() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("jaego_search.jsp");
        return mav;
    }

    
    //새 물품 입력
    @RequestMapping( 
            value="/itemRegProc.do"
            ,method = RequestMethod.POST
            ,produces = "application/json;charset=UTF8"
        )
        @ResponseBody
        public Map<String, String> insertBoard( 
            ERPDTO erpDTo
            ,@RequestParam("img") MultipartFile multi
        ){
    	    System.out.println( "itemRegProc 시작" );
    	    
    	    String fileName = multi.getOriginalFilename();
    	    
    	    System.out.println( "===========================================" );
    	    System.out.println( "pic       => " + fileName              );    	    
    	    System.out.println( "Item_code => " + erpDTo.getItem_code() );
    	    System.out.println( "Item_name => " + erpDTo.getItem_name() );
    	    System.out.println( "brand     => " + erpDTo.getBrand()     );
    	    System.out.println( "Item_code => " + erpDTo.getItem_code() );
    	    System.out.println( "== 대분류 ==" );
    	    System.out.println( "bigDivision => " + erpDTo.getBigDivision() );
    	    System.out.println( "== 중분류 ==" );  
    	    System.out.println( "middleDivision_G => " + erpDTo.getMiddleDivision_G() );
    	    System.out.println( "middleDivision_T => " + erpDTo.getMiddleDivision_T() );
    	    System.out.println( "middleDivision_P => " + erpDTo.getMiddleDivision_P() );
    	    System.out.println( "middleDivision_M => " + erpDTo.getMiddleDivision_M() );
    	    System.out.println( "== 소분류 ==" );      	    
    	    System.out.println( "smallDivision_G_season  => " + erpDTo.getSmallDivision_G_season()  );
    	    System.out.println( "smallDivision_G_kitchen => " + erpDTo.getSmallDivision_G_kitchen() );
    	    System.out.println( "smallDivision_G_life    => " + erpDTo.getSmallDivision_G_life()    );
    	    System.out.println( "smallDivision_P_desk    => " + erpDTo.getSmallDivision_P_desk()    );
    	    System.out.println( "smallDivision_P_lap     => " + erpDTo.getSmallDivision_P_lap()     );
    	    System.out.println( "============" );      	    
    	    System.out.println( "power_consum => " + erpDTo.getPower_consum() );
    	    System.out.println( "build_day    => " + erpDTo.getBuild_day()    );
    	    System.out.println( "energy_grade => " + erpDTo.getEnergy_grade() );
    	    System.out.println( "color        => " + erpDTo.getColor()        );
    	    System.out.println( "whatsize     => " + erpDTo.getWhatsize()     );
    	    System.out.println( "discontinued => " + erpDTo.getDiscontinued() );
    	    System.out.println( "stock_num    => " + erpDTo.getStock_num()    ); 	    
    	    System.out.println( "===========================================" );
            int ERPRegCnt = 0;
            
            Map<String, String> map = new HashMap<String,String>();
            map.put("ERPRegCnt", ERPRegCnt+"");
            
            System.out.println( "itemRegProc 종료" );
            return map;
        }



}
