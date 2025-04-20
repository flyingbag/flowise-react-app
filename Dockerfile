# Stage 1: build the React app
FROM node:20-alpine AS build

# Set working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy application source
COPY public ./public
COPY src ./src

# Inject Chatflow ID build-time arg
ARG REACT_APP_CHATFLOW_ID
ENV REACT_APP_CHATFLOW_ID=$REACT_APP_CHATFLOW_ID
ARG REACT_APP_API_HOST
ENV REACT_APP_API_HOST=$REACT_APP_API_HOST

# Build production assets
RUN npm run build

# Stage 2: serve static with serve
FROM node:20-alpine AS runtime
WORKDIR /app

# Install a lightweight static server
RUN npm install -g serve

# Copy production assets
COPY --from=build /app/build ./build

# Expose the port the serve command will use
EXPOSE 3000

# Run the static server
CMD ["serve", "-s", "build", "-l", "3000"]