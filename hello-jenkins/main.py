from http.server import HTTPServer, BaseHTTPRequestHandler


class HttpHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        print(self.path)
        if self.path == "/":
            print(self.path)
            self.send_response(200)
            self.send_header("Content-type", "json")
            self.end_headers()
            req = '{"message": "hello jenkins"}'
            self.wfile.write(req.encode("utf-8"))         

    
httpd = HTTPServer(("127.0.0.1", 8000), HttpHandler)
httpd.serve_forever()
