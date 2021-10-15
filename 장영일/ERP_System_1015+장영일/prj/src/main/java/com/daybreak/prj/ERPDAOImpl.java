package com.daybreak.prj;

import java.util.List;
import java.util.Map;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicInterface2;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// [DAO 클래스]인 [BoardDAOImpl 클래스] 선언
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // @Repository 를 붙임으로써 [DAO 클래스]임을 지정하게 되고, bean 태그로 자동 등록된다.  
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
@Repository
public class ERPDAOImpl implements ERPDAO {

    // ******************************************************
    // 속성변수 sqlSession 선언하고, [SqlSessionTemplate 객체]를 생성해 저장
    // ******************************************************
        // @Autowired 역할 -> 속성변수에 붙은 자료형이 [인터페이스]면 이를 구현한 [클래스]를 객체화하여 저장한다.
        // @Autowired 역할 -> 속성변수에 붙은 자료형이 [클래스]면 이를 객체화 하여 저장한다.  
    @Autowired
    private SqlSessionTemplate sqlSession;    




























































































    

    // ===================================================================================
    // 게시판 DAOImpl 참고용 주석. 삭제하지마시고, 그냥 코드들 참고하시고 위에 코딩 해주세요.
    // ===================================================================================
/*
    // ******************************************************
    // [게시판 글 입력 후 입력 적용 행의 개수]를 리턴하는 메소드 선언
    // ******************************************************
    public int insertBoard(BoardDTO boardDTO){
        // ----------------------------------------------
        // SqlSessionTemplate 객체의 insert 메소드 호출로
        // 게시판 글 입력 SQL 구문을 실행하고 입력 성공 행의 개수 얻기.
        // ----------------------------------------------
        int boardRegCnt = sqlSession.insert(
            // ----------------------------------------------
            // 실행할 SQL 구문의 위치를 지정하기.
            // 실행할 SQL 구문의 위치 문자열 패턴은 아래와 같다.
            // xml 파일 중에 "mapper태그의namespace명.mapper태그내부의호출할SQL구문소유한태그id값"
            // ----------------------------------------------
            "com.daybreak.prj.BoardDAO.insertBoard"  
            // ----------------------------------------------
            // 호출할 SQL 구문에서 사용할 데이터 지정하기
            // ----------------------------------------------
            ,boardDTO                             
        );
        System.out.println("BoardDAOImpl. sqlSession.insert() 메서드 수행완료\r");
        return boardRegCnt;
    }

    // ******************************************************
    // [검색한 게시판 목록] 리턴하는 메소드 선언
    // ******************************************************
    public List<Map<String,String>>getBoardList( BoardSearchDTO boardSearchDTO){
        List<Map<String,String>> boardList = this.sqlSession.selectList(

            "com.daybreak.prj.BoardDAO.getBoardList"  // 실행할 SQL 구문의 위치 지정  
            , boardSearchDTO                       // 실행할 SQL 구문에서 사용할 데이터 지정

        );
        System.out.println("BoardDAOImpl 게시판 목록 List 값 확인 =>" + boardList);
        return boardList;
    }

    // ******************************************************
    // 게시판 이미지 이름가져오는 메소드 선언
    // ******************************************************
    public String getPic(BoardDTO boardDTO){
        
        String pic = this.sqlSession.selectOne(

            "com.daybreak.prj.BoardDAO.getPic"  // 실행할 SQL 구문의 위치 지정  
            , boardDTO                       // 실행할 SQL 구문에서 사용할 데이터 지정

        );
        return pic;
    }

    // ******************************************************
    // [1개 게시판 글 정보] 리턴하는 메소드 선언
    // ******************************************************
    public BoardDTO getBoard(int b_no){

        // -------------------------------------------
        // [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 [1개 게시판 글 정보] 얻기
        // selectOne 은 1행 m열의 select 결과를 얻을 때 사용하는 메소드이다.  
        // -------------------------------------------
        BoardDTO board = this.sqlSession.selectOne(
            //-----------------------------------------------
            // 실행할 SQL 구문의 위치를 지정하기.
            // 실행할 SQL 구문의 위치 문자열 패턴은 아래와 같다.
            // xml 파일 중에 "mapper태그의namespace명.mapper태그내부의호출할SQL구문소유한태그id값"
            //-----------------------------------------------
            "com.daybreak.prj.BoardDAO.getBoard"	// 실행할 SQL 구문의 위치 지정
            //-----------------------------------------------
            // 실행할 SQL구문에서 사용할 데이터 지정하기
            //-----------------------------------------------
            ,b_no								// 실행할 SQL 구문에서 사용할 데이터 지정
        );                       
        // -------------------------------------------
        // [1개 게시판 글 정보] 리턴하기
        // -------------------------------------------
        return board;
    }

    // ******************************************************
    // [게시판 글 조회수 증가하고 수정행의 개수] 리턴하는 메소드 선언
    // ******************************************************
    public int updateReadcount(int b_no) {
        // ------------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [조회수 증가]하기
        // ------------------------------------------------------------
        int updateCnt = this.sqlSession.update(
            
            "com.daybreak.prj.BoardDAO.updateReadcount" // 실행할 SQL 구문의 위치 지정
            ,b_no                                    // 실행할 SQL 구문에서 사용할 데이터 지정

        );
        return updateCnt;
    }

    // ******************************************************
    // [게시판 글 수정행의 개수] 리턴하는 메소드 선언
    // ******************************************************
    public int updateChange(int b_no) {
        // ------------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [조회수 증가]하기
        // ------------------------------------------------------------
        int updateChange = this.sqlSession.update(
            
            "com.daybreak.prj.BoardDAO.updateChange" // 실행할 SQL 구문의 위치 지정
            ,b_no                                 // 실행할 SQL 구문에서 사용할 데이터 지정

        );
        return updateChange;
    }

    // ******************************************************
    // 삭제/수정할 게시판의 존재 개수를 리턴하는 메소드 선언
    // ******************************************************
    public int getBoardCnt(BoardDTO boardDTO){
        // --------------------------------------------------------
        // [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 [게시판의 존재 개수] 얻기
        // --------------------------------------------------------
        int boardCnt = this.sqlSession.selectOne(
            "com.daybreak.prj.BoardDAO.getBoardCnt"   // 실행할 SQL 구문의 위치 지정
            ,boardDTO                              // 실행할 SQL 구문에서 사용할 데이터 지정
    
        );
        return boardCnt;
    }

    // ******************************************************
    // 삭제/수정할 게시판의 비밀번호 존재 개수를 리턴하는 메소드 선언
    // ******************************************************
    public int getPwdCnt(BoardDTO boardDTO){
        // --------------------------------------------------------
        // [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 [비밀번호 존재 개수] 얻기
        // --------------------------------------------------------
        int pwdCnt = this.sqlSession.selectOne(
            "com.daybreak.prj.BoardDAO.getPwdCnt"   // 실행할 SQL 구문의 위치 지정
            ,boardDTO                            // 실행할 SQL 구문에서 사용할 데이터 지정
    
        );
        return pwdCnt;
    }

    // ******************************************************
    // 게시판 수정 후 수정행의 적용 개수를 리턴하는 메소드 선언
    // ******************************************************
    public int updateBoard(BoardDTO boardDTO){
        //-------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [게시판 수정]하기
        //-------------------------------------------------------
        int updateCnt = this.sqlSession.update(
                "com.daybreak.prj.BoardDAO.updateBoard"  // 실행할 SQL 구문의 위치 지정
                ,boardDTO							  // 실행할 SQL 구문에서 사용할 데이터 지정
        );
        return updateCnt;
    }

    // ******************************************************
    // 삭제할 게시판의 자식글 존재 개수를 리턴하는 메소드 선언
    // ******************************************************
    public int getChildrenCnt(BoardDTO boardDTO){
        //-------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 [자식글 존재 개수] 얻기
        //-------------------------------------------------------
        int childrenCnt = this.sqlSession.selectOne(
                "com.daybreak.prj.BoardDAO.getChildrenCnt"  // 실행할 SQL 구문의 위치 지정
                ,boardDTO							     // 실행할 SQL 구문에서 사용할 데이터 지정
        );
        return childrenCnt;
    }

    // ******************************************************
    // 삭제될 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수를 리턴하는 메소드 선언
    // ******************************************************
    public int downPrintNo(BoardDTO boardDTO){
        //-------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 
        // [삭제될 게시판 이후 글의 출력순서번호를 1씩 감소]하고 감소된 행의 개수 얻기
        //-------------------------------------------------------
        int downPrintNoCnt = this.sqlSession.update(
                "com.daybreak.prj.BoardDAO.downPrintNo"  // 실행할 SQL 구문의 위치 지정
                ,boardDTO							  // 실행할 SQL 구문에서 사용할 데이터 지정
        );
        return downPrintNoCnt;
    }

    // ******************************************************
    // 게시판 삭제 명령한 후 삭제 적용행의 개수를 리턴하는 메소드 선언
    // ******************************************************
    public int deleteBoard(BoardDTO boardDTO){
        //-------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 
        // [게시판 삭제 명령]한 후 삭제 적용행의 개수 얻기
        //-------------------------------------------------------
        int deleteBoardCnt = this.sqlSession.delete(
                "com.daybreak.prj.BoardDAO.deleteBoard"  // 실행할 SQL 구문의 위치 지정
                ,boardDTO							  // 실행할 SQL 구문에서 사용할 데이터 지정
        );
        return deleteBoardCnt;
    }

    // ******************************************************
    // [게시판 글 출력번호 1증가하고 수정 행의 개수] 리턴하는 메소드 선언
    // ******************************************************
    public int updatePrintNo(BoardDTO boardDTO){
        System.out.println("BoardDAOImpl updatePrintNo 메서드 호출 ");
        //-------------------------------------------------------
        // [SqlSessionTemplate 객체]의 update(~,~) 를 호출하여 
        // [게시판 글 출력번호 1증가하고 수정 행의 개수] 얻기
        //-------------------------------------------------------
        int updatePrintNoCnt = sqlSession.update(
           
            "com.daybreak.prj.BoardDAO.updatePrintNo"  // 실행할 SQL 구문의 위치 지정
            ,boardDTO							    // 실행할 SQL 구문에서 사용할 데이터 지정
    
        );
        //-------------------------------------------------------
        // [수정 행의 개수] 리턴하기
        //-------------------------------------------------------
        return updatePrintNoCnt;
    }

    // ******************************************************
    // [검색한 게시판 목록 개수] 리턴하는 메소드 선언
    // ******************************************************
    public int getBoardListCount(BoardSearchDTO boardSearchDTO){
        // -------------------------------------------
        // [SqlSessionTemplate 객체]의 selectOne(~,~) 를 호출하여 [1개 게시판 글 정보] 얻기
        // selectOne 은 1행 m열의 select 결과를 얻을 때 사용하는 메소드이다.  
        // -------------------------------------------
        int getBoardListCount = this.sqlSession.selectOne(
            //-----------------------------------------------
            // 실행할 SQL 구문의 위치를 지정하기.
            // 실행할 SQL 구문의 위치 문자열 패턴은 아래와 같다.
            // xml 파일 중에 "mapper태그의namespace명.mapper태그내부의호출할SQL구문소유한태그id값"
            //-----------------------------------------------
            "com.daybreak.prj.BoardDAO.getBoardListCount"	// 실행할 SQL 구문의 위치 지정
            //-----------------------------------------------
            // 실행할 SQL구문에서 사용할 데이터 지정하기
            //-----------------------------------------------
            , boardSearchDTO
        );                       
        // -------------------------------------------
        // [1개 게시판 글 정보] 리턴하기
        // -------------------------------------------
        System.out.println("BoardDAOImpl 게시판 목록 검색개수 확인 =>" + getBoardListCount);
        return getBoardListCount;
    }
*/   
    
}
