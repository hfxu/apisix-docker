docker exec -u root -t -i e96258c84ddea15939583674b091373061c0b2605f2cd9d37a4514c96d6bf08a /bin/bash
docker exec -it e96258c84ddea15939583674b091373061c0b2605f2cd9d37a4514c96d6bf08a sh
docker exec -u 0 -it e96258c84ddea15939583674b091373061c0b2605f2cd9d37a4514c96d6bf08a /bin/bash


docker cp apisix/plugins/jwt-auth-auto-refresh.lua b43e047f5e4ef80b98175bb1b89c8e307ff0b3dc9a0442d3d6a7bee4d0c19e19:/usr/local/apisix/apisix/plugins/jwt-auth-auto-refresh.lua
docker cp schema.json 1f217ce6e394c96c3096588dbabf926b2c91ba93e9c5d9d1292a1230016b5610:/usr/local/apisix-dashboard/conf/schema.json



curl http://127.0.0.1:9180/apisix/admin/consumers \
-H 'X-API-KEY: edd1c9f034335f136f87ad84b625c8f1' -X PUT -d '
{
    "username": "jack",
    "plugins": {
        "jwt-auth-auto-refresh": {
            "key": "user-key",
            "secret": "my-secret-key"
        }
    }
}'