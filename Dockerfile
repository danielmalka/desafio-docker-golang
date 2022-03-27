FROM golang:alpine AS builder

WORKDIR /app

COPY main.go ./

RUN go mod init github.com/danielmalka/desafio-docker-golang

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /fullcyclerocks

FROM scratch

WORKDIR /

COPY --from=builder /fullcyclerocks /fullcyclerocks

CMD [ "/fullcyclerocks" ]