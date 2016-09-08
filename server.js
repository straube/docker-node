'use strict';

/*
 * Docker + Node
 *
 * Sample Node.JS app to run in a Docker container.
 *
 * Please refer to README.md on how to install and run the application.
 *
 * @author Gustavo Straube <gustavo@creativeduo.com.br>
 */

require('dotenv').load();

const http = require('http');
const server = http.createServer((req, res) => {
    res.write('Hello world\n');
    res.end();
});
server.listen(process.env.LISTEN_PORT);
