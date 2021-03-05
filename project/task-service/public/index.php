<?php

use App\Kernel;
use Symfony\Component\Dotenv\Dotenv;
use Symfony\Component\ErrorHandler\Debug;
use Symfony\Component\HttpFoundation\Request;

require dirname(__DIR__).'/vendor/autoload.php';

if (getenv('APP_DEBUG') === 'yes') {
    umask(0000);
    Debug::enable();
}

$kernel = new Kernel(getenv('APP_ENV'), getenv('APP_DEBUG') === 'yes');
$request = Request::createFromGlobals();
$response = $kernel->handle($request);
$response->send();
$kernel->terminate($request, $response);
