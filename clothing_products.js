function myFunction() {
    document.open();
    document.write("<h1>Hello World</h1>");
    document.close();
}

function myFunction1() {
    var myWindow = window.open("", "MsgWindow", "width=200,height=100");
    myWindow.document.write("<p>This is 'MsgWindow'. I am 200px wide and 100px tall!</p>");
}

function myFunction2() {
    var w = window.open();
    w.document.open();
    w.document.write("<h1>Hello World!</h1>");
    w.document.close();
}

/////////////////////filtering buttons////////////////////
filterSelection("all")
function filterSelection(c){
    var x, i;
    x = document.getElementsByClassName("category");
    if (c == "all") c = "";
    for (i=0;i<x.length; i++) {
        removeClass(x[i], "all");
        if (x[i].className.indexOf(c) > -1) addClass(x[i], "all");
    }
}

function addClass(element, name) {
    var i, arr1, arr2;
    arr1 = element.className.split(" ");
    arr2 = name.split(" ");
    for(i=0;i<arr2.length;i++) {
        if(arr1.indexOf(arr2[i]) == -1) {
            element.className += " " + arr2[i];
        }
    }

    function removeClass(element, name) {
        var i, arr1, arr2;
        arr1 = element.className.split(" ");
        arr2 = name.split(" ");
        for (i = 0; i < arr2.length; i++) {
            while (arr1.indexOf(arr2[i]) > -1) {
                arr1.splice(arr1.indexOf(arr2[i]), 1);
            }
        }
        element.className = arr1.join(" ");
    }

    //Add active class to the current button (highlight it)
    var btnFilters = document.getElementById("filters");
    var btns = btnFilters.getElementsByClassName("btn");
    for(var i=0; i<btns.length; i++) {
        btns[1].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
}

// Add active class to the current button (highlight it)
var header = document.getElementById("myDIV");
var btns = header.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
    btns[i].addEventListener("click", function() {
        var current = document.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        this.className += " active";
    });
}

/*scroll-to-top button new of Milena :) */
$(document).ready(function () {
    var offset = 220;
    var duration = 500;
    $(window).scroll(function () {
        if ($(this).scrollTop() > offset) {
            $('#scrollToTop').fadeIn(duration);
        } else {
            $('#scrollToTop').fadeOut(duration);
        }
    });
    $('#scrollToTop').click(function (event) {
        event.preventDefault();
        $('html, body').animate({ scrollTop: 0 }, 800);
        return false;
    });
});
function link() {
    var link_s = document.getElementById('link_id').value;
    document.getElementById('link_str').innerHTML = link_s.link()
}