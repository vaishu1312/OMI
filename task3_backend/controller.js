const http = require('http');


module.exports = http.createServer(function (request, response) {

    var service = require('./service.js');

    console.log("Url: " + request.url);
    console.log("Headers: " + JSON.stringify(request.headers));
    console.log("Method: " + request.method);

    if (request.method == 'GET') {

        service.get(request,response);
        
    }
    else if (request.url=='/post' && request.method == 'POST') {
        service.post(request,response);
    }
    else{
        console.log("wrong url");
    }
        
});

