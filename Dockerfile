# Production image: build the static site with Node, serve it with nginx.
# Build: docker build -t imm9o-blog .
# Run:   docker run --rm -p 8080:80 imm9o-blog   ->  http://localhost:8080

FROM node:20-bookworm-slim AS build
WORKDIR /app
COPY package.json package-lock.json ./
# Skip husky's git hooks: the image has no .git folder.
ENV HUSKY=0
RUN npm ci --no-audit --no-fund
COPY . .
RUN npm run build

FROM nginx:1.27-alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
HEALTHCHECK CMD wget -q -O /dev/null http://localhost/ || exit 1
