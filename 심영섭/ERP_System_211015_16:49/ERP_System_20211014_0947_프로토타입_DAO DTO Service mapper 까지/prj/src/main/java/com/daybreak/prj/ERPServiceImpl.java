package com.daybreak.prj;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// [서비스 클래스]인 [BoardServiceImpl 클래스]선언
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // [서비스 클래스]에는 @Service 와 @Transactional 를 붙인다. 
    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // @Service         => [서비스 클래스] 임을 지정하고 bean 태그로 자동 등록된다.
    // @Transactional   => [서비스 클래스]의 메소드 내부에서 일어나느 모든 작업에는 [트랜잭션]이 걸린다.  
// mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
@Service
@Transactional
public class ERPServiceImpl implements ERPService {

    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // 속성변수 boardDAO 선언하고, [BoardDAO 인터페이스]를 구현한 클래스를 객체화 해서 저장한다.
    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
        // @Autowired 역할 => 속성변수에 붙은 자료형인 [인터페이스]를 구현한 [클래스]를 객체화하여 저장한다.
    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    @Autowired
    private ERPDAO erpDAO;




































    














































    // ===================================================================================
    // 게시판 ServiceImpl 참고용 주석. 삭제하지마시고, 그냥 코드들 참고하시고 위에 코딩 해주세요.
    // ===================================================================================
/*
    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // 업로드 파일의 저장 경로 저장하는 속성변수 선언하기. 
    // Info 클래스의 속성변수 board_pic_dir 안의 데이터를 속성변수 uploadDir 에 저장하기.  
    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // String uploadDir = "C:\\Users\\SungWoo\\Desktop\\GitHub\\new-study-repository\\JSP.Spring\\workspace_sboot_01\\prj01\\src\\main\\resources\\static\\resources\\img\\";
    String uploadDir = Info.board_pic_dir;

    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // application.properties 파일에 board_pic_dir 라는 변수에 설정된 문자를 속성변수 uploadDir 에 저장하기
    // 어노테이션 방법. 
    // mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
    // @Value("${board_pic_dir}")
    // String uploadDir2;

	// ****************************************************
    // [1개 게시판 글 입력 후 입력 적용 행의 개수] 리턴하는 메소드 선언
	// ****************************************************
    public int insertBoard( BoardDTO boardDTO, MultipartFile multi ) throws Exception{

        // ---------------------------------------
        // 사용자 정의 FileUpLoad 객체 생성하기    
        // ---------------------------------------
        FileUpLoad fileUpLoad = new FileUpLoad(multi);
        // ---------------------------------------
        // boardDTO 객체에 새로운 파일명 저장하기.
        // ---------------------------------------
        boardDTO.setPic(fileUpLoad.getNewFileName());

        // MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        // DB 연동코드
        // MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
        // ---------------------------------------
        // 만약 엄마글의 글 번호가 1 이상이면 댓글쓰기 이므로
        // 엄마 글 이후의 게시판 글에 대해 출력순서번호를 1 증가 시키기.
        // ---------------------------------------
        if( boardDTO.getB_no()>0 ){
            // ---------------------------------------
            // BoardDAOImpl 객체의 updatePrintNo 메소드를 호출하여 출력 순서 번호를 1증가시키고
            // 수행정에 적용 개수를 리턴받는다.
            // 게시판 글이 입력되는 부분 이후 글들은 출력 순서번호를 1씩 증가하여야 한다.   
            // 게시판 테이블 분석 요망. 오늘 집에 가서 게시판 테이블 분석해야함.  
            // ---------------------------------------
            int updatePrintNoCnt = this.boardDAO.updatePrintNo(boardDTO); 
        }
        // ---------------------------------------
        // BoardDAOImpl 객체의 insertBoard 메소드 호출하여 게시판 글 입력 후 입력 적용 행의 개수 얻기
        // ---------------------------------------
        int boardRegCnt = this.boardDAO.insertBoard(boardDTO);
        // MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM

        // ---------------------------------------
        // 파일 업로드 하기
        // ---------------------------------------
        fileUpLoad.uploadFile(uploadDir);
        // ---------------------------------------
        // 1개 게시판 글 입력 적용 행의 개수 리턴하기
        // ---------------------------------------
        System.out.println("BoardServiceImpl. insertBoard() 메서드 수행완료\r");
        return boardRegCnt;

    }

	// ****************************************************
    // [1개 게시판 글] 리턴하는 메소드 선언
	// ****************************************************
    public BoardDTO getBoard(int b_no) {
        // -------------------------------------------
        // [BoardDAOImpl 객체]의 updateReadcount 메소드를 호출하여 
        // [조회수 증가]하고 수정한 행의 개수를 얻는다
        // -------------------------------------------
        int updateCnt = this.boardDAO.updateReadcount(b_no);
        // -------------------------------------------
        // 수정한 행의 개수가 0이면 null 리턴하기
        // 즉, 수정한 행의 개수가 0이면 대상 게시판 글이 누군가 삭제했다면, null 리턴하기.
        // <참고> 업데이트의 결과가 0이면 조건에 맞는 것이 없어서 업데이트를 못한것이다.  
        // -------------------------------------------
        if( updateCnt == 0 ){ return null; }
        // -------------------------------------------
        // BoardDAOImpl 객체의 getBoard 메소드를 호출하여
        // [1개 게시판 글]을 얻는다
        // -------------------------------------------
        BoardDTO board = this.boardDAO.getBoard(b_no); 
        // -------------------------------------------
        // [1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
        // -------------------------------------------
        return board;

    }

    // ****************************************************
    // [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
    // ****************************************************
    public int updateBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception{
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getBoardCnt 메소드를 호출하여
        // 수정할 게시판의 존재 개수를 얻는다.
        // --------------------------------------
        int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
        if(boardCnt==0) {return -1;}
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getPwdCnt 메소드를 호출하여
        // 수정할 게시판의 비밀번호 존재 개수를 얻는다.
        // --------------------------------------
        int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
        if(pwdCnt==0) {return -2;}

        // ---------------------------------------
        // 사용자 정의 FileUpLoad 객체 생성하기    
        // 업로드한 파일의 새로운 이름정하기
        // 삭제 체크 여부 구하기
        // ---------------------------------------
        FileUpLoad fileUpLoad = new FileUpLoad(multi);
        String newFileName = null;
        String is_del = boardDTO.getIs_del();
        // ---------------------------------------
        System.out.println("BoardServiceImpl.java 에서, getIs_del 값 확인 -====>" + is_del);
        // ---------------------------------------
        // 업로드한 파일의 새로운 이름 구하기
        // BoardDTO 객체에 새로운 파일명 저장하기
        // ---------------------------------------
        newFileName = fileUpLoad.getNewFileName(is_del==null);
        boardDTO.setPic(newFileName);

        // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        // DB 연동.
        // ---------------------------------------
        // board 테이블에 있는 기존 이미지 이름가져오기
        // ---------------------------------------
        String pic = this.boardDAO.getPic(boardDTO);
        // --------------------------------------
        // [BoardDAOImpl 객체]의 updateBoard 메소드를 호출하여
        // 게시판 수정 명령한 후 수정 적용행의 개수를 얻는다.
        // --------------------------------------
        int updateCnt = this.boardDAO.updateBoard(boardDTO);
        // xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

        // ---------------------------------------
        // 삭제가 체크 안돼 있으면
        // ---------------------------------------
        if( is_del==null ){
            // board 테이블에 이미지 이름이 있으면 파일 삭제하기 
            fileUpLoad.delete(
                uploadDir+pic
                , multi!=null && multi.isEmpty()==false && pic!=null && pic.length()>0
            );
            // 파일 업로드하기
            fileUpLoad.uploadFile(uploadDir);
        } 
        // ---------------------------------------
        // 삭제가 체크되어 있으면
        // ---------------------------------------
        else{
            fileUpLoad.delete(uploadDir+pic, pic!=null && pic.length()>0 );
        }
        // --------------------------------------
        // 게시판 수정 명령한 후 수정 적용행의 개수를 리턴하기.
        // --------------------------------------
        return updateCnt;
    }

    // ****************************************************
    // [1개 게시판] 삭제 후 삭제 적용행의 개수를 리턴하는 메소드 선언
    // ****************************************************
    public int deleteBoard(BoardDTO boardDTO){
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getBoardCnt 메소드를 호출하여
        // 삭제할 게시판의 존재 개수를 얻는다.
        // --------------------------------------
        int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
        if(boardCnt==0) {return -1;}
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getPwdCnt 메소드를 호출하여
        // 삭제할 게시판의 비밀번호 존재 개수를 얻는다.
        // --------------------------------------
        int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
        if(pwdCnt==0) {return -2;}
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getChildrenCnt 메소드를 호출하여
        // [삭제할 게시판의 자식글 존재 개수]를 얻는다.
        // --------------------------------------
        int childrenCnt = this.boardDAO.getChildrenCnt(boardDTO);
        if(childrenCnt>0) {return -3;}

        // --------------------------------------
        // board 테이블에 있는 기존 이미지 이름 가져오기
        // --------------------------------------
        String pic = this.boardDAO.getPic(boardDTO);

        // --------------------------------------
        // [BoardDAOImpl 객체]의 downPrintNo 메소드를 호출하여
        // [삭제될 게시판 이후 글의 출력 순서번호를 1씩 감소 시킨 후 수정 적용행의 개수]를 얻는다
        // --------------------------------------
        int downPrintNoCnt = this.boardDAO.downPrintNo(boardDTO);
        // --------------------------------------
        // [BoardDAOImpl 객체]의 deleteBoard 메소드를 호출하여
        // [게시판 삭제 명령 한 후 삭제 적용행의 개수]를 얻는다.
        // --------------------------------------
        int deleteCnt = this.boardDAO.deleteBoard(boardDTO);

        // --------------------------------------
        // 파일 삭제하기
        // --------------------------------------
        if( pic!=null && pic.length()>0 ){
            File file = new File( uploadDir + pic);
            file.delete();
        }
        return deleteCnt;
    }
*/


    
/*
    // ****************************************************
    // [1개 게시판] 수정 실행하고 수정 적용행의 개수를 리턴하는 메소드 선언
    // ****************************************************
    public int updateBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception{
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getBoardCnt 메소드를 호출하여
        // 수정할 게시판의 존재 개수를 얻는다.
        // --------------------------------------
        int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
        if(boardCnt==0) {return -1;}
        // --------------------------------------
        // [BoardDAOImpl 객체]의 getPwdCnt 메소드를 호출하여
        // 수정할 게시판의 비밀번호 존재 개수를 얻는다.
        // --------------------------------------
        int pwdCnt = this.boardDAO.getPwdCnt(boardDTO);
        if(pwdCnt==0) {return -2;}

        // ---------------------------------------
        // 업로드한 파일의 새로운 이름정하기
        // ---------------------------------------
        // 업로드한 파일의 파일확장자 포함 새 파일명 저장변수 선언하기. 파일명에는 확장자가 포함한다.  
        String newFileName = null;
        String is_del = boardDTO.getIs_del();

        System.out.println("BoardServiceImpl.java 에서, getIs_del 값 확인 -====>" + is_del);

        // 만약 업로드된 파일이 있으면 
        if( multi!=null && multi.isEmpty()==false && is_del==null ){
            // 업로드한 파일의 원래 파일명 얻기. 파일명에는 확장자가 포함한다.  
            String oriFileName = multi.getOriginalFilename();
            // 업로드한 파일의 파일 확장자 얻기
            String file_extension = oriFileName.substring( oriFileName.lastIndexOf(".")+1 );

            // 고유한 새 파일명 얻기. 파일명에는 확장자가 포함한다. 
            newFileName = UUID.randomUUID() + "." + file_extension;
            // boardDTO 객체에 새로운 파일명 저장하기.
            boardDTO.setPic(newFileName);
        }
        // --------------------------------------
        // board 테이블에 있는 기존 이미지 이름 가져오기
        // --------------------------------------
        String pic = this.boardDAO.getPic(boardDTO);
        
    // // --------------------------------------
    // // 만약에 삭제가 체크되어 있고, 기존 이미지 파일 명이 board 테이블에 존재하면,  
    // // --------------------------------------
    // if( is_del!=null && pic!=null ){
    //     // board 테이블에 이미지파일 이름을 삭제하기  
    //     int picDelCnt = this.boardDAO.delPic(boardDTO);
    // }

        // --------------------------------------
        // [BoardDAOImpl 객체]의 updateBoard 메소드를 호출하여
        // 게시판 수정 명령한 후 수정 적용행의 개수를 얻는다.
        // --------------------------------------
        int updateCnt = this.boardDAO.updateBoard(boardDTO);

        // ---------------------------------------
        // 파일 업로드 하기
        // ---------------------------------------
        if( is_del==null ){
            // 만약 업로드된 파일이 있으면 
            if( multi!=null && multi.isEmpty()==false && is_del==null ){
                // ---------------------------------------
                // 기존 이미지 파일 삭제 하기
                // ---------------------------------------
            
                // board 테이블에 이미지 이름이 있으면 파일 삭제하기 
                if(pic!=null && pic.length()>0){
                    File file = new File( uploadDir + pic);
                    file.delete();
                }
                // 새 파일을 생성하기 File 객체를 생성하면 새 파일을 생성할 수 있다.  
                File file = new File( uploadDir + newFileName );
                // 업로드한 파일을 새 파일에 전송하여 덮어쓰기
                multi.transferTo(file);
            }
        } else{
            if( pic!=null ){

                File file = new File( uploadDir + pic);

                System.out.println("삭제대상 파일이름확인 =====> " + file);

                file.delete();
            }
        }

        // --------------------------------------
        // 게시판 수정 명령한 후 수정 적용행의 개수를 리턴하기.
        // --------------------------------------
        return updateCnt;
    }
*/


}
