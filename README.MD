# 기업연수 교육 내용 

## 환경 세팅
```bash
JDK 1.80_241
Oracle Database 11g Express
Eclipse EE 2020-03
Apache Tomacat 8.5.54
```

## 1일 간단한 보드 게시판 코드 리뷰 및 질응답
SQL 구문
JAVA/SPRING 라이브러리 및 함수 사용
JSP에서 JAVASCRIPT/JQUERY 사용방법 및 간단한 작동원리
중복코드 제거
게시판 수정/삭제 작업을 위한 버튼?링크? 만들기

## 2일 
수정/삭제 기능 만들기
Oracle insert 구문에 NVL이라는 문구를 넣어줌

###NVL의 역할
 - NVL(MAX( [컬럼] ) , [치환할 값]) + 1
 - NVL함수를 사용하는 이유는 MAX해서 가져와야할 컬럼에 0이 처음에 들어있는경우 에러가 떨어지기 때문

게시글을 insert할때 board_num에 계속 null값이 들어감 찾아보니
null일때 대체값으로 변환되어 MAX+1처리를 해준다.
삭제기능 만들던중 JQUERY 버튼 작동하는 법을 몰라서 하루종일 구글링 해결못함(집에서 작업중)
