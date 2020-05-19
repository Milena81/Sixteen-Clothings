var ratedIndex = -1;

$(document).ready(function () {
    resetStarColors();

    if(localStorage.getItem('ratedIndex') != null)
          setStars(parseInt(localStorage.getItem('ratedIndex')));

    $('.fa-star').on('click', function () {
        ratedIndex = parseInt($(this).data('index'));
        localStorage.setItem('ratedIndex', ratedIndex);
    });

    $('.fa-star').mouseover(function () {
        resetStarColors();
        var currentIndex = parseInt($(this).data('index'));
        setStars(currentIndex);
    });

    $('.fa-star').mouseleave(function () {
        resetStarColors();

        if (ratedIndex != -1)
            setStars(ratedIndex);
    });
});

function setStars(max) {
    for (var i = 0; i <= max; i++)
        $('.fa-star:eq(' + i + ')').css('color', 'goldenrod');
}

function resetStarColors() {
    $('.fa-star').css('color', 'red');
}

// $(document).ready(function() {
//     resetStarColors();
//
//     $('.fa-star').mouseover(function () {
//         resetStarColors();
//
//         var currentIndex = parseInt($(this).data('index'));
//
//         for( var i=0; i<= currentIndex; i++)
//             $('.fa-sta:eq('+i+')').css('color', 'goldenrod');
//     });
//
//     $('.fa-star').mouseleave(function () {
//         resetStarColors();
//     });
// });
//
// function resetStarColors() {
//     $('.fa-star').css('color', 'red');
// }

//initial setup
/*document.addEventListener('DOMContentLoaded', function(){
    addListeners();
    setRating(); //based on value inside the div
});

function addListeners(){
    var stars = document.querySelectorAll('.star');
    [].forEach.call(stars, function(star, index){
        star.addEventListener('click', (function(idx){
            console.log('adding rating on', index);
            document.querySelector('.stars').setAttribute('data-rating',  idx + 1);
            console.log('Rating is now', idx+1);
            setRating();
        }).bind(window,index) );
    });

}

function setRating(){
    var stars = document.querySelectorAll('.star');
    var rating = parseInt( document.querySelector('.stars').getAttribute('data-rating') );
    [].forEach.call(stars, function(star, index){
        if(rating > index){
            star.classList.add('rated');
            console.log('added rated on', index );
        }else{
            star.classList.remove('rated');
            console.log('removed rated on', index );
        }
    });
}
*/
