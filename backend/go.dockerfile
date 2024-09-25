# use official Golang image
FROM golang:1.23.1-alpine3.20

# 设置多个 Go 模块代理
ENV GOPROXY=https://goproxy.cn,https://goproxy.io,direct

# 禁用 Go 模块校验，这可能会绕过一些网络问题
ENV GOSUMDB=off

# set working directory
WORKDIR /app

# Copy the source code
COPY . .

# Download and install the dependencies
RUN go get -d -v ./...

# Build the Go app
RUN go build -o api .

#EXPOSE the port
EXPOSE 8888

# Run the executable
CMD ["./api"]