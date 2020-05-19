<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Uniqueness;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength as StringLengthValidator;
use Phalcon\Http\Message\UploadedFile;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use Phalcon\Filter;

class ClothingProducts extends Model
{
    public $id;
    public $title;
    public $price;
    public $description;
    public $category;

    public function initialize()
    {
        //1st table with id, title, price, description
        $this->setSource('clothing_products');

        $this->allowEmptyStringValues(['title','body']);

        $this->hasMany(
            'id',
            Reviews::class,
            'product_id',
            array
            (
                'foreignKey'=> true
            )
        );

        $this->hasMany(
            'id',
            ProductFiles::class,
            'productfile_id',
            array
            (
                'foreignKey'=> true
            )
        );

        $this->hasMany(
            'id',
            Reviews::class,
            'myProductsId',
            array
            (
                'foreignKey'=> true
            )
        );

    }

//    public function beforeValidationOnCreate()
//    {
//        $this->date_added = time();
//        return true;
//
//    }

    /**
     * Get a paginator list of product items
     *
     * @param array $params
     * @return PaginatorQueryBuilder
     */

    public static function getList($params)
    {
        //Query defaults
        $page = (int) ($params['page'] ?: 1);
        $limit = $params['limit'] ?: 6;

        $builder = \Phalcon\Di::getDefault()
            ->getModelsManager()
            ->createBuilder();

        $paginator = new PaginatorQueryBuilder(
            [
                'builder' => $builder,
                'limit' => $limit,
                'page' => $page,
            ]
        );

        return $paginator;
    }

    public function validation()
    {
        $validator = new Validation();

        $validator->add(['title', 'price', 'description', 'category'],

            new PresenceOf(
                [
                    "message" => ":field is required"
                ]
            ));


        $validator->add(
                'title',
            new Uniqueness(
                [
                    "message"=> "The product title must be unique!",
                ]
            ));

        return  $this->validate($validator);

        if ($this->validationHasFailed() === true){
            return false;
        }
    }
}