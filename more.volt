<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/css/fontawesome.css">
<!--     <link rel="stylesheet" href="/css/stars1.css"> -->
    <link rel="stylesheet" href="/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="/css/owl.css">
    <link rel="stylesheet" href="/css/clothing-products.css">


{{ content() }}

{{ flashSession.output() }}

<div class="container-fluid">
    <div class="row">
    <!--Heading section-->
            <div class="section-heading">
              <h2>More information about:  <span style="color: Cornflowerblue;">{{title}}</span></h2>
            </div>
            <div>
<!--               <a href="/our_clothing_products/index/" title="view all products" class="btn btn-success">view all products <i class="fa fa-angle-right"></i></a> -->
<!--               <a href="/about_us_clothing/index/" title="more information about us" class="btn btn-danger">About Us <i class="fa fa-angle-right"></i></a> -->
<!--               <a href="/contact_us_clothing/index/" title="our location..." class="btn btn-info">Contact Us <i class="fa fa-angle-right"></i></a> -->
            </div>
        <br />
    <!--Heading section ends-->
            {% set filesCount = product.getProductFiles() | length %}
                {% if filesCount > 0 %}
          <div class="col-lg-8 col-md-8">
            <div class="right-image" style="opacity: 90%;">
            <a href="/images/{{product.getProductFiles()[0].filename}}">
              <img src="/images/{{product.getProductFiles()[0].filename}}"
              alt="{{product.getProductFiles()[0].filename}}" class="img-rounded" width="600" height="300"/>
            </a>
            </div>
          </div>
{% endif %}
          <div class="col-lg-4 col-md-4">
            <div class="left-content">
              <a href="#"><h4>{{title}}</h4></a><br />
              <h4 style="color:red;">$ {{ "%.2f"|format(price) }} </h4><br />
              <p> {{description}} </p><br />
                 <i class="fa fa-star fa-1x" data-index="0"></i>
                 <i class="fa fa-star fa-1x" data-index="1"></i>
                 <i class="fa fa-star fa-1x" data-index="2"></i>
                 <i class="fa fa-star fa-1x" data-index="3"></i>
                 <i class="fa fa-star fa-1x" data-index="4"></i>
                 <span><a href="#" style="color:red;">Total Rating Reviews ({{ "%.2f"|format(average) }})</a><br /></span><br />
                 <span><a href="/clothing_products/review/{{product.id}}" class="btn btn-danger">Write a Review</a></span>
                 <span><a href="/clothing_products/purchase/{{product.id}}" class="btn btn-success">Purchase</a></span><br /><br />
                 <span><a href="/clothing_products/index/" title="back to latest products" class="btn btn-warning">view latest products
                 <i class="fa fa-angle-right"></i></a></span><br />
                 <div class="down-content"><br />
                     <ul class="social-icons">
                         <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                         <li><a href="https://twitter.com/login"><i class="fa fa-twitter"></i></a></li>
                         <li><a href="https://bg.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                         <li><a href="https://fontawesome.com/v4.7.0/icon/behance"><i class="fa fa-behance"></i></a></li>
                     </ul>
                 </div>
            </div>
          </div>
    </div>
</div>

<div class="col-md-12">
<!--items Reviews: reviewer_name, title_review, review_content and rating-->
<br />
{% for post in posts %}
       <p><b><span style="color:Cornflowerblue;">Reviewer's name:</span></b> {{ post.reviewer_name }}</p>
       <p><b><span style="color:Cornflowerblue;">Reviewer's id:</span></b> {{ post.product_id }}</p>
       <p><b><span style="color:Cornflowerblue;">Review title:</span></b> {{ post.title_review }}</p>
       <p><b><span style="color:Cornflowerblue;">Content:</span></b> {{ post.review_content }}</p>
       <div>
<!--            <i class="fa fa-star fa-1x" data-index="0"></i> -->
<!--            <i class="fa fa-star fa-1x" data-index="1"></i> -->
<!--            <i class="fa fa-star fa-1x" data-index="2"></i> -->
<!--            <i class="fa fa-star fa-1x" data-index="3"></i> -->
<!--            <i class="fa fa-star fa-1x" data-index="4"></i> -->
          <span><a href="#" style="color:red;">Reviews ({{ post.rating }})</a></span>
          <span style="color: cornflowerblue;"><br/>/////////////////////
          <a href="#" id="scrollToTop" class="button-to-top" style="display: inline-block; font-size: 20px;">
          <span class="glyphicon glyphicon-chevron-up"></span></a>\\\\\\\\\\\\\\\\\\\\\</span>
      </div>
 {% endfor %}
