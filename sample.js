//Serves file based on url
//HTTPrequest
const hostname='localhost';
const port = 8081;
var http = require("http");
var fs = require("fs");
var path= require("path");
const url = require('url');

//http.get
const server= http.createServer(function (request, response) {
        console.log("Url: "+request.url);
        console.log("Headers: "+JSON.stringify(request.headers));
        console.log("Method: "+request.method);
        if(request.method=='GET'){
            if(request.url=='/')
                var fileUrl="input.txt";
            else
                var fileUrl=request.url;
            var filePath = path.resolve('./'+fileUrl);
            console.log("filepath: "+filePath);
            const fileExt = path.extname(filePath);
            if (fileExt == '.txt') {
                fs.exists(filePath, (exists) => {
                if (!exists) {
                    response.statusCode = 404;
                    response.setHeader('Content-Type', 'text/plain');
                    response.end('Error 404: ' + fileUrl + 
                                ' not found');
                    return;
                }
                
                fs.readFile( filePath, function (err, data) {
                    response.statusCode = 200
                    response.setHeader('Content-Type', 'text/plain')
                    response.end( data );
                });
                
            });
            }
            else {
                response.statusCode = 404;
                response.setHeader('Content-Type', 'text/plain');
                response.end(fileUrl + 
                        ' not a txt file');
              }
        }
        else if(request.method=='POST'){
            

        }
        
     });
 
 //server.listen(8081);
 server.listen(port,hostname,()=>{console.log(`Server running at http://${hostname}:${port}`);});
 

/* const https = require('https')
const options = {
  hostname: 127.0.0.1,
  port: 8081,
  path: '/todos',
  method: 'GET'
}

const req = https.request(options, res => {
  console.log(`statusCode: ${res.statusCode}`)

  res.on('data', d => {
    process.stdout.write(d)
  })
})

req.on('error', error => {
  console.error(error)
})

req.end();*/
 