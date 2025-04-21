# Stage 1: build the React app
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app
# Increase Node’s memory limit to avoid OOM during build
ENV NODE_OPTIONS="--max_old_space_size=2048"

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy application source
COPY public ./public
COPY src ./src

# Build production assets
RUN npm run build

# Stage 2: serve static with serve
FROM node:20-alpine AS runtime
WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package.json ./package.json

# Expose the port the serve command will use
EXPOSE 3000

ENV HOST=0.0.0.0

# Run the static server
CMD ["npm", "run", "start"]