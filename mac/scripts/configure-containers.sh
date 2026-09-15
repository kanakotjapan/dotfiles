#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/_common.sh"

log "Configuring Docker CLI plugins..."

docker_config_dir="${DOCKER_CONFIG:-$HOME/.docker}"
docker_config_file="$docker_config_dir/config.json"
plugin_dir="$(brew --prefix)/lib/docker/cli-plugins"

mkdir -p "$docker_config_dir"

temp_file="$(mktemp "$docker_config_dir/config.json.XXXXXX")"
trap 'rm -f "$temp_file"' EXIT

jq_filter='
  if .cliPluginsExtraDirs == null then
    .cliPluginsExtraDirs = [$plugin_dir]
  elif (.cliPluginsExtraDirs | type) != "array" then
    error("cliPluginsExtraDirs must be an array")
  elif (.cliPluginsExtraDirs | index($plugin_dir)) == null then
    .cliPluginsExtraDirs += [$plugin_dir]
  else
    .
  end
'

if [[ -f "$docker_config_file" ]]; then
  jq --arg plugin_dir "$plugin_dir" "$jq_filter" "$docker_config_file" > "$temp_file"
else
  jq -n --arg plugin_dir "$plugin_dir" "$jq_filter" > "$temp_file"
fi

chmod 600 "$temp_file"
mv "$temp_file" "$docker_config_file"
trap - EXIT
