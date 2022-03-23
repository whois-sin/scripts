import socket

# target_host accepts site as a standalone domain name
target_host = "example.com" 
target_port = 80

# creates a socket object
# AF_INET indicates IPv4 address or hostname
# SOCK_STREAM indicates that this will be a TCP client
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as client:

# connects the client to the specified host and port
    client.connect((target_host,target_port))

# client.send needs a byte like object
# sends data as bytes by adding the "b" before the string
# you can alternatively use (bytes("GET...", "UTF-8"))
    client.send(b"GET / HTTP/1.1\r\nHOST: example.com\r\n\r\n")
    print(client.send)
# receives response from the server byte size is relative to content length
    response = client.recv(8192)
# prints response from the server and decodes the bytes to UTF-8 format
print(response.decode())
