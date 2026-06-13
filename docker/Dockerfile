# Minimal static preview — clone app repo for full build
FROM node:20-alpine AS build
WORKDIR /app
RUN echo '<html><body><h1>Vaha Ruchulu DevOps</h1><p>See e-commerce-website repo for full app.</p></body></html>' > /app/index.html

FROM nginx:alpine
COPY --from=build /app/index.html /usr/share/nginx/html/index.html
EXPOSE 80
