function getTime(){
    //var ymd = document.querySelector('#ymd');
    var hms = document.querySelector('#hms');
    var date = new Date();
    //var year = date.getFullYear();
    //var month = date.getMonth();
    //var day = date.getDate();
    var hour = date.getHours();
    var min = date.getMinutes();
    //var sec = date.getSeconds();
    // clockTitle.innerText=`${year}년 ${(month+1)<10?`0${(month+1)}`:(month+1)}월 ${day<10?`0${day}`:day}일 ${hour<13?` 오전 ${(hour-12)<10?`0${(hour-12)}`:(hour-12)}`:` 오후 ${(hour-12)<10?`0${(hour-12)}`:(hour-12)}`}시 ${min<10?`0${min}`:min}분 ${sec<10?`0${sec}`:sec}초`;
    if (hour>12){
        var nightDay = '오후';
        hour = date.getHours()-12;
    }else if(hour>=0 & hour<=12){
        nightDay = '오전'
    }
    if (min<10){
		min = '0'+min;
	}
    //ymd.innerText=year+'-'+(month+1)+'-'+day;
    hms.innerText=nightDay+' '+hour+':'+min;
}
getTime();
setInterval(getTime, 1000);