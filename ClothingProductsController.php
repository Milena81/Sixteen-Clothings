<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model;
use Phalcon\Mvc\ModelsManager;
use Phalcon\Filter;
use Phalcon\Mvc\Model\Transaction\Manager;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Tag;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
//use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
//use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
//use Phalcon\Paginator\Adapter\Model as Paginator;
//use Phalcon\Paginator\Adapter\NativeArray as ArrayPaginator;

class ClothingProductsController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('ClothingProducts');
        $this->auth = $this->session->get('auth');
        $this->filter = new Filter();
        parent::initialize();
    }

    public function indexAction()
    {
        $products = ClothingProducts::find();
        $id = $this->request->get('id');
        $products->id = $id;
        $product_id = $this->request->get('product_id');
        $posts = Reviews::find();
        $posts->product_id = $products->id;


        $this->view->ratings = $this->CommonAverageRating($id);
//        $this->view->ratings = $this->CommonAverageRating($id);

        //TODO logic foreach loop for every product's rating...

        // Current page to show
        // In a controller/component this can be:
        $currentPage = $this->request->getQuery('page', 'int', 1);
        $limit = intval($this->request->get('limit'));
        $limit = $limit > 0 ? $limit : 6;

        // The data set to paginate
        $paginator = new PaginatorModel(
            [
                'data'   => $products,
                'limit'  => 6,
                'page'   => $currentPage,
            ]
        );

        // Get the paginated results
//        $page = $paginator->paginate();
        $this->view->page = $paginator->getPaginate();
        $this->view->products = $products;
//        $this->view->post = $post;
    }

    public function purchaseAction($id)
    {
        $products = ClothingProducts::findFirstById($id);
        $price = $this->request->getPost('price');
        $products->price = $price;
//        $id = $this->request->getPost('id');
        $this->view->product = $this->getProduct($id);
//        $this->view->product = $this->getAllProducts();
        $this->view->price = $this->getPrice($id);

        if($this->request->isPost())
        {
            $this->db->begin();

//            $getPurchase = $this->request->getPost();
            $id = $this->request->getPost('id');
            $myProductsId = $this->request->getPost('myProductsId');
            $fullname = $this->request->getPost('fullname');
            $email = $this->request->getPost('email');
            $phoneNumber = $this->request->getPost('phoneNumber');
            $street = $this->request->getPost('street');
            $street2 = $this->request->getPost('street2');
            $city = $this->request->getPost('city');
            $state = $this->request->getPost('state');
            $postalCode = $this->request->getPost('postalCode');
            $country = $this->request->getPost('country');
            $myProductQuantity = $this->request->getPost('myProductQuantity');
            $payment = $this->request->getPost('payment');
            $submit = $this->request->getPost('submit');

            if (isset($submit))
            {
//                $products = ClothingProducts::findFirstById($id);
                $purchase = new Purchase();
                $purchase->myProductsId = $myProductsId;
                $purchase->myProductsId = $products->id;
                $purchase->fullname = $fullname;
                $purchase->email = $email;
                $purchase->phoneNumber = $phoneNumber;
                $purchase->street = $street;



                if (isset($street2)) {
                    $purchase->street2 = $street2;
                }

                $purchase->city = $city;
                $purchase->state = $state;
                $purchase->postalCode = $postalCode;
                $purchase->country = $country;
                $purchase->myProductQuantity = $myProductQuantity;
                $purchase->payment = $payment;

                if($purchase)
                {
                    $savedPurchase = $purchase->save();

                    if(!$savedPurchase)
                    {
                        $this->db->rollback();

                        $messages = $purchase->getMessages();

                        echo "Sorry, the following problems were generated: ";

                        foreach ($messages as $message) {
                            $this->flashSession->error($message->getMessage());
                            echo "<br/>";
                        }
                        return $this->response->redirect('clothing_products/index');
                        $this->view->flash = $this->flash;
                    } else {
                        $this->db->commit();
                        $purchase->myProductsId = $products->id;
                        $this->flashSession->success("Thanks for your order!");
                        return $this->response->redirect('clothing_products/index');
                    }
                }
//                $this->view->price = $this->getPrice($id);
            }
        }
        else {
            $this->flashSession->success("Please, fill your purchase data!");
        }
    }

    public function reviewAction($id)
    {
//        $this->view->disable();
        $posts = ClothingProducts::findFirstById($id);

        if($this->request->isPost()) {
            $this->db->begin();

            $postSent = $this->request->getPost();
            $product_id = $this->request->getPost('product_id');
            $reviewer_name = $this->request->getPost('reviewer_name');
            $rating = $this->request->getPost('rating');
            $title_review = $this->request->getPost('title_review');
            $review_content = $this->request->getPost('review_content');
            $submit = $this->request->getPost('submit');

            if (isset($submit)) {
                $post = new Reviews();
                $post->product_id = $posts->id;
                $post->reviewer_name = $reviewer_name;
                $post->rating = $rating;
                $post->title_review = $posts->title;
                $post->review_content = $review_content;

                if ($post) {

                    $savedPosts = $post->save();

                    if(!$savedPosts)
                    {
                        $this->db->rollback();

                        $messages = $post->getMessages();

                        echo "Sorry, the following problems were generated: ";

                        foreach ($messages as $message) {
                            $this->flashSession->error($message->getMessage());
                            echo "<br/>";
                        }
                        return $this->response->redirect('clothing_products/index');
                        $this->view->flash = $this->flash;
                    } else {
                        $this->db->commit();
                        $this->flashSession->success("Thanks for your vote and review!");
                        return $this->response->redirect('clothing_products/index');
                    }
                }
            }
        }
        else {
            $this->flashSession->success("Please, post your review here!");
        }
    }

    public function moreAction($id)
    {
//        $this->view->products = $this->getAllProducts();
        $this->view->product = $this->getProduct($id);
        $product = ClothingProducts::findFirstById($id);
        $filename = ProductFiles::findFirstById($id);

        $this->view->title = $product->title;
        $this->view->price = $product->price;
        $this->view->description = $product->description;
        $this->view->filename = $filename;

//        $id = $this->request->getPost('id');
        $product_id     = $this->request->getPost('product_id');
        $reviewer_name  = $this->request->getPost('reviewer_name');
        $rating         = $this->request->getPost('rating');
        $title_review   = $this->request->getPost('title_review');
        $review_content = $this->request->getPost('review_content');

        $post = Reviews::findFirstByProductId($product->id);
        if(!$post){
            $this->flashSession->error("This product haven't reviews!");
            $this->flashSession->success("You may be the first to leave a review for this product.");
            $test = $this->view->posts = $this->getMyPost($id);

        } else {
            $post->product_id = $product->id;
            $post->reviewer_name = $reviewer_name;
            $post->rating = $rating;
            $post->title_review = $title_review;
            $post->review_content = $review_content;

            $this->view->reviewer_name  = $post->reviewer_name;
            $this->view->rating         = $post->rating;
            $this->view->title_review   = $post->title_review;
            $this->view->review_content = $post->review_content;

            $test = $this->view->posts = $this->getMyPost($id);

//            $this->view->posts = $this->getAllPosts($product->id);
        }
//        $this->view->posts = $this->getMyPost($product_id);
//        $this->view->posts = $this->getAllPosts($product->id);
        $this->view->average = $this->getAverageRating($id);
//        $this->view->ratings = $this->CommonAverageRating($product_id);

//        $this->view->posts = $post;
    }

    public function createAction()
    {
        if($this->request->isPost())
        {
            $this->db->begin();

            /* the fields */
            $title       = $this->request->getPost('title');
            $price       = $this->request->getPost('price');
            $description = $this->request->getPost('description');
            $category    = $this->request->getPost('category');
            $submit      = $this->request->getPost('submit');

            if(isset($submit))
            {
                $product = new ClothingProducts();
                $product->title = $title;
                $product->price = $price;
                $product->description = $description;
                $product->category = $category;

                if($product->save() && $this->request->hasFiles())
                {
                    $productFiles = $this->request->getUploadedFiles();

                    foreach ($productFiles as $file)
                    {
                        $filename = $file->getName();
                        $filetype = $file->getType();
                        $filesize = $file->getSize();

                        if(!$file->isUploadedFile())
                        {
                            $this->flashSession->error("You also have to upload a file!");
                            return $this->response->redirect('clothing_products/index');
                        }

                        $fileForClothe = new ProductFiles();
                        $fileForClothe->productfile_id = $product->id;
                        $fileForClothe->filename = $filename;
                        $fileForClothe->filetype = $filetype;
                        $fileForClothe->filesize = $filesize;
                        $movieFile = $file->moveTo('images/' . $filename);

                        if(!$fileForClothe->create())
                        {
                            $this->db->rollback();
                            $this->flashSession->error('Could not save file information in DB');
                            return $this->response->redirect('clothing_products/index');
                        }
                    }
                    $this->db->commit();
                    $this->flashSession->success("You successful added new product information!");

                } else {
                    $this->db->rollback();
                    $errors = $product->getMessages();

                    foreach ($errors as $error) {
                        $this->flashSession->error($error->getMessage());
                    }

                    $this->view->flash = $this->flash;
                }
                $this->view->products = $this->getAllProducts();

            }
        }
    }

    public function editAction($id)
    {
        $product = ClothingProducts::findFirstById($id);
        $this->view->product = $product;

        if($this->request->isPost())
        {
            $this->db->begin();

            $title       = $this->request->getPost('title');
            $price       = $this->request->getPost('price');
            $description = $this->request->getPost('description');
            $category    = $this->request->getPost('category');

            if($product)
            {
                $product->title         = $title;
                $product->price         = $price;
                $product->description   = $description;
                $product->category      = $category;

                if(!$product->update() && !$this->request->hasFiles())
                {
                    $errors = $product->getMessages();

                    foreach ($errors as $error) {
                        $this->flashSession->error($error->getMessage());
                    }

                    return $this->response->redirect('clothing_products/index');

                } else {

                    $uploadFile = $this->request->getUploadedFiles();

                    foreach ($uploadFile as $file)
                    {
                        $filename = $file->getName();
                        $filetype = $file->getType();
                        $filesize = $file->getSize();

                        if (!$file->isUploadedFile()){
                            continue;
                        }

                        $productFile = ClothingProducts::findFirstByProductFileId($product->id);

                        $path = "images/";
                        unlink($path . $productFile->filename);

                        if(!$productFile){
                            $productFile = new ClothingProducts();
                        }

                        //data from db table clothing_products
                        $productFile->productfile_id = $product->id;
                        $productFile->filename = $filename;
                        $productFile->filetype = $filetype;
                        $productFile->filesize = $filesize;
                        $file->moveTo($path . $filename);

                        if(!$productFile->save())
                        {
                            $this->db->rollback();

                            $errors = $product->getMessages();

                            foreach ($errors as $error)
                            {
                                $this->flashSession->error($error->getMessage());
                            }

                            return $this->response->redirect('clothing_products/index');
                        }
                    }
                    $this->db->commit();
                    $this->flash->success("You updated successful!");
                    return $this->response->redirect('clothing_products/index');
                }
            }
            return $this->response->redirect('clothing_products/index');
        }
    }
    /*FILTERING METHODS */
    public function featuredAction()
    {
        $this->view->products = $this->getFeaturedProducts();
//        $this->view->averageRating = $this->CommonAverageRating($id);
//        $currentPage = $this->request->getQuery('page', 'int', 1);
//        $limit = intval($this->request->get('limit'));
//        $limit = $limit > 0 ? $limit : 6;
//        $product = ClothingProducts::find();
//
//        $paginator = new PaginatorModel(
//            [
//                'data'   => $product,
//                'limit'  => 6,
//                'page'   => $currentPage,
//            ]
//        );
//
//        $this->view->page = $paginator->getPaginate();
//        $this->view->products = $product;
    }

    public function lastMinuteAction()
    {
        $this->view->products = $this->getLastMinuteProducts();
//        $this->view->averageRating = $this->CommonAverageRating();
    }

    public function flashDealsAction()
    {
        $this->view->products = $this->getFlashDealsProducts();
//        $this->view->averageRating = $this->CommonAverageRating();
    }

    //* - PRIVATE METHODS - *//

    /* AVERAGE RATING PRIVATE METHOD*/
    private function getAverageRating($id)
    {
        $average = Reviews::average(
            [
                'conditions'  => "product_id = $id",
                'column'      => 'rating',
            ]
        );
        return $average;
    }
    public function countAverageRating()
    {

    }
    public function CommonAverageRating($id)
    {
        $ratings = Reviews::average(
            [
                'column'    => 'rating',
//                'group' => 'product_id',
                'condition' => 'product_id = :id:',
                'bind'       => [
                    'id' => $id,
                ],
            ]
        );
        return $ratings;
    }

    private function AverageRating($product_id)
    {
        $averageRating = Reviews::average(
            [
                'column'      => 'rating',
                "conditions"  => "product_id = :product_id:",
                "bind" =>
                [
                    'product_id' => $product_id,
                ]
            ]
        );
        return $averageRating;
    }

    private function AverageCountRating($id)
    {
        $averageRating = Reviews::average(
            [
                'condition'   =>
                    "product_id = :id:",
                'bind'       => [
                    'product_id' => $id,
                ],
                'column'      => 'rating',
            ]
        );
        return $averageRating;
    }

    /* GET MY POST method for Reviews by ID !!! */
    private function getMyPost($id)
    {
        $posts = Reviews::find(
            [
                'conditions'    => "product_id = :id:",
                'bind'          => [
                    'id'        => $id,
                ]
            ]
        );
        return $posts;
    }

    //this return me all products for /index
    private function getAllProducts()
    {
        $products = ClothingProducts::find();

        return $products;
    }

    private function getAllPosts()
    {
        $posts = Reviews::find();
        return $posts;
    }

    private function getMoreInformation($id)
    {
        $currentProduct = ClothingProducts::findFirstById($id);

        return $currentProduct;
    }

    //this return me all products or products of some category for /products/
    private function getMyCategory()
    {
        if($this->request->has('category'))
        {
            $products = ClothingProducts::find(
                [
                    'conditions' => 'category = :category:',
                    'bind' =>
                        [
                            'category' => $this->request->get('category')
                        ]
                ]
            );

        }else{
            $products = ClothingProducts::find();
        }
        return $products;
    }

    private function getPrice($id)
    {
        $price = ClothingProducts::findFirstById($id);

        return $price;
    }

    private function getProduct($id)
    {
        $product = ClothingProducts::findFirstById($id);
        return $product;
    }

    private function getFeaturedProducts()
    {
        $products = ClothingProducts::find(
            "category = 'Featured'"
            );
        return $products;
    }

    private function getFlashDealsProducts()
    {
        $products = ClothingProducts::find(
            [
                'conditions' => "category = 'Flash Deals'",
                'order' => 'id',
            ]
        );
        return $products;
    }

    private function getLastMinuteProducts()
    {
        $products = ClothingProducts::find(
            "category = 'Last Minute'"
        );
        return $products;
    }
    //delete my unused products
    private function deleteMyProducts()
    {
        $myProducts = $this->getMyCategory();

        if($myProducts !== false)
        {
            $myProducts->delete();
        }
    }
    //unused method
    private function getList($params)
    {
        // Current page to show
        // In a controller/component this can be:
        // $this->request->getQuery('page', 'int'); // GET
        // $this->request->getPost('page', 'int'); // POST

        $currentPage = (int) $_GET['page'];
        // The data set to paginate

        $products = ClothingProducts::find();

        $paginator = new PaginatorModel(
            [
                'builder'   => $products,
                'limit'     => 10,
                'page'      => $currentPage,
            ]
        );

        // Get the paginated results
        $page = $paginator->paginate();

        return $paginator;
    }

    private function getAllContacts()
    {
        $sentMessages = ClothingContact::find();

        return $sentMessages;
    }
}


