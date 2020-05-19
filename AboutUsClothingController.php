<?php
use Phalcon\Mvc\Model;
use Phalcon\Mvc\ModelsManager;
use Phalcon\Filter;
use Phalcon\Mvc\Model\Transaction\Manager;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Paginator\Adapter\NativeArray;
use Phalcon\Resultset;

class AboutUsClothingController extends ControllerBase
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
//        $this->view->products = $this->getAllProducts();
    }

}