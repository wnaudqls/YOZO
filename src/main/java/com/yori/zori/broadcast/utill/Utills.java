package com.yori.zori.broadcast.utill;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import com.yori.zori.model.dto.CalDto;


public class Utills {
	private String toDates;
	public String getToDates() {
		return toDates;
	}
	/*
	public void setToDates(String mdate) {
		//yyyy-mm-dd hh:mm:00
		String m = mdate.substring(0,4) + "-"
				+ mdate.substring(4,6) + "-"
				+ mdate.substring(6,8) + " "
				+ mdate.substring(8, 10) + ":"
				+ mdate.substring(10) + ":00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 MM분 SS초");
		// SimpleDataFormat: 입력한 String 타입의 날짜를  원하는 형식으로 변환해주기도 하교 역으로도 가능함
		Timestamp tm = Timestamp.valueOf(m);
		// Timestamp: 나노세컨드 형식으로 가지고 있음
		// yyyy-mm-dd hh:mm:ss 형식으로 입력해주면 데이터 형태로 반환해줌
		// Timestamp.valueOf: TimeStamp 형식의 String 객체를 Timestamp 값으로 반환
		toDates = sdf.format(tm);
		// Date 형태를 날짜 형태의 String로 리턴
	}
	*/
	//한자리수 숫자에 0을 붙혀주는 메서드
	public static String vail(String msg) {
		
		return (msg.length()<2)? "0"+msg : msg;
		//길이가 2보다 작으면(한자리 수) 0을 붙히고 아니면 그냥 냅둠
	}
	//달력의 토요일, 일요일, 평일 색상 설정
	
	public static String fontColor(int date, int DOW) {
		String color = "";
		if(((DOW - 1 + date)&7) == 0) {
			color = "blue";
		}else if(((DOW - 1 + date)&7) == 1) {
			color = "red";
		}else {
			color = "black";
		}
		return color;
	}
	/*
	public static String getViewTitle(int i , List<CalDto> clist) {
		String date = vail(i+"");
		String res = "";
		for(CalDto dto : clist) {
			//yyyyMMddHHmm
			if(dto.getMdate().substring(6,8).equals(date)) {
				res += "<p>"+((dto.getTitle().length()>6)? 
						dto.getTitle().substring(6,8)+"..."
						: dto.getTitle())+"</p>";
			}
		}
		return res;
	}
	*/
}
