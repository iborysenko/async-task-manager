<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class IndexController extends AbstractController
{
    /**
     * @Route(path="/", methods={"GET"})
     *
     * @return Response
     */
    public function indexAction(): Response
    {
        $response = [
            'service' => 'Task Service',
            'server' => 'Road Runner1'
        ];

        return new Response(json_encode($response));
    }
}
