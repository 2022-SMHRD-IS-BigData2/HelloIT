const wrap = document.querySelector(".wrap");
const header = document.querySelector(".header");
let lastX = 0;
let lastY = 0; 
let startX = 0; 
let startY = 0; 

// 1.
header.addEventListener('mousedown', function(e){
  e.preventDefault(); 
  startX = e.clientX; 
  startY = e.clientY; 
	
  
  // 3.
  document.addEventListener('mouseup', onRemoveEvent); 
  
  // 4.
  document.addEventListener('mousemove', onMove); 
});

function onRemoveEvent() { 
  header.classList.remove('active');
  document.removeEventListener('mouseup', onRemoveEvent); 
  document.removeEventListener('mousemove', onMove); 
} 

function onMove(e) { 
  e.preventDefault(); 
  lastX = startX - e.clientX; 
  lastY = startY - e.clientY; 

  startX = e.clientX; 
  startY = e.clientY; 

  wrap.style.top = `${wrap.offsetTop - lastY}px`;
  wrap.style.left = `${wrap.offsetLeft - lastX}px`;
}