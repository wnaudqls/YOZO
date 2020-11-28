<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


body {
  width: 300px;
  margin: 0 auto;
  padding-top: 8rem;
}

fieldset {
  position: relative;
  display: inline-block;
  padding: 0 0 0 40px;
  background: #fff;
  border: none;
  border-radius: 5px;
}

input,
button {
  position: relative;
  width: 200px;
  height: 50px;
  padding: 0;
  display: inline-block;
  float: left;
}

input {
  color: #666;
  z-index: 2;
  border: 0 none;
}
input:focus {
  outline: 0 none;
}
input:focus + button {
  -webkit-transform: translate(0, 0);
      -ms-transform: translate(0, 0);
          transform: translate(0, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}


button {
  z-index: 1;
  width: 50px;
  border: 0 none;
  background: pink;
  cursor: pointer;
  border-radius: 0 5px 5px 0;  
  -webkit-transform: translate(-50px, 0);
      -ms-transform: translate(-50px, 0);
          transform: translate(-50px, 0);
  -webkit-transition-duration: 0.3s;
          transition-duration: 0.3s;
}



</style>


</head>
<body>
<form><fieldset><input type="search" placeholder="레시피 검색"/><button type="submit"><i class="fa fa-search" style="color:white"><strong>검색</strong></i></button></fieldset></form>
</body>
</html>