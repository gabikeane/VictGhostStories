window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var buttons = document.getElementsByTagName("button");
    var button = buttons[0];
    button.addEventListener('click', show_hide, false);
}

function show_hide() {
    var p1 = document.getElementById("paragraphToToggle1");
    if (p1.style.display == '') {
        p1.style.display = 'none';
    } else {
        p1.style.display = '';
    }
    
    var p2 = document.getElementById("paragraphToToggle2");
    if (p2.style.display == '') {
        p2.style.display = 'none';
    } else {
        p2.style.display = '';
    }
    var p3 = document.getElementById("paragraphToToggle3");
    if (p3.style.display == '') {
        p3.style.display = 'none';
    } else {
        p3.style.display = '';
    }
    var p4 = document.getElementById("paragraphToToggle4");
    if (p4.style.display == '') {
        p4.style.display = 'none';
    } else {
        p4.style.display = '';
    }
    var p5 = document.getElementById("paragraphToToggle5");
    if (p5.style.display == '') {
        p5.style.display = 'none';
    } else {
        p5.style.display = '';
    }
}