//$max = 5;
//$n = 1;
//foreach ($ratings as $rate => $count) {
//    echo 'Seen ', $count, ' ratings of ', $rate, "\n";
//    $max += $rate * $count;
//    $n += $count;
//}
//
//echo 'Average rating: ', $max / $n, "\n";
// indexAction -- about paging pagination
//        $params = $this->request->getQuery();
////        $this->view->pager = ClothingProducts::getList($params);  //for static method in a Model, but now is unused
//        $this->view->pager = $this->getList($params);


//    public function aboutAction()
//    {
////        $this->view->products = $this->getAllProducts();
//    }

//    public function contactAction()
//    {
//        if($this->request->isPost())
//        {
//            $this->db->begin();
//
//            $fullname   = $this->request->getPost('fullname');
//            $email      = $this->request->getPost('email');
//            $subject    = $this->request->getPost('subject');
//            $message    = $this->request->getPost('message');
//
//            $newContact = new ClothingContact();
//            $newContact->fullname = $fullname;
//            $newContact->email = $email;
//            $newContact->subject = $subject;
//            $newContact->message = $message;
//
//            if($newContact->create())
//            {
//                $this->db->commit();
//                $this->flashSession->success("Your message is sent successful!");
//            } else {
//                $this->db->rollback();
//                $errors = $newContact->getMessages();
//
//                foreach ($errors as $error) {
//                    $this->flashSession->error($error->getMessage());
//                }
//            }
//            return $this->response->redirect('clothing_products/contact');
//        }
//    }

