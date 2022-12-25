// 창 클릭하면 나타나면서 사라지기도 하는 동작 구현




var hideWindow = document.getElementById('hideWindow')

	hideWindow.onclick = function(){
		document.getElementById('logWinShow').className='active';
		document.getElementById('loginMain').style.display='none';
          }
          
 // js파일에서 jQuery 실행 하는 법 확인하기
/*
var script = document.createElement('script');
script.src = 'https://code.jquery.com/jquery-3.4.1.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);     
$('logWinShow').on('click',function(){
	if($(this).attr('class')=='showHide'){
		$(this).addClass('active')
		$('#loginMain').hide();
	}else{
		$(this).removeClass('active')
		$('#loginMain').show();
	}
})
*/