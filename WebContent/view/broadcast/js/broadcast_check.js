var s;

var url = '/YORIZORI/';


function select(year, month, date) {
	var list = document.getElementById('list');
	var btn1 = document.getElementById('btn1');
	btn1.disabled = true;
	s = date;
	while (list.hasChildNodes()) {
		list.removeChild(list.firstChild);
	}
	list.innerHTML = year + '년 ' + month + '월 '+date+'일 방송목록';
	for(var i = 0; i <= 23; i++){
		var div = document.createElement('div');
		var radio = 
			'<input type="radio" name="times" '
			+ 'class="'+year + vail(month)
			+ vail(date) +'" value="'+year +vail(month)+
			 vail(date) + vail(i) +'" onclick="abled();"/>'+vail(i)+'시~ ' +vail(i+1) +'시';
			list.appendChild(div);
			div.innerHTML = radio;
	}
	
}
function abled(){
	var btn1 = document.getElementById('btn1');
	btn1.disabled = false;
}
function broadcastcheck(year, month){
	var times = document.getElementsByName('times');
	var chked;
	for(var i = 0; i < times.length; i++){
		if(times[i].checked){
			chked = times[i].value;
		}
	}
	window.open(url + "broadcast.do?command=list&year="+year+"&month="+month+"&date="+s +"&time="+chked, "방송리스트", "toolbars=no, scrollbars=no, location=yes");
}
function move(){
	var name = document.getElementById('idchecker').value;
	window.open(url +'broadcast.do?command=checklist&name='+name, "예약리스트","toolbars=no, scrollbars=no, location=yes, width=600, height=500, resizable=0");
}
function vail(msg){
	console.log(msg.toString().length);
	return (msg.toString().length <2)? "0"+msg : msg;
}