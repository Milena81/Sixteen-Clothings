<?php

use Phalcon\Mvc\Model;
//use Phalcon\Validation;
//use Phalcon\Validation\Validator\Uniqueness;
//use Phalcon\Validation\Validator\PresenceOf;
//use Phalcon\Validation\Validator\StringLength as StringLengthValidator;
//use Phalcon\Http\Message\UploadedFile;

class CategoryProducts extends Model
{
    public $id;
    public $category_id;
//    public $category_title;///////

    public function initialize()
    {
        $this->setSource('category_products');

        $this->belongsTo(
            'category_id',
            ClothingProducts::class,
            'id',
            array(
                'alias'=>'product',
                'reusable'=>true
            )
        );
    }
}