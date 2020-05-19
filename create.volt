
{{ content() }}

{{ flashSession.output() }}

<br />
<form action="" method="post" multipart="" enctype="multipart/form-data">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputTitle">Product title: </label>
      <input type="text" name="title" class="form-control" id="inputTitle" placeholder="Product title">
      <label for="inputPrice"0>Product price: </label>
      <input type="text" name="price" class="form-control" id="inputPrice" placeholder="Product price">
      <label for="inputDescription">Product description: </label>
      <input type="text" class="form-control" name="description" id="inputDescription" placeholder="Product description">
      <label for="inputCategory"> Select category: </label>
        <select name="category" class="form-control">
            <option value="0">Select category: </option>
            <option value="1">Featured</option>
            <option value="2">Flash Deals</option>
            <option value="3">Last Minute</option>
        </select>
      <label for="exampleFormControlFile1">Product file input: </label>
      <input type="file" class="btn btn-primary" id="img" name="img">
      <br />
      <p>
        <button type="submit" name="submit" class="btn btn-primary">Insert new product type: </button>
        <a href="/clothing_products/index/" class="btn btn-success">Back to product information</a>
      </p>
    </div>
  </div>
</form>