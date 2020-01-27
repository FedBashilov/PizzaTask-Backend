<?php

// Роутер
function route($method, $urlData, $formData) {
    
    require 'database.php';

    if ($method === 'GET') {
            // Получение id товаров
            // GET /products
        if (count($urlData) === 0) {
            $allProductsId = [];
            $sql = "SELECT product_id FROM product";

            if($result = mysqli_query($con,$sql)) {
                
                for($i = 0; $row = mysqli_fetch_assoc($result); $i++) {
                    $allProductsId[$i] = $row['product_id'];
                }
                echo json_encode($allProductsId);
            }
            else {
                http_response_code(404);
            }
            return;
        }
            // Получение информации о товаре
            // GET /products/{product_id}
        if (count($urlData) === 1) {
            $product_id = $urlData[0];
            $sql = "SELECT product_id, name, description, price, photo FROM product WHERE product_id = '$product_id'";

            if($result = mysqli_query($con,$sql)) {
                
                $row = mysqli_fetch_assoc($result);
                
                $product['product_id'] = $row['product_id'];
                $product['name'] = $row['name'];
                $product['description'] = $row['description'];
                $product['price'] = $row['price'];
                $product['photo'] = $row['photo'];
                
                echo json_encode($product);
            }
            else {
                http_response_code(404);
            }
            return;
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