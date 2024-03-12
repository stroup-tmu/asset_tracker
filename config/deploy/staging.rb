# Staging config for deploying to a single server via server-based syntax

# Since the environment differs from the stage name
set :rails_env, 'production'

# Using server-based syntax (single server)
server "165.232.143.251", user: "root", roles: %w{web worker db}
