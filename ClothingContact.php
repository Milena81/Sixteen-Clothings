<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
//use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;
//use Phalcon\Validation\Validator\StringLength as StringLengthValidator;
//use Phalcon\Http\Message\UploadedFile;
//use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

class ClothingContact extends Model
{
    public $fullname;
    public $email;
    public $subject;
    public $message;

    public function initialize()
    {
        //1st table with id, title, price, description
        $this->setSource('clothing_contact');

    }

    public function validation()
    {
        $validator = new Validation();

        $validator->add(['fullname', 'email', 'subject', 'message'],

            new PresenceOf(
                [
                    "message" => ":field is required"
                ]
            ));

        return  $this->validate($validator);

        if ($this->validationHasFailed() === true){
            return false;
        }
    }
}