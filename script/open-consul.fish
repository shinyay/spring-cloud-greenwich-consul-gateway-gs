#!/usr/bin/env fish

function open_consul
  argparse -n open_consul 'h/help' -- $argv
  or return 1

  if set -lq _flag_help
    echo "open-consul.fish: Open Consul Dashboard"
    return
  end
  open http://localhost:8500
end

open_consul $argv