//    public function newAction($courtid)
//    {
//        $this->view->courtid = $courtid;
//    }

//    public function productsAction()
//    {
////       $products = $this->getFeaturedProducts();
////       $products = $this->getFlashDealsProducts();
////       $products = $this->getLastMinuteProducts();
////TODO filter logic...
//        $products = $this->view->products = $this->getAllProducts();
//        $filter = array();
//        $this->filter = new Filter();
////        $filter = new Filter();
////        $filter = [ "Featured", "Flash Deals", "Last Minute"  ];
////        var_dump($filter); exit();
//
//        switch ($filter != false){
//            case 1: if($filter = "Featured")
////                $products = $this->view->products = $this->getFeaturedProducts();
//            {
//                $products = $this->getFeaturedProducts();
//            }
//
//                break;
//
//            case 2: if($filter = "Flash Deals")
////                $products = $this->view->products = $this->getFlashDealsProducts();
//            {
//                $products = $this->getFlashDealsProducts();
//            }
//
//                break;
//            case 3: if($filter = "Last Minute")
////                $products = $this->view->products = $this->getLastMinuteProducts();
//            {
//                $products = $this->getLastMinuteProducts();
//            }
//                break;
//            default:
//                return $products = $this->getAllProducts();
//        }
//
////        $products = $this->getAllProducts();
////     $products = $this->view->products = $this->getAllProducts();
//
//     //TODO pagination logic
//
//        $currentPage = 1;
//        $paginator = new Paginator(
//            array(
//                'data' => $products,
//                'limit' => 6,
//                'page' => $currentPage,
//            )
//        );
//
//        $page = $paginator->getPaginate();
//        $this->view->setVar('page', $page);
//
////            $this->view->page = $paginator->getPaginate();
////            $this->view->products = $products;
//    }


