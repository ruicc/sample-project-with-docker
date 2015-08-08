<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class ExampleTest extends TestCase
{
    /**
     * A basic functional test example.
     *
     * @return void
     */
    public function testBasicExample()
    {
        $ch = curl_init('http://web:80/user');
        curl_setopt_array(
            $ch,
            [CURLOPT_RETURNTRANSFER => true,
            ]
        );
        $response = curl_exec($ch);
        $json = json_decode($response, true);
        $this->assertTrue($json['name'] == 'Alice');
    }
}
