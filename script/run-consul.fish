#!/usr/bin/env fish

function run_consul
  argparse -n run_consul 'h/help' -- $argv
  or return 1

  if set -lq _flag_help
    echo "run-consul.fish"
    return
  end
  # https://hub.docker.com/_/consul
  docker run --rm -it -d --name my-consul -p 8500:8500 consul:1.5.3
end

run_consul $argv
