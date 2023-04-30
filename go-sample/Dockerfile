FROM golang:1.20.3-alpine3.17 as build

WORKDIR /app

COPY go.* ./
RUN go mod download

COPY . ./
RUN go build -o ./bin/exec


FROM alpine:3.17
ARG TZ=Asia/Jakarta
ENV TZ=${TZ}

RUN apk add dumb-init tzdata

COPY --from=build /app/bin/exec /app/bin/exec

CMD ["/app/bin/exec"]


