#!/usr/bin/env fish

function open_gateway
  argparse -n open_gateway 'h/help' -- $argv
  or return 1

  if set -lq _flag_help
    echo "open-gateway.fish: Open Consul Dashboard"
    return
  end
  open http://localhost:8080/frontend
end

open_gateway $argv
