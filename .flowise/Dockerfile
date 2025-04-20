# Use the official Flowise image
FROM flowiseai/flowise:latest

# Build argument for comma-separated list of modules (space-separated at runtime)
ARG MODULES="jsonpath mssql mustache"

# Install additional modules into Flowise’s plugin directory
RUN npm install $MODULES \
    --prefix /usr/local/lib/node_modules/flowise \
    --save \
    --loglevel error

# Preserve the default entrypoint to start Flowise
ENTRYPOINT ["flowise", "start"]
