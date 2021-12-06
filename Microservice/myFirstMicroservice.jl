# server.jl
using Pkg
Pkg.add("HttpServer")
Pkg.add("JSON")
using HttpServer
using JSON

http = HttpHandler() do req::Request, res::Response
    request_dictionary = JSON.parse(bytestring(req.data))
    response = JSON.json(Dict("status" => "Got your message!"))
    return Response(response)
end
server = Server(http)
run(server, 2929)