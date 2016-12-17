window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var buttons = document.getElementsByTagName("button");
    for (i = 0; i < buttons.length; i++) {
        var button = buttons[i];
  /*      button.addEventListener('click',function() {
     show_hide();
     buttonColor();
});*/
          button.addEventListener('click', show_hide, false);}
 
}


function show_hide() {
  if (this.style.backgroundColor != 'transparent') {
    this.style.backgroundColor = 'transparent';
  } else {
    this.style.backgroundColor = '';
  }
	var matchingElements = document.getElementsByClassName(this.className);
	for (i = 0; i <matchingElements.length; i++) {
		console.log("in show_hide for");

		if (matchingElements[i] != this) {
			console.log("in not this");
			if (matchingElements[i].style.display == 'block') {
		        matchingElements[i].style.display = 'none';
		        console.log("unhide");
   			} else {
		        matchingElements[i].style.display = 'block';
			}
		}
	}
}