FROM nginx:alpine

# Copy app
COPY app/ /usr/share/nginx/html/

# Fix permissions (nginx image handles user switching)
RUN chown -R nginx:nginx /var/cache/nginx /var/log/nginx /usr/share/nginx/html && \
    mkdir -p /run/nginx && \
    chown nginx:nginx /run/nginx

# NO USER directive - let nginx image handle privilege dropping
EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:80/ || exit 1

