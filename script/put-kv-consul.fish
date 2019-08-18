#!/usr/bin/env fish

function put_consul
  argparse -n put_consul 'h/help' -- $argv
  or return 1

  if set -lq _flag_help
    echo "put-consul.fish: Put server.port to Consul as Destributed Configuration"
    return
  end
  curl \
      --request PUT \
      -H "Content-Type: application/x-yaml" \
      -H "Accept: application/x-yaml" \
      --data-binary @gateway-service.yml \
      http://127.0.0.1:8500/v1/kv/config/gateway-service/data
  open http://localhost:8500/ui/dc1/kv/config/gateway-service/
end

put_consul $argv
