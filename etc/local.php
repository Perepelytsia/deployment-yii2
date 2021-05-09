<?php
return [
    'components' => [
        'db' => [
            'dsn'      => 'mysql:host=mysql5.7;dbname=slots',
            'username' => 'root',
            'password' => 'admin',
            'queryCache' => 'cacheRedis',
            'on afterOpen' => function($event) {  $event->sender->createCommand("SET sql_mode = ''")->execute();}
        ],
        'dbStatsFull' => [
            'class' => \app\components\DbConnection::class,
            'dsn'      => 'mysql:host=mysql5.7;dbname=slots_stats_full',
            'username' => 'root',
            'password' => 'admin',
        ],
        'clickHouse' => function() {
            return new \app\components\ClickHouse([
                'host' => 'clickhouse21.4',
                'port' => '8123',
                'username' => 'default',
                'password' => '',
            ],[
                'database' => 'slots',
            ]);
        },
        'redis' => [
            'class' => 'yii\redis\Connection',
            'port'     => 6379,
            'database' => 0,
            'unixSocket' => null,
            'hostname' => 'redis5.0',
        ],
    ]
];
