<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

class Purchase extends Model
{
    public $id;
    public $myProductsId;
    public $fullname;
    public $email;
    public $phoneNumber;
    public $street;
    public $street2;
    public $city;
    public $state;
    public $postalCode;
    public $country;
    public $myProductQuantity;
    public $payment;

    public function initialize()
    {
        $this->setSource('purchase');

        $this->belongsTo(
            'myProductsId',
            ClothingProducts::class,
            'id',
            array(
                'alias'=>'product',
                'reusable'=>true
            )
        );

    }

    public function validation()
    {
        $validator = new Validation();

        $validator->add(['fullname', 'email', 'phoneNumber', 'street', 'city',
            'state', 'postalCode', 'country', 'myProductQuantity', 'payment'],

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