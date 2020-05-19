<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\ModelsManager;
use Phalcon\Filter;
use Phalcon\Mvc\Model\Transaction\Manager;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Paginator\Adapter\NativeArray;
use Phalcon\Resultset;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class OurClothingProductsController extends ControllerBase
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
        $this->view->products = $this->getAllProducts();

        $products = ClothingProducts::find();
        $id = $this->request->get('id', 'int', 0);
        $products->id = $id;
//        var_dump($id); exit();

        $average = $this->view->averageRating = $this->VAverageRating($id);

        /* Pagination here */
//        $numberPage = 1;
        $currentPage = $this->request->getQuery('page', 'int', 1);
        $page = intval($this->request->get('page'));
        $limit = intval($this->request->get('limit'));
        $page = $page > 0 ? $page : 1;
        $limit = $limit > 0 ? $limit : 6;
        $offset = ($page - 1) * $limit;
//        $start = ($limit * ($page.$currentPage - 1)) +1;        //1
//        $nextPage = $page + 1  ;
//        var_dump($nextPage);    exit();
//        $totalPages = ($limit * ($page.$currentPage - 1)) +$limit;     //6

        $paginator = new PaginatorModel(
            [
                'data'   => $products,
                'limit'  => $limit,
                'page'   => $currentPage,
                'offset' => $offset,
            ]
        );


//        $page = $paginator->getPaginate();
//        var_dump($page); exit();
        $this->view->setVar('page', $page);

        $this->view->page = $paginator->getPaginate();
//        $this->view->products = $product;
        /*totalPages of pagination*/

    }
    /*examples with limit and offset in find(), findFirst() etc functions...*/

    //get first 6 product ordered by id not work
    private  function LimitationItems($id)
    {
        $items = Reviews::find(
            [
                'conditions' => 'product_id = :id:',
                'bind'      => [
                    'id'    => $id,
                ],
                'limit'  => 6,
                'offset' => 6,
            ]
        );

        return $items;
    }
    /*PAGINATION private functions*/
    private function PaginationSQL()
    {
        $paging = ClothingProducts::find(

        );
    }

    /* AVERAGE RATING PRIVATE METHOD*/
    private function VAverageRating($id)
    {
        $averageRating = Reviews::average(
            [
                "column"      => "rating",
                "conditions"  => "product_id = :id:",
                "bind"  =>[
                    "id" => $id,
                ],
            ]
        );
        return $averageRating;
    }

    private function CAverageRating($product_id)
    {
        $averageRating = Reviews::average(
            [
                'column'      => 'rating',
                'conditions'  => 'id = :product_id:',
                'bind'        =>[
                    'product_id' => $product_id,
                ],
            ]
        );
        return $averageRating;
    }

    /*Average rating from all element from the field rating*/
    private function CommonAverageRating()
    {
        $averageRating = Reviews::average(
            [
                'column'      => 'rating',
            ]
        );
        return $averageRating;
    }

    /* from ClothingProductsController.php */
    private function getAverageRating($id)
    {
        $averageRating = Reviews::average(
            [
                'conditions'  => "product_id = $id",
                'column'      => 'rating'
            ]
        );
        return $averageRating;
    }

    private function simpleAverageRating($id)
    {
        $averageRating = Reviews::average(
            [
                'column'      => 'rating',
                'conditions'  => "product_id = :id:",
                "bind"        => [
                    'product_id' => $id,
                ]
            ]
        );
        return $averageRating;
    }

    private function getAllProducts()
    {
        $products = ClothingProducts::find();

        return $products;
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
                'order' => 'id, category',
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

}

//from indexAction()
//TODO pagination logic

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

//            $this->view->page = $paginator->getPaginate();
//            $this->view->products = $products;





//        $filter = array();
//        $this->filter = new Filter();
//       $products = $this->getAllProducts();
//       $products = $this->view->products = $this->getAllProducts();
//       $products = $this->getFeaturedProducts();
//       $products = $this->getFlashDealsProducts();
//       $products = $this->getLastMinuteProducts();
//        TODO filter logic...
//        $filter = new Filter();
//        $filter = [ "Featured", "Flash Deals", "Last Minute"  ];
//        var_dump($filter); exit();

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