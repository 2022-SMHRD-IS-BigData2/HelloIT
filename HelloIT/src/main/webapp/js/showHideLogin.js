// 창 클릭하면 나타나면서 사라지기도 하는 동작 구현


var logWinShow = document.getElementById('logWinShow')

	logWinShow.onclick = function(){
        	  if(this.className=='showHide'){
        		  this.className='active';
        		  document.getElementById('loginMain').style.display='none';
        	  }else{
        		  this.className='showHide'        		  
        		  document.getElementById('loginMain').style.display='';
        	  }
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