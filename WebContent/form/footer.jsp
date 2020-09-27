<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

<style type="text/css">
   /*푸터*/
      footer {
         /*    clear:both; */
          position: static;
           width: 100%; 
          /* bottom: 50px; */
        /*   margin-top: -50px; */
          /* border-top: 1px solid black; */
          background-color: white;
          text-align: center;
          border: 0px;
          margin:0px;
          padding:0px;
          clear:both;
         
      }
      
      #info {
         display: inline-block;
           border: 0px;
          margin-top:20px;
          padding:0px;
          font-size:12px;
          color : black;
      }
      #kh{
      margin:10px 0 5px 0;
         text-align : center;
      }
   /*푸터*/
   </style>
</head>
<footer>
      <div id="info">
         <b>CREATORS</b> <br>
         이현승 : https://github.com/LHSEUNGG<br>
         최유정 : https://github.com/LIEBEALLES<br>
         박진석 : https://github.com/parkjin1407<br>
         주명빈 : https://github.com/wnaudqls<br>
         이병욱 : https://github.com/rpget2020<br>
         성현모 : https://github.com/shm1113<br>
      </div>
      
      <div id = "kh">
         KH정보교육원 &copy; all rights reserved ...
      </div>
   </footer>
</html>