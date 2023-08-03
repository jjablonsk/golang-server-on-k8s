FROM golang:latest as build

ENV HTTPS_PROXY=http://proxy-chain.intel.com:912

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download
COPY go-k8s .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM alpine:latest  
ENV HTTPS_PROXY=http://proxy-chain.intel.com:912
RUN apk --no-cache add ca-certificates
ENV HTTPS_PROXY=


WORKDIR /root/
COPY --from=build /app/main .
EXPOSE 8080

CMD ["./main"] 