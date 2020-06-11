const url = require('url');

exports.get = function (request, response) {
    var queryObject = url.parse(request.url, true).query;
    console.log("query:", JSON.stringify(queryObject));
    var name = queryObject['name'];
    response.statusCode = 200
    response.setHeader('Content-Type', 'text/plain')
    response.setHeader('Access-Control-Allow-Origin', '*')
    response.setHeader('Access-Control-Allow-Headers', 'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin');
    /*response.setHeader('Access-Control-Expose-Headers', 'Authorization, authenticated');
    response.setHeader('Access-Control-Allow-Methods', 'GET, POST, PATCH, PUT, OPTIONS');
    response.setHeader('Access-Control-Allow-Credentials', 'true');
    */
    var res = { "text": "Hello " + name + " !!" };
    response.end(res.text);
    //response.end(JSON.stringify(res));
    //response.end("Hello World!!");
}

exports.post = function (request, response) {
    let body = '';
    request.on('data', function (chunk) {
        body += chunk;
        //body += chunk.toString(); // convert Buffer to string
    });
    request.on('end', function () {

        postBody = JSON.parse(body);
        //var val = {"text": "The newspaper is  " + postBody.Newspaper };
        var sum= parseInt(postBody.N1,10)+parseInt(postBody.N2,10)+parseInt(postBody.N3,10)+parseInt(postBody.N4,10)+parseInt(postBody.N5,10);
        response.statusCode = 200;
        response.setHeader('Content-Type', 'text/plain')
        response.setHeader('Access-Control-Allow-Origin', '*')
        response.setHeader('Access-Control-Allow-Headers', 'Origin, Content-Type, Cookie, X-CSRF-TOKEN, Accept, Authorization, X-XSRF-TOKEN, Access-Control-Allow-Origin');
       // response.end(JSON.stringify(val));
       //response.end(postBody.Newspaper);
       response.end("The sum is: "+sum);

        console.log(body);

        //response.end('ok');
    });
}