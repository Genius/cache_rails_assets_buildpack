function save_assets() {
  local save_dir="$1"
  local cache_dir="$2"

  if [ -d "$save_dir" ]; then
    echo "- preparing to cache $save_dir to $cache_dir but clearing destination first"
    rm -fr "$cache_dir"

    echo "- caching $save_dir"
    du -sh "$save_dir"
    mkdir -p "$cache_dir"
    cp -r "$save_dir/." "$cache_dir"
  fi
}

function restore_assets() {
  local save_dir="$1"
  local cache_dir="$2"

  if [ -d "$cache_dir" ]; then
    echo "- restoring $cache_dir"
    du -sh "$cache_dir"
    mkdir -p "$(dirname $save_dir)"
    cp -r "$cache_dir/." "$save_dir"
  fi
}
