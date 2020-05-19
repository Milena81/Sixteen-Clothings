<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="/css/owl.css">
    <link rel="stylesheet" href="/css/clothing.css">

{{ content() }}

{{ flashSession.output() }}

<!-- Page Content -->
<div class="page-heading products-heading header-text">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="text-content">
          <h4>Our Products</h4>
          <h2>sixteen products</h2>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="products">
<!--   <div class="container"> -->
<!--     <a href="/clothing_products/index/" title="view latest products" class="btn btn-warning" >Latest products <i class="fa fa-angle-right"></i></a> -->
<!--     <a href="/clothing_products/create/" title="insert new information" class="btn btn-success">Create new products <i class="fa fa-angle-right"></i></a> -->
<!--     <a href="/about_us_clothing/index/" title="more information about us" class="btn btn-danger">About Us <i class="fa fa-angle-right"></i></a> -->
<!--     <a href="/contact_us_clothing/index/" title="our location..." class="btn btn-info">Contact Us <i class="fa fa-angle-right"></i></a> -->
<!--     <div class="row"> -->
      <div class="col-md-12">
      <!--Our products - Nav-bar panel - filtering panel-->
<!--            <div class="section-heading"> -->
<!--                 <h2 style="color:red;">Our Products</h2> -->
<!--            </div> -->
           <div class="filters">
               <!--filter links a href-->
               <ul>
                   <li><a href="/our_clothing_products/index?filter=All Products" class="btn" class="page-heading products-heading header-text"
                   style="color:red;"><h4><b>All Products</b></h4></a></li>
                   <li><a href="/clothing_products/featured?filter=Featured" class="btn" class="page-heading products-heading header-text"
                   style="color:black;"><h4><b>Featured</b></h4></a></li>
                   <li><a href="/clothing_products/flashDeals?filter=Flash Deals" class="btn" class="page-heading products-heading header-text"
                   style="color:black;"><h4><b>Flash Deals</b></h4></a></li>
                   <li><a href="/clothing_products/lastMinute?filter=Last Minute" class="btn" class="page-heading products-heading header-text"
                   style="color:black;"><h4><b>Last Minute</b></h4></a></li>
               </ul>
           </div>
      </div>

    <div class="col-md-12">
        <div class="filter-content">
            <div class="row grid">
            <!--items in mosaic preview: title, price, description, category-->
                 <?php foreach ($page->items as $item) { ?>
                   {% set filesCount = item.getProductFiles() | length %}
                   {% if filesCount > 0 %}
                   {# keys filter is $category #}

                <div class="col-lg-4 col-md-4 all">
                   <div  class="product-item">
                   <br />
                     <a href="/clothing_products/more/{{ item.id }}">
                     <img src="/images/{{item.getProductFiles()[0].filename}}"
                     alt="{{item.getProductFiles()[0].filename}}" class="img-rounded" style="display:block"/></a>
                     <div class="down-content">
                     {% endif %}
                       <a href="/clothing_products/more/{{ item.id }}"><h4 style="color:orange;">
                       {{ item.title }}</h4></a>
                       <h6>${{ "%.2f"|format(item.price) }}</h6>
<!--                        <p>{{ item.description }}</p> -->
                       <p>Category: {{ item.category }}</p>
<!--                        <ul class="stars"> -->
<!--                               <li><a href="/clothing_products/edit/{{ item.id }}" title="have to change information" class="btn btn-warning"> edit <i class="fa fa-angle-right"></i></a></li> -->
<!--                           <li><i class="fa fa-star fa-1x"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x" ></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x"></i></li> -->
<!--                           <li><a href="#" style="color:red;"> -->
<!--                           Reviews ({{ "%.2f"|format(averageRating) }}) -->
<!--                           </a></li> -->
                      </div>
                   </div>
                </div>
               <?php } ?>
            </div>
        </div>
    </div>

{% if page is defined and page.total_pages > 1 %}
      <form action="" method="get" class="pagination" style="display:block;">
          <div id="myDiv" class="col-md-12">
          <ul class="pages">
              <li><a href="?page={{page.before}}" class="btn" class="jp-previous jp-disabled"><i class="fa fa-angle-double-left"></i></a></li>
              <li><a href="?page={{page.current}}" class="btn btn-danger"> {{ page.current }}</a></li>
          {% if page.next != page.current %}
              <li><a href="?page={{page.next}}" class="btn"><i class="fa fa-angle-double-right"></i></a></li>
          {% endif %}
          </ul>
<!--           <fieldset> -->
<!--               Or specific page: <input type="number" name="page" placeholder="1 / {{ page.total_pages }}"  min="1" max="{{ page.total_pages }}" value="" /> -->
<!--           </fieldset> -->
        </div>
      </form>
    {% endif %}

<!--scroll to top button-->
<a href="#" id="scrollToTop" class="button-to-top" style="display: block; float: right;"><span class="glyphicon glyphicon-chevron-up"></span></a>

    </div>
   </div>
</div>


<!-- Bootstrap core JavaScript -->
<script src="/jquery/jquery.min.js"></script>
<script src="/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- Additional Scripts -->
<script src="/js/custom.js"></script>
<script src="/js/owl.js"></script>
<script src="/js/slick.js"></script>
<script src="/js/isotope.js"></script>
<script src="/js/accordions.js"></script>
<script src="/js/clothing_products.js"></script>

<script>
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
</script>


<!-- {% if page.before != page.current %} {% endif %} -->
<!-- not usable things -->
<!-- <script language = "/Javascript"> -->
<!--   cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field -->
<!--   function clearField(t){                   //declaring the array outside of the -->
<!--   if(! cleared[t.id]){                      // function makes it static and global -->
<!--       cleared[t.id] = 1;  // you could use true and false, but that's more typing -->
<!--       t.value='';         // with more chance of typos -->
<!--       t.style.color='#fff'; -->
<!--       } -->
<!--   } -->
</script>

<!--                   {% set categories = ['Featured' : 1, 'Flash Deals':2, 'Last Minute':3] %} -->
<!--                   {% for category in categories if category == 2 %} -->
<!--                 {% endfor %} -->
<!--                       {% for item in page.items %} -->
<!--                       {% endfor %} -->
<!--                    {% for category in categories %} -->
<!--                {% endfor %} -->
<!--                    {% set value = ['Featured':0, 'Flash Deals':1, 'Last Minute':2] | length %} -->
<!--                    {% if value == 0 %} -->
<!--                 {% endif %} -->
<!---------------------------------------------------------------------------------------------------->
<!--                  <span class="fa fa-star checked" class="st sp fullStar" style="color:orange"></span> -->
<!--                  <span class="fa fa-star checked" class="st sp fullStar" style="color:orange"></span> -->
<!--                  <span class="fa fa-star checked" class="st sp fullStar" style="color:orange"></span> -->
<!--                  <span class="fa fa-star" class="st sp fullStar"></span> -->
<!--                  <span class="fa fa-star" class="st sp fullStar"></span> -->
<!--                <a href="#" style="color:orange;"><span> Reviews (24)</span></a> -->

<!--           <div class="col-md-12"> -->
<!--             <br /> -->
<!--               <span><a href="#" class="btn btn-danger">1</a></span> -->
<!--               <span class="active"><a href="#" class="btn btn-danger">2</a></span> -->
<!--               <span><a href="#" class="btn btn-danger">3</a></span> -->
<!--               <span><a href="#" class="btn btn-danger">4</a></span> -->
<!--               <span><a href="#" class="btn btn-danger"><i class="fa fa-angle-double-right"></i></a></span> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </div> -->

<!-- <a href="#" class="btn btn-warning" style="color:red; float:right;"> -->
<!--                <span class="All Products" data-filter="All Products" role="button">All Products</span></a> -->
<!--                <a href="#" class="btn btn-warning" style="color:red; float:right;"> -->
<!--                <span class="Featured" data-filter="Featured" role="button">Featured</span></a> -->
<!--                <a href="#" class="btn btn-warning" style="color:red; float:right;"> -->
<!--                <span class="Flash Deals" data-filter="Flash Deals" role="button">Flash Deals</span></a> -->
<!--                <a href="#" class="btn btn-warning" style="color:red; float:right;"> -->
<!--                <span class="Last Minute" data-filter="Last Minute" role="button">Last Minute</span></a> -->

<!-- <script type="text/javascript" async="" crossorigin="anonymous" -->
<!-- src="https://assets.alicdn.com/g/alilog/oneplus/entry.js?t=220148"></script> -->

<!--                               <p>4.1 average based on 254 reviews.</p> -->
<!--                           </ul> -->
<!--                                 <div class="rows-rating"> -->
<!--                                   <div class="side" style="float: left; -->
<!--                                                                width: 15%; -->
<!--                                                                margin-top:10px;"> -->
<!--                                     <div>5 star</div> -->
<!--                                   </div> -->
<!--                                   <div class="middle" style="margin-top:10px; -->
<!--                                                                  float: left; -->
<!--                                                                  width: 70%;"> -->
<!--                                     <div class="bar-container" style="width: 100%; -->
<!--                                                                           background-color: #f1f1f1; -->
<!--                                                                           text-align: center; -->
<!--                                                                           color: white;"> -->
<!--                                       <div class="bar-5" style="width: 60%; height: 18px; background-color: #4CAF50;"></div> -->
<!--                                     </div> -->
<!--                                   </div> -->
<!--                                   <div class="side right" style="float: left; -->
<!--                                                                      width: 15%; -->
<!--                                                                      margin-top:10px; -->
<!--                                                                      text-align: right;"> -->
<!--                                     <div>150</div> -->
<!--                                   </div> -->
<!--                                   <div class="side" style="float: left; -->
<!--                                                                width: 15%; -->
<!--                                                                margin-top:10px;"> -->
<!--                                     <div>4 star</div> -->
<!--                                   </div> -->
<!--                                   <div class="middle" style="margin-top:10px; -->
<!--                                                                  float: left; -->
<!--                                                                  width: 70%;"> -->
<!--                                     <div class="bar-container" style=" width: 100%; -->
<!--                                                                           background-color: #f1f1f1; -->
<!--                                                                           text-align: center; -->
<!--                                                                           color: white;"> -->
<!--                                       <div class="bar-4" style="width: 30%; height: 18px; background-color: #2196F3;"></div> -->
<!--                                     </div> -->
<!--                                   </div> -->
<!--                                   <div class="side right" style="float: left; -->
<!--                                                                      width: 15%; -->
<!--                                                                      margin-top:10px; -->
<!--                                                                      text-align: right;"> -->
<!--                                     <div>63</div> -->
<!--                                   </div> -->
<!--                                   <div class="side" style="float: left; -->
<!--                                                                width: 15%; -->
<!--                                                                margin-top:10px;"> -->
<!--                                     <div>3 star</div> -->
<!--                                   </div> -->
<!--                                   <div class="middle" style="margin-top:10px; -->
<!--                                                                  float: left; -->
<!--                                                                  width: 70%;"> -->
<!--                                     <div class="bar-container" style="width: 100%; -->
<!--                                                                           background-color: #f1f1f1; -->
<!--                                                                           text-align: center; -->
<!--                                                                           color: white;"> -->
<!--                                       <div class="bar-3" style="width: 10%; height: 18px; background-color: #00bcd4;"></div> -->
<!--                                     </div> -->
<!--                                   </div> -->
<!--                                   <div class="side right" style="float: left; -->
<!--                                                                      width: 15%; -->
<!--                                                                      margin-top:10px; -->
<!--                                                                      text-align: right;"> -->
<!--                                     <div>15</div> -->
<!--                                   </div> -->
<!--                                   <div class="side" style="float: left; -->
<!--                                                                width: 15%; -->
<!--                                                                margin-top:10px;"> -->
<!--                                     <div>2 star</div> -->
<!--                                   </div> -->
<!--                                   <div class="middle" style="margin-top:10px; -->
<!--                                                                  float: left; -->
<!--                                                                  width: 70%;"> -->
<!--                                     <div class="bar-container" style="width: 100%; -->
<!--                                                                           background-color: #f1f1f1; -->
<!--                                                                           text-align: center; -->
<!--                                                                           color: white;"> -->
<!--                                       <div class="bar-2" style="width: 4%; height: 18px; background-color: #ff9800;"></div> -->
<!--                                     </div> -->
<!--                                   </div> -->
<!--                                   <div class="side right" style="float: left; -->
<!--                                                                      width: 15%; -->
<!--                                                                      margin-top:10px; -->
<!--                                                                      text-align: right;"> -->
<!--                                     <div>6</div> -->
<!--                                   </div> -->
<!--                                   <div class="side" style="float: left; -->
<!--                                                                width: 15%; -->
<!--                                                                margin-top:10px;"> -->
<!--                                     <div>1 star</div> -->
<!--                                   </div> -->
<!--                                   <div class="middle" style="margin-top:10px; -->
<!--                                                                  float: left; -->
<!--                                                                  width: 70%;"> -->
<!--                                     <div class="bar-container" style="width: 100%; -->
<!--                                                                           background-color: #f1f1f1; -->
<!--                                                                           text-align: center; -->
<!--                                                                           color: white;"> -->
<!--                                       <div class="bar-1" style="width: 15%; height: 18px; background-color: #f44336;"></div> -->
<!--                                     </div> -->
<!--                                   </div> -->
<!--                                   <div class="side right" style="float: left; -->
<!--                                                                      width: 15%; -->
<!--                                                                      margin-top:10px; -->
<!--                                                                      text-align: right;"> -->
<!--                                     <div>20</div> -->
<!--                                   </div> -->
<!--                                 </div> -->

<!-- <li><i class="fa fa-star fa-1x" data-index="0"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x" data-index="1"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x" data-index="2"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x" data-index="3"></i></li> -->
<!--                           <li><i class="fa fa-star fa-1x" data-index="4"></i></li> -->

<!--         <div id="myDiv" class="col-md-12"> -->
<!--             <ul class="pages" class="pagination"> -->
<!--               <li><a href="/our_clothing_products/index?page=Previous" class="btn" class="jp-previous jp-disabled"> -->
<!--                     <i class="fa fa-angle-double-left"></i></a></li> -->
<!--               <li class="active"><a href="/our_clothing_products/index?page=1" class="btn">1</a></li> -->
<!--               <li><a href="/our_clothing_products/index?page=2" class="btn">2</a></li> -->
<!--               <li><a href="/our_clothing_products/index?page=3" class="btn">3</a></li> -->
<!--               <li><a href="/our_clothing_products/index?page=4" class="btn">4</a></li> -->
<!--               <li><a href="/our_clothing_products/index?page=Next" class="btn"><i class="fa fa-angle-double-right"></i></a></li> -->
<!--             </ul> -->
<!--         </div> -->