//모듈 불러옴
var express = require('express');
var https = require('https');
var io = require('socket.io');
var port = 9001;
var app_3 = express();
var fs = require('fs');
var RTCMultiConnectionServer = require('rtcmulticonnection-server');
//ssl 인증서 불러옴
var options = {
		key : fs.readFileSync('test/private.key'),
		cert : fs.readFileSync('test/private.crt'),
		
};

// 서버 민들기
var server = https.createServer(options,function(){
	
});


//서버 포트 설정

server.listen(port);


//socket.io 인스턴스 생성할 서버를 지정함
var socket = io.listen(server);

// 클라이언트 접속했을때
socket.on('connection', function(socket){ 
    console.log('클라이언트의 접속이 감지되었습니다.');	
	//socket.io에 연결한 객체를 추가
    RTCMultiConnectionServer.addSocket(socket);
   
    const params = socket.handshake.query;
    
  
    if (!params.socketCustomEvent) {
        params.socketCustomEvent = 'custom-message';
    }
   
    socket.on(params.socketCustomEvent, function(message) {
        socket.broadcast.emit(params.socketCustomEvent, message);
    });
    
    socket.on('disconnect',function(){
        //clearInterval(interval);
        console.log('클라이언트가 접속이 끊었습니다.');
    });
});


console.log("127.0.0.1:"+port+" 서버 개설완료");