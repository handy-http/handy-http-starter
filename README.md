# Handy-HTTP Starter

A collection of Handy-HTTP dependencies and common boilerplate code for starting a web server in minutes.

Here's how you can use this:

1. Create your new project with `dub init`.
2. Add the `handy-http-starter` dependency when prompted by Dub to add dependencies, or afterwards with `dub add handy-http-starter`.
3. Start your server using the `startServer` function, as shown in the following example:
```d
import handy_http_starter;

void main() {
    startServer((ref request, ref response) {
        response.headers.add("Content-Type", "text/plain");
        response.headers.add("Content-Length", "12");
        response.outputStream.write(cast(ubyte[]) "Hello world!")
    });
}
```

## What's included?

When you add `handy-http-starter` to your project, you'll be transitively
adding dependencies for all of the following components, at the highest version
matching the major version of the starter:

- [Handy-HTTP Primitives](https://git.andrewlalis.com/Handy-Http/primitives)
for basic HTTP types and functions.
- [Handy-HTTP Transport](https://git.andrewlalis.com/Handy-Http/transport)
for the HTTP server that handles connections and all the boring stuff in
between the client and your request handler logic.
- More to come as Handy-HTTP is developed!
