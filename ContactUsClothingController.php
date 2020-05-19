<?php

use Phalcon\Mvc\Model;
use Phalcon\Mvc\ModelsManager;
use Phalcon\Filter;
use Phalcon\Mvc\Model\Transaction\Manager;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Paginator\Adapter\NativeArray;
use Phalcon\Resultset;

class ContactUsClothingController extends ControllerBase
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
        if($this->request->isPost())
        {
            $this->db->begin();

            $fullname   = $this->request->getPost('fullname');
            $email      = $this->request->getPost('email');
            $subject    = $this->request->getPost('subject');
            $message    = $this->request->getPost('message');

            $newContact = new ClothingContact();
            $newContact->fullname = $fullname;
            $newContact->email = $email;
            $newContact->subject = $subject;
            $newContact->message = $message;

            if($newContact->create())
            {
                $this->db->commit();
                $this->flashSession->success("Your message is sent successful!");
            } else {
                $this->db->rollback();
                $errors = $newContact->getMessages();

                foreach ($errors as $error) {
                    $this->flashSession->error($error->getMessage());
                }
            }
            return $this->response->redirect('clothing_products/contact');
        }
    }
}