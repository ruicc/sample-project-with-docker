<?php

$uri = $_SERVER['REQUEST_URI'];
$method = $_SERVER['REQUEST_METHOD'];
list($_, $cont) = explode('/', "$uri/");


switch ([$method, $cont]) {
case ['POST', 'user']:
    header('HTTP/1.1 200 OK');
    header('Content-Type: application/json');
    exit;
case ['GET', 'user']:
    header('HTTP/1.1 200 OK');
    header('Content-Type: application/json');
    echo json_encode([
        'id' => 123,
        'name' => 'Alice',
        'age' => 26,
        ]);
    exit;
default:
    header('HTTP/1.1 404 Not Found');
    exit;
    break;
}
