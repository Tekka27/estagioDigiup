<?php
//web.php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

use Illuminate\Support\Facades\Redis;

Route::get('/store', function() {
    Redis::set('foo', 'bar');
});

Route::get('/retrieve', function() {
    return Redis::get('foo');
});


use App\Mail\TestMail;
use Illuminate\Support\Facades\Mail;

Route::get('/send-email', function() {
    Mail::to('isaac@isaacsouza.dev')->send(new TestMail);
});



