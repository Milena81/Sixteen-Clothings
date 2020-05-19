	<!-- Bootstrap core CSS -->
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

     <!-- Additional CSS Files -->
<!--         <link rel="stylesheet" href="/css/stars1.css"> -->
        <link rel="stylesheet" href="/css/fontawesome.css">
        <link rel="stylesheet" href="/css/templatemo-sixteen.css">
        <link rel="stylesheet" href="/css/owl.css">
        <link rel="stylesheet" href="/css/clothing-products.css">

	{{ content() }}

    {{ flashSession.output() }}

<div style="margin: auto; display: table;">
    <br/>
    <form method="post" action="">
        <div style="width: 400px;">
        </div>
        <div style="padding-bottom: 18px;font-size : 24px;">Product Review</div>
        <div style="padding-bottom: 18px;">Reviewer<span style="color: red;"> *</span><br/>
            <input type="text" id="data_2" name="reviewer_name" style="width : 450px;" class="form-control" />
        </div>
        <div style="padding-bottom: 18px;">Rate this product<span style="color: red;"> *</span><br/>
            <select id="data_4" name="rating" style="width : 150px;" class="form-control">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <div style="padding-bottom: 18px;">Title<span style="color: red;"> *</span><br/>
            <input type="text" id="data_5" name="title_review" style="width : 450px;" class="form-control" value=""/>
        </div>
        <div style="padding-bottom: 18px;">Review<span style="color: red;"> *</span><br/>
            <textarea id="data_8" false name="review_content" style="width : 450px;" rows="9" class="form-control"></textarea>
        </div>
        <div style="padding-bottom: 18px;">
            <input name="submit" value="Post Your Review" type="submit" class="btn btn-success" />
            <a href="/clothing_products/index/" class="btn btn-danger">Return to Home Page</a></div>
    </form>
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


    <!-- onSubmit="return validateForm();" -->
    <!-- <script type="text/javascript"> -->
    <!--  function validateForm() { -->
    <!--  $( ".has-error" ).removeClass("has-error"); -->
    <!-- if (isEmpty(document.getElementById('data_2').value.trim())) { -->
    <!--  alert('Reviewer is required!'); -->
    <!--  document.getElementById('data_2').parentNode.className += " has-error"; -->
    <!--  return false; -->
    <!-- } -->
    <!-- if (isEmpty(document.getElementById('data_5').value.trim())) { -->
    <!--  alert('Title is required!'); -->
    <!--  document.getElementById('data_5').parentNode.className += " has-error"; -->
    <!--  return false; -->
    <!-- } -->
    <!-- if (isEmpty(document.getElementById('data_8').value.trim())) { -->
    <!--  alert('Review is required!'); -->
    <!--  document.getElementById('data_8').parentNode.className += " has-error"; -->
    <!--  return false; -->
    <!-- } -->
    <!-- return true; -->
    <!--  } -->
    <!--  function isEmpty(str) { return (str.length === 0 || !str.trim()); } -->
    <!--  function validateEmail(email) { -->
    <!--  var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,15}(?:\.[a-z]{2})?)$/i; -->
    <!--  return isEmpty(email) || re.test(email); -->
    <!-- } -->
    <!-- </script> -->

    <!-- <div class="col-md-12"> -->
    <!-- items reviews: reviewer_name, title, review_content and rating-->
    <!-- {% for post in posts %} -->
    <!--        <h6>{{ post.product_id }}</h6> -->
    <!--        <h6>{{ post.reviewer_name }}</h6> -->
    <!--        <h6>{{ post.title_review }}</h6> -->
    <!--        <p>{{ post.review_content }}</p> -->
    <!--        <ul class="stars"> -->
    <!--           <li><i class="fa fa-star"></i></li> -->
    <!--           <li><i class="fa fa-star"></i></li> -->
    <!--           <li><i class="fa fa-star"></i></li> -->
    <!--           <li><i class="fa fa-star"></i></li> -->
    <!--           <li><i class="fa fa-star"></i></li> -->
    <!--           <li><a href="#" style="color:red;">Reviews ({{ post.rating }})</a></li> -->
    <!--       </ul> -->
    <!--               {% endfor %} -->
    <!-- </div> -->