FROM python:3.11-alpine

WORKDIR /app

COPY patch.txt /app/patch.txt

RUN printf '%s
' \
'from http.server import BaseHTTPRequestHandler, HTTPServer' \
'import os' \
'' \
'PORT = int(os.environ.get("PORT", "8080"))' \
'' \
'class Handler(BaseHTTPRequestHandler):' \
'    def do_GET(self):' \
'        self.send_response(200)' \
'        self.send_header("Content-type", "text/plain; charset=utf-8")' \
'        self.end_headers()' \
'        with open("/app/patch.txt", "rb") as f:' \
'            self.wfile.write(f.read())' \
'' \
'HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()' \
> /app/app.py

CMD ["python", "/app/app.py"]
