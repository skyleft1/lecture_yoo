/*
 * reference site
 * http://stackoverflow.com/questions/4505809/how-to-post-to-a-request-using-node-js
 */

var http  = require('http');
var $url  = require('url');
var $fs   = require('fs' );
var $qs   = require('querystring');

var dataJson = JSON.stringify({
    'foo'     : 'bar',
    'email'   : 'email@mail.com',
    'password': 'a075d17f3d453073853f813838c15b8023b8c487038436354fe599c3942e1f95'
});

var dataXml = '';
dataXml += '<?xml version="1.0" encoding="utf-8"?>  ';
dataXml += '<REST>                                  ';
dataXml += '    <ListOfLN_Interface>                ';
dataXml += '        <Contact>123304</Contact>       ';
dataXml += '    </ListOfLN_Interface>               ';
dataXml += '</REST>                                 ';

// http://stackoverflow.com/questions/4295782/how-do-you-extract-post-data-in-node-js
function getParams(request, response, callback) {
    var params = null;

    if(typeof callback !== 'function') return null;

    if(request.method === 'POST') {
        var queryData = "";
        request.on('data', function(data) {
            queryData += data;
            if(queryData.length > 1e6) {
                queryData = "";
                response.writeHead(413, {'Content-Type': 'text/plain'}).end();
                request.connection.destroy();
            }
        });

        request.on('end', function() {
            params = $qs.parse(queryData);
            callback(params);
        });
    }
    else if (request.method.toUpperCase() === 'GET') {
        params = $url.parse(request.url, true);
        console.log(params.query);

        callback(params);
    }
    else {
        response.writeHead(405, {'Content-Type': 'text/plain'} );
        response.end();
    }
}

http.createServer( function(req, res) {

    console.log('request received.');

    var urlpath = $url.parse(req.url).pathname;

    if( urlpath === '/checkid' && req.method.toUpperCase()==='GET'  ) {
        // 비동기적 읽기
        var filename = __dirname + '/item.html';
        $fs.readFile( filename, 'utf8', function (err, data) {
            if (err) {
                throw err;
            }

            console.log( filename + ' file readed');

            res.writeHead(200, {
                'Access-Control-Allow-Origin': '*', /* 크로스 도메인 지원 설정 */
                'Content-Type': 'text/plain; charset=utf-8',
                'Content-Length': Buffer.byteLength(data)
            });
            res.write(data);
            res.end();
        });
    }

    if( urlpath === '/checksms' && req.method.toUpperCase()==='GET'  ) {
        // 비동기적 읽기
        var filename = __dirname + '/item.html';
        $fs.readFile( filename, 'utf8', function (err, data) {
            if (err) {
                throw err;
            }

            console.log( filename + ' file readed');

            res.writeHead(200, {
                'Access-Control-Allow-Origin': '*', /* 크로스 도메인 지원 설정 */
                'Content-Type': 'text/html; charset=utf-8',
                'Content-Length': Buffer.byteLength(data)
            });
            res.write(data);
            res.end();
        });
    }

    if( urlpath === '/checkemail' && req.method.toUpperCase()==='GET'  ) {
        // 비동기적 읽기
        var filename = __dirname + '/item.xml';
        $fs.readFile( filename, 'utf8', function (err, data) {
            if (err) {
                throw err;
            }

            console.log( filename + ' file readed');
            res.writeHead(200, {
                'Access-Control-Allow-Origin': '*', /* 크로스 도메인 지원 설정 */
                'Content-Type': 'application/xml, charset=utf-8',
                'Content-Length': Buffer.byteLength(data)
            });
            res.write(data);
            res.end();
        });
    }

}).listen(3000, 'localhost');

console.log('start server - anonymous function');

