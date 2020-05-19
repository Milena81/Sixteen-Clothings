<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;

class Reviews extends Model
{
    public $id;
    public $product_id;
    public $reviewer_name;
    public $rating;
    public $title_review;
    public $review_content;
    public $published_data;

    public function initialize()
    {
        //2nd table with id, fk products_id, rating
        $this->setSource('reviews');

        $this->belongsTo(
            'product_id',
            ClothingProducts::class,
            'id',
            array(
                'alias'=>'post',
                'reusable'=>true
            )
        );
    }

    public function validation()
    {
        $validator = new Validation();

        $validator->add(['title_review', 'reviewer_name', 'rating', 'review_content'],

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