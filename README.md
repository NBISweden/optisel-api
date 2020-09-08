# optiSel API

## Build the stack
```sh
docker-compose build
docker-compose up
```
## Query the endpoints
```sh
curl -XGET 127.0.0.1:31113/inbreeding --header "Content-Type: application/json"
```

```sh
curl -XGET 127.0.0.1:31113/kinship --header "Content-Type: application/json"
```
