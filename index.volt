<!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Additional CSS Files -->
<!--     <link rel="stylesheet" href="/css/clothing_products.css"> -->
<!--     <link rel="stylesheet" href="/css/stars1.css"> -->
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="/css/owl.css">

{{ content() }}

{{ flashSession.output() }}

<!-- Page Content -->
<!-- Banner Starts Here -->
   <div class="banner header-text">
      <div class="owl-banner owl-carousel">
        <div class="banner-item-01">
        <a href="/clothing_products/featured?filter=Featured">
          <div class="text-content">
            <h4>Best Offer</h4>
            <h2>New Arrivals On Sale</h2>
          </div>
          </a>
        </div>
        <div class="banner-item-02">
        <a href="/clothing_products/flashDeals?filter=Flash Deals">
          <div class="text-content">
            <h4>Flash Deals</h4>
            <h2>Get your best products</h2>
          </div>
          </a>
        </div>
        <div class="banner-item-03">
        <a href="/clothing_products/lastMinute?filter=Last Minute">
          <div class="text-content">
            <h4>Last Minute</h4>
            <h2>Grab last minute deals</h2>
          </div>
          </a>
        </div>
      </div>
    </div>
<!--     Banner Ends Here -->

<div class="latest-products">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="section-heading">
          <h3>Latest Products</h3>
          <a href="/our_clothing_products/index/" title="view all products" class="btn" style="color:black;">view all products <i class="fa fa-angle-right"></i></a>
        </div>
        <div class="filters">

        </div>
      </div>
     </div>
    <br />
        <div class="col-md-12">
          <div class="filter-content">
            <div class="row grid">
            <!--items in mosaic preview: title, price, description-->
                {% for item in page.items %}
                {% set filesCount = item.getProductFiles() | length %}
                {% if filesCount > 0 %}
              <div class="col-lg-4 col-md-4 all">
                <div class="product-item">
                  <a href="/clothing_products/more/{{ item.id }}" title="for more information">
                  <img src="/images/{{item.getProductFiles()[0].filename}}"
                  alt="{{item.getProductFiles()[0].filename}}" class="img-rounded"/></a>
                  <div class="down-content">
                  {% endif %}
                  <a href="/clothing_products/more/{{ item.id }}"><i style="font-size:18px; color:black;">{{ item.title }}</i></a>
                    <i style="color:black; font-size:16px; float:right;"> ${{ "%.2f"|format(item.price) }}</i>
<!--                     <p></p><a href="/clothing_products/review/{{item.id}}" class="btn btn-warning" style="color:red;">Write a Review</a> -->
                  <ul class="stars">
                    <li><i class="fa fa-star fa-1x"></i></li>
                    <li><i class="fa fa-star fa-1x"></i></li>
                    <li><i class="fa fa-star fa-1x" ></i></li>
                    <li><i class="fa fa-star fa-1x"></i></li>
                    <li><i class="fa fa-star fa-1x"></i></li>
                    <li><p><a href="#" style="color:red;">

                    Reviews ({{ "%.2f"|format(ratings) }})
                    </a></p></li>
                    </ul>
                  </div>
                </div>
              </div>
              {% endfor %}
            </div>
          </div>
        </div>
   </div>
</div>
<div class="products">
    <div class="col-md-12">
        {% if page is defined and page.total_pages > 1 %}
              <form action="" method="get" class="pagination" style="display:block;">
                  <div id="myDiv" class="col-md-12">
                      <ul class="pages">
                            <li><a href="?page={{page.before}}" class="btn" class="jp-previous jp-disabled">
                            <i class="fa fa-angle-double-left"></i></a></li>
                            <li><a href="?page={{page.current}}" class="btn btn-danger"> {{ page.current }} </a></li>
                      {% if page.next != page.current %}
                            <li><a href="?page={{page.next}}" class="btn"><i class="fa fa-angle-double-right"></i></a></li>
                      {% endif %}
                  </ul>
                </div>
              </form>
        {% endif %}
    </div>
</div>

<div class="best-features">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="section-heading">
          <h2>About Sixteen Clothing</h2>
        </div>
      </div>
      <div class="col-md-6">
        <div class="left-content">
          <h4>Looking for the best products?</h4>
          <p><a rel="nofollow" href="https://templatemo.com/tm-546-sixteen-clothing" target="_parent">This template</a> is free to use for your business websites. However, you have no permission to redistribute the downloadable ZIP file on any template collection website. <a rel="nofollow" href="https://templatemo.com/contact">Contact us</a> for more info.</p>
          <ul class="featured-list">
            <li><a href="#">Lorem ipsum dolor sit amet</a></li>
            <li><a href="#">Consectetur an adipisicing elit</a></li>
            <li><a href="#">It aquecorporis nulla aspernatur</a></li>
            <li><a href="#">Corporis, omnis doloremque</a></li>
            <li><a href="#">Non cum id reprehenderit</a></li>
          </ul>
          <a href="/about_us_clothing/index/" class="filled-button">Read More</a>
        </div>
      </div>
      <div class="col-md-6">
        <div class="right-image">
          <img src="/images/feature-image.jpg" alt="">
        </div>
      </div>
    </div>
  </div>
</div>

<div class="call-to-action">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="inner-content">
          <div class="row">
            <div class="col-md-8">
              <h4>Creative &amp; Unique <em>Sixteen</em> Products</h4>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque corporis amet elite author nulla.</p>
            </div>
            <div class="col-md-4">
              <a href="#" class="filled-button">Purchase Now</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!--scroll to top button-->
<a href="#" id="scrollToTop" class="button-to-top" style="display:block; float:right;"><span class="glyphicon glyphicon-chevron-up"></span></a>

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
<!--     <script src="/js/stars.js"></script> -->



