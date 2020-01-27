<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

// Определяем метод запроса
$method = $_SERVER['REQUEST_METHOD'];

// Получаем данные из тела запроса
$formData = getFormData($method);

// Получение данных из тела запроса
function getFormData($method) {
 
    // GET или POST: данные возвращаем как есть
    if ($method === 'GET') return $_GET;
    if ($method === 'POST'){
        $postdata = file_get_contents("php://input");
        return $postdata;
    }
    
    return "shit";
}

// Разбираем url
$url = explode('?', $_SERVER['REQUEST_URI'], 2);
$url = trim($url[0], '/');

$urls = explode('/', $url);

// Определяем роутер и url data
$router = $urls[1];

$urlData = array_slice($urls, 2);

// Подключаем файл-роутер и запускаем главную функцию
include_once 'routers/' . $router . '.php';
route($method, $urlData, $formData);

?>