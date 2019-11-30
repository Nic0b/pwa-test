$(document).ready(function(){
	$('.sidenav').sidenav();
    $('.tabs').tabs();
    $('.collapsible').collapsible();
    fetchTopFive('javascript');
    changeText();
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
function changeText() {
  var p = document.getElementById("pid");

  p.style.color = "blue"
  p.style.fontSize = "18pt"
}





document.addEventListener('click', event => {
fetch('https://ai-for-good-api.herokuapp.com/api/v1/data')
.then(response => response.json())
.then(data => {
  console.log(data) // Prints result from `response.json()` in getRequest
})
.catch(error => console.error(error))

});