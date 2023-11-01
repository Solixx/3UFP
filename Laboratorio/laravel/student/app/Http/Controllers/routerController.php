<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class routerController extends Controller
{
    public function index()
    {
        return 'welcome';
    }

    public function hello()
    {
        return 'Hello';
    }

    public function about()
    {
        return 'About';
    }
}
