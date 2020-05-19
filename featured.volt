<!-- Bootstrap core CSS -->
<link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

 <!-- Additional CSS Files -->
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="/css/owl.css">
    <link rel="stylesheet" href="/css/clothing-products.css">


{{ content() }}

{{ flashSession.output() }}

<!-- Page Content -->
<div class="page-heading products-heading header-text">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="text-content">
          <h4>Featured Products</h4>
          <h2>sixteen products</h2>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="products">
  <div class="container">
<!--     <a href="/clothing_products/index/" title="view latest products" class="btn btn-warning" >Latest products <i class="fa fa-angle-right"></i></a> -->
<!--     <a href="/clothing_products/create/" title="insert new information" class="btn btn-success">Create new products <i class="fa fa-angle-right"></i></a> -->
<!--     <a href="/about_us_clothing/index/" title="more information about us" class="btn btn-danger">About Us <i class="fa fa-angle-right"></i></a> -->
<!--     <a href="/contact_us_clothing/index/" title="our location..." class="btn btn-info">Contact Us <i class="fa fa-angle-right"></i></a> -->
    <div class="row">
      <div class="col-md-12">
      <!--Our products - Nav-bar panel - filtering panel-->
<!--            <div class="section-heading"> -->
<!--                 <h2 style="color:red;">Our Featured Products</h2> -->
<!--            </div> -->
           <div class="filters">
               <!--filter links a href-->
               <ul>
                   <li><a href="/our_clothing_products/index?filter=All Products" class="btn" class="page-heading products-heading header-text"
                   style="color:black;"><h4><b>All Products</b></h4></a></li>
                   <li><a href="/clothing_products/featured?filter=Featured" class="btn" class="page-heading products-heading header-text"
                   style="color:red;"><h4><b>Featured</b></h4></a></li>
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
                  {% for product in products %}
                   {% set filesCount = product.getProductFiles() | length %}
                   {% if filesCount > 0 %}
                   {# keys filter is $category #}

                <div class="col-lg-4 col-md-4 all">
                   <div  class="product-item">
                   <br />
                     <a href="/clothing_products/more/{{ product.id }}">
                     <img src="/images/{{product.getProductFiles()[0].filename}}"
                     alt="{{product.getProductFiles()[0].filename}}" class="img-rounded" style="display:block"/></a>
                     <div class="down-content">
                     {% endif %}
                       <a href="/clothing_products/more/{{ product.id }}"><h4 style="color:orange;">{{ product.title }}</h4></a>
                       <h6>${{ "%.2f"|format(product.price) }}</h6>
<!--                        <p>{{ product.description }}</p> -->
                       <p>Category: {{ product.category }}</p>
<!--                        <ul class="stars"> -->
<!--                           <li><i class="fa fa-star"></i></li> -->
<!--                           <li><i class="fa fa-star"></i></li> -->
<!--                           <li><i class="fa fa-star"></i></li> -->
<!--                           <li><i class="fa fa-star"></i></li> -->
<!--                           <li><i class="fa fa-star"></i></li> -->
<!--                           <li><a href="#" style="color:red;">Reviews ({{"%.2f"|format(averageRating)}})</a></li> -->
                      </div>
                   </div>
                </div>
               {% endfor %}
            </div>
        </div>
    </div>
        <div id="myDiv" class="col-md-12">
            <ul class="pages" class="pagination">
              <li><a href="#" class="btn" class="jp-previous jp-disabled">
                    <i class="fa fa-angle-double-left"></i></a></li>
              <li class="active"><a href="#" class="btn">1</a></li>
<!--               <li><a href="/our_clothing_products/index?page=2" class="btn">2</a></li> -->
<!--               <li><a href="/our_clothing_products/index?page=3" class="btn">3</a></li> -->
<!--               <li><a href="/our_clothing_products/index?page=4" class="btn">4</a></li> -->
              <li><a href="#" class="btn" class="jp-next jp-disabled"><i class="fa fa-angle-double-right"></i></a></li>
            </ul>
        </div>
    </div>
   </div>
</div>
<!--scroll to top button-->
<a href="#" id="scrollToTop" class="button-to-top" style="display: block; float: right;"><span class="glyphicon glyphicon-chevron-up"></span></a>

   <script src="/jquery/jquery.min.js"></script>
    <script src="/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="/js/custom.js"></script>
    <script src="/js/owl.js"></script>
    <script src="/js/slick.js"></script>
    <script src="/js/isotope.js"></script>
    <script src="/js/accordions.js"></script>
