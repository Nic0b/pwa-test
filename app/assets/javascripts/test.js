$(document).ready(function(){
	$('.sidenav').sidenav();
    $('.tabs').tabs();
    $('.collapsible').collapsible();
   });


  async function fetchTopFive(sub) {
  const URL = `https://www.reddit.com/r/${sub}/top/.json?limit=5`;
  try {
    const fetchResult = fetch(
      new Request(URL, { method: 'GET', cache: 'reload' })
    );
    const response = await fetchResult;
    const jsonData = await response.json();
    console.log(jsonData);
  } catch(e){
    throw Error(e);
  }
}
// function changeText() {
//   var p = document.getElementById("pid");

//   p.style.color = "blue"
//   p.style.fontSize = "18pt"
// }





