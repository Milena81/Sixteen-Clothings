
{{ content() }}

{{ flashSession.output() }}

<br />
<form action="" method="post" multipart="" enctype="multipart/form-data">
  <div class="form-row">
    <div class="form-group col-md-6">
    <h2 style="color:orange"> Update product information: </h2>
      <label for="inputTitle">Product title: </label>
      <input type="text" name="title" class="form-control" id="inputTitle" placeholder="Product title" value="{{product.title}}" />
      <label for="inputPrice"0>Product price: </label>
      <input type="text" name="price" class="form-control" id="inputPrice" placeholder="Product price" value="{{product.price}}" />
      <label for="inputDescription">Product description: </label>
      <input type="text" class="form-control" name="description" id="inputDescription" placeholder="Product description" value="{{product.description}}" />
      <label for="inputCategory"> Select category: </label>
        <select name="category" class="form-control">
              <option value="0">Select category: </option>
              <option value="Featured">Featured</option>
              <option value="Flash Deals">Flash Deals</option>
              <option value="Last Minute">Last Minute</option>
       </select>
      <label for="exampleFormControlFile1">Product file input: </label>
      <input type="file" class="btn btn-primary" id="img" name="img" />
      <br />
      <p>
        <button type="submit" name="submit" class="btn btn-primary">Update product information: </button>
        <a href="/clothing_products/index/" class="btn btn-success">Back to product information</a>
      </p>
    </div>
  </div>
</form>