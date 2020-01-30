<?php

// Роутер
function route($method, $urlData, $formData) {
    
    require 'database.php';

            // Добавление заказа 
            // POST /orders

    if ($method === 'POST') {
        $newOrder = json_decode($formData);
        
  // Sanitize.
        $client_name = mysqli_real_escape_string($con, trim( $newOrder->data->client_name));
        $client_phone = mysqli_real_escape_string($con, trim( $newOrder->data->client_phone));
        $client_email = mysqli_real_escape_string($con, trim( $newOrder->data->client_email));
        $client_address = mysqli_real_escape_string($con, trim( $newOrder->data->client_address));
        $client_comment = mysqli_real_escape_string($con, trim( $newOrder->data->client_comment));
        
        echo $client_name;
        echo $client_phone;
        echo $client_email;
        echo $client_address;
        echo $client_comment;

  // Store.
        $sqlOrder = "INSERT INTO `client_order`(`id`,`client_name`,`client_phone`,  `client_address`, `client_email`, `client_comment`) VALUES (null,'{$client_name}','{$client_phone}', '{$client_address}', '{$client_email}', '{$client_comment}')";
        
        if($con)
        {
            echo "CONNECT";
        };

        if(mysqli_query($con,$sqlOrder)){
            http_response_code(201);
            $newOrderId = mysqli_insert_id($con);
            
            
            
            foreach($newOrder->data->products as $order_product){
                $sqlOrderProduct= "INSERT INTO `order_product`(`order_id`,`product_id`,`amount`) VALUES ('{$newOrderId}','{$order_product->id}', '{$order_product->amount}')";
                
                if(mysqli_query($con, $sqlOrderProduct)){
                    http_response_code(201);
                } else {
                    http_response_code(422);
                    echo "error";
                    break;
                }
            }
            
            
            echo json_encode(['data'=>$newOrderId]);
        }
        else
        {
            http_response_code(422);
            echo "error";
        }
        
        return;
    }
 
    // Возвращаем ошибку
    header('HTTP/1.0 400 Bad Request');
    echo json_encode(array(
        'error' => 'Bad Request'
    ));
}

?>