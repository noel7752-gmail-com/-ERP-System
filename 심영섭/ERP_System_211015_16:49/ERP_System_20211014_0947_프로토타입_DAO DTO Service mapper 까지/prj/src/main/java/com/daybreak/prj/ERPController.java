package com.daybreak.prj;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ERPController {
	
	@Autowired
	private ERPDAO erpDAO;
	@Autowired
	private ERPService erpService;	
    
    @RequestMapping(value = "/daybreak.do")
    public ModelAndView daybreak() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("daybreak.jsp");
        return mav;
    }


    // 통합검색 접속.
    @RequestMapping( value="/searchAll.do" )
    public ModelAndView goSearchAll( 
    		ERPSearchDTO erpSearchDTO
            
    ){
    	int searchListAllCnt = this.erpDAO.getSearchAllCnt(erpSearchDTO);
    	List<Map<String,String>> searchALLList = this.erpDAO.getSearcALLhList(erpSearchDTO);
    	Map<String,Integer> map = Util.getPagingNos(searchListAllCnt, erpSearchDTO.getSelectPageNo(), erpSearchDTO.getRowCntPerPage(), 10);
    	
    	System.out.println(searchALLList);
    	
        //*******************************************
        // [ModelAndView 객체] 생성하기
        // [ModelAndView 객체]에 [호출 JSP 페이지명]을 저장하기
        //*******************************************
        ModelAndView mav = new ModelAndView( );
        mav.setViewName("allSearch.jsp");
        // mav.addObject("boardDTO", boardDTO);
        mav.addObject("searchALLList",searchALLList);
        mav.addObject("pagingNos",map);
        mav.addObject("searchListAllCnt",searchListAllCnt);

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
    



}