//switch ($filter !== false){
//    case $filter = "Featured":
////                $products = $this->view->products = $this->getFeaturedProducts();
//        $products = $this->getFeaturedProducts();
//
//        break;
//    case $filter = "Flash Deals":
////                $products = $this->view->products = $this->getFlashDealsProducts();
//        $products = $this->getFlashDealsProducts();
////                var_dump($filter); exit();
//        break;
//    case $filter = "Last Minute":
////                $products = $this->view->products = $this->getLastMinuteProducts();
//        $products = $this->getLastMinuteProducts();
//
//        break;
//    default:
//        return $products;
//}
//        if($filter = "Featured") {
//            $products = $this->getFeaturedProducts();
//            $this->flashSession->success("You filtered by Featured!");
//        }
//
//        if ($filter = "Flash Deals") {
//            $products = $this->getFlashDealsProducts();
//            $this->flashSession->success("You filtered by Flash Deals!");
//        }
//
//        if ($filter = "Last Minute") {
//            $products = $this->getLastMinuteProducts();
//            $this->flashSession->success("You filtered by Last Minute!");
//        }

/* // older version of my paging pagination
      $products = ClothingProducts::find();
      $currentPage = 1;
//        $currentPage = (int) $_GET['page'];
      $paginator = new Paginator(
          array(
              'data' => $products,
              'limit' => 1,           //not more 1 :)
              'page' => $currentPage,
          )
      );
      $page = $paginator->getPaginate();
      $this->view->setVar('page', $page);
      */

