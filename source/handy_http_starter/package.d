module handy_http_starter;

public import handy_http_transport;
public import handy_http_primitives;
public import handy_http_data;
public import handy_http_websockets;

/**
 * Starts an HTTP server, using the given handler to handle all incoming
 * requests.
 * Params:
 *   handler = The handler to use for requests.
 *   port = The port to host the server on. Defaults to 8080.
 */
void startServer(HttpRequestHandler handler, ushort port = 8080) {
    HttpTransport tp = new TaskPoolHttp1Transport(handler, port);
    tp.start();
}

/**
 * Starts an HTTP server, using the given delegate function to handle all
 * incoming requests.
 * Params:
 *   dg = The handler delegate function.
 *   port = The port to host the server on. Defaults to 8080.
 */
void startServer(
    void delegate(ref ServerHttpRequest, ref ServerHttpResponse) dg,
    ushort port = 8080
) {
    auto handler = new class HttpRequestHandler {
        void handle(ref ServerHttpRequest req, ref ServerHttpResponse resp) {
            dg(req, resp);
        }
    };
    startServer(handler, port);
}
