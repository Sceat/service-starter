# ╔════════════════ [ Build stage ] ════════════════════════════════════════════ ]
FROM node:21-slim as build

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --prod

# ╔════════════════ [ Clean container ] ═════════════════════════════════════════ ]
FROM node:21-slim as production

WORKDIR /app
COPY --from=build /app .
COPY . .
CMD npm start