/**this method is in the Model CLothingProducts
 * View a list of products
 */

//        $params = $this->request->getQuery();
//        $this->view->div = ClothingProducts::getList($params);

//        $ratingCollection = $this->assets->collection("rating");
//        $ratingCollection->addJs('js/star-rating.min.js');
//        $ratingCollection->addCss('css/fontawesome.min.css');
//        $ratingCollection->addCss('css/star-rating.min.css');


//                    $productCategory = new CategoryProducts();
//                    $productCategory->category_id = $product->id;
//                    $productCategory->category_title = $category_title;

//                    var_dump($productCategory); exit();

//            $category_title = $this->request->getPost('catefory_title');
//$productCategory = CategoryProducts::findFirstByCategoryId($product->id);
//            var_dump($productCategory); exit();

//sorting by category starting here...
//1st default value is all products
//$defaultValue = "All products";
//$category = array(
//    "Featured",
//    "Flash Deals",
//    "Last Minute",
//);
//        var_dump($category);
//krsort($category);

//        var_dump($category); exit();
//end sorting here...

//        $products = "SELECT * FROM ClothingProduts WHERE category =:category:";
//        $invoices = $this->modelsManager->executeQuery($products);
//
//        foreach ($invoices as $invoice)
//        {
//            echo $invoice->products=$this->getAllProducts();
//        }