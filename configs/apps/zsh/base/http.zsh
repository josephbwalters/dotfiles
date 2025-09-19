
# HTTPie helpers
hjson() { http "$@" | jq .; }