</div>
<!--scroll to top button-->
<a href="#" id="scrollToTop" class="button-to-top" style="display: none; float: right;"><span class="glyphicon glyphicon-chevron-up"></span></a>
<!-- Bootstrap core JavaScript -->
    <script src="/jquery/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
<!--     <script src="/js/stars.js"></script> -->
    <script src="/js/custom.js"></script>
    <script src="/js/owl.js"></script>
    <script src="/js/slick.js"></script>
    <script src="/js/isotope.js"></script>
    <script src="/js/accordions.js"></script>


<script>
    var ratedIndex = -1, uID = 0;

    $(document).ready(function () {
        resetStarColors();

        if(localStorage.getItem('ratedIndex') != null)
              setStars(parseInt(localStorage.getItem('ratedIndex')));

        $('.fa-star').on('click', function () {
            ratedIndex = parseInt($(this).data('index'));
            localStorage.setItem('ratedIndex', ratedIndex);
            saveToTheDB();
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

    function saveToTheDB(){
        $.ajax({
            url: "clothing_products/more.volt",
            method: "POST",
            dataType: 'json',
            data: {
                save: 1,
                uID: uID,
                ratedIndex: ratedIndex
            }, success: function(r) {
                uID = r.uid;
            }
        });
    }

    function setStars(max) {
        for (var i = 0; i <= max; i++)
            $('.fa-star:eq(' + i + ')').css('color', 'goldenrod');
    }
    function resetStarColors() {
        $('.fa-star').css('color', 'red');
    }
</script>
<!--     <script language = "text/Javascript"> -->
<!--       cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field -->
<!--       function clearField(t){                   //declaring the array outside of the -->
<!--       if(! cleared[t.id]){                      // function makes it static and global -->
<!--           cleared[t.id] = 1;  // you could use true and false, but that's more typing -->
<!--           t.value='';         // with more chance of typos -->
<!--           t.style.color='#fff'; -->
<!--           } -->
<!--       } -->
<!--     </script> -->

<!--                  <div class="rows-rating"> <br /> -->
<!--                       <div class="side"> -->
<!--                         <div>5 star</div> -->
<!--                       </div> -->
<!--                       <div class="middle"> -->
<!--                         <div class="bar-container"> -->
<!--                           <div class="bar-5"></div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="side right"> -->
<!--                         <div>150</div> -->
<!--                       </div> -->
<!--                       <div class="side"> -->
<!--                         <div>4 star</div> -->
<!--                       </div> -->
<!--                       <div class="middle"> -->
<!--                         <div class="bar-container"> -->
<!--                           <div class="bar-4"></div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="side right"> -->
<!--                         <div>63</div> -->
<!--                       </div> -->
<!--                       <div class="side"> -->
<!--                         <div>3 star</div> -->
<!--                       </div> -->
<!--                       <div class="middle"> -->
<!--                         <div class="bar-container"> -->
<!--                           <div class="bar-3"></div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="side right"> -->
<!--                         <div>15</div> -->
<!--                       </div> -->
<!--                       <div class="side"> -->
<!--                         <div>2 star</div> -->
<!--                       </div> -->
<!--                       <div class="middle"> -->
<!--                         <div class="bar-container"> -->
<!--                           <div class="bar-2"></div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="side right"> -->
<!--                         <div>6</div> -->
<!--                       </div> -->
<!--                       <div class="side"> -->
<!--                         <div>1 star</div> -->
<!--                       </div> -->
<!--                       <div class="middle"> -->
<!--                         <div class="bar-container"> -->
<!--                           <div class="bar-1"></div> -->
<!--                         </div> -->
<!--                       </div> -->
<!--                       <div class="side right"> -->
<!--                         <div>20</div> -->
<!--                       </div> -->
<!--                     </div> -->

<!-- Stars Rating System -->
<!--                <div class="stars" data-rating="3"> -->
<!--                     <span class="star">&nbsp;</span> -->
<!--                     <span class="star">&nbsp;</span> -->
<!--                     <span class="star">&nbsp;</span> -->
<!--                     <span class="star">&nbsp;</span> -->
<!--                     <span class="star">&nbsp;</span> -->
<!--                 </div> -->
<!-- Stars Rating System -->
<!--      <div class="stars" data-rating="0"> -->
<!--           <span class="star">&nbsp;</span> -->
<!--           <span class="star">&nbsp;</span> -->
<!--           <span class="star">&nbsp;</span> -->
<!--           <span class="star">&nbsp;</span> -->
<!--           <span class="star">&nbsp;</span> -->
<!--       </div> -->