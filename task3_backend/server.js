//HTTPrequest
const hostname = 'localhost';
const port = 8081;

const http = require('http');

const server = require('./controller.js');
/*
var http = require("http");
const url = require('url');

//http.get
const server = http.createServer(function (request, response) {
    console.log("Url: " + request.url);
    console.log("Headers: " + JSON.stringify(request.headers));
    console.log("Method: " + request.method);
    if (request.method == 'GET') {
        var queryObject = url.parse(request.url, true).query;
        console.log("query:", JSON.stringify(queryObject));
        var name = queryObject['name'];
        response.statusCode = 200
        response.setHeader('Content-Type', 'text/plain')
        response.end("Hello " + name);
    }
    else if (request.method == 'POST') {
        let body = '';
        request.on('data', chunk => {
            body += chunk.toString(); // convert Buffer to string
        });
        request.on('end', () => {
            console.log(body);
            response.statusCode = 200
            response.end('ok');
        });
    }
});*/

server.listen(port, hostname, () => { console.log(`Server running at http://${hostname}:${port}`); });


/*//get req

const get_options = {
  hostname: 'localhost',
  port: 8081,
  path: '/',
  method: 'GET'
}

const get_req = http.request(get_options, res => {
  console.log(`statusCode: ${res.statusCode}`)
  let data = ""
  res.on('data', d => {
    data += d;
  })
  res.on('end', () => {
    console.log("Get Data is: "+data);
  })
})

get_req.on('error', error => {
  console.error(error)
})

get_req.end();

//posting a req

let body = JSON.stringify({
  title: "Make a request with Node's http module"
})

const post_options = {
  hostname: 'localhost',
  port: 8081,
  path: '/post',
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    "Content-Length": Buffer.byteLength(body)
  }
}

const post_req = http.request(post_options, res => {
  console.log(`statusCode: ${res.statusCode}`)
    let data = ""
    res.on("data", d => {
      data += d
    })
    res.on("end", () => {
      console.log("Post data: "+data)
    })
  })
  post_req.on("error", console.error)
  post_req.end(body);
  */
  