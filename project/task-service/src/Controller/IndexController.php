<?php

declare(strict_types=1);

namespace App\Controller;

use Iborysenko\Rest\Controller\RestController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends RestController
{
    /**
     * @Route(path="/", methods={"GET"})
     * @return Response
     */
    public function indexAction(): Response
    {
        $responseData = [
            'service' => 'Task Service',
            'server' => 'Road Runner1'
        ];

        return $this->responder->createResponse($responseData);
    }
}
