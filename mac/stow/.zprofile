# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Rust
export PATH="$(brew --prefix rustup)/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
