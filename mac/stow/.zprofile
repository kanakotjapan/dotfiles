# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# fnm
eval "$(fnm env --use-on-cd)"

# Rust
export PATH="$(brew --prefix rustup)/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Colima
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE="/var/run/docker.sock"
