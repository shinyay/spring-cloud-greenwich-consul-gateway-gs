# Spring Clound Greenwich with Consul - Gateway Service

Spring Cloud Greenwich After Spring Cloud Netflix

## Description

## Demo

## Features

- Consul: Distrubuted Configuration
- Consul: Service Register to Discovery
- Consul: Service Discovery
- SC Loadbalancer: Gateway in front of Backend Service

## Requirement

## Usage

### Run Consul Container at Local

```
$ docker run --rm -it -d --name my-consul -p 8500:8500 consul:1.5.3
```
or
```
$ script/run-consul.fish
```

### Open Consul Dashboard

```
$ open http://localhost:8500
```

### Create Config in Consul

**config/application-name/key-name**

- `Key/Value -> Create`
- `config/gateway-service/data`
  - gateway-service: Application Name
  - data: Config Key

```yaml
spring:
  cloud:
    gateway:
      discovery:
        locator:
          enabled: true
      routes:
        - id: frontend-service
          uri: lb://frontend-service
          predicates:
            - Path=/frontend/**
          filters:
            - RewritePath=/frontend/(?<path>.*), /$\{path}
        - id: backend-service
          uri: lb://backend-service
          predicates:
            - Path=/backend/**
          filters:
            - RewritePath=/backend/(?<path>.*), /$\{path}
```

## Installation

## Licence

Released under the [MIT license](https://gist.githubusercontent.com/shinyay/56e54ee4c0e22db8211e05e70a63247e/raw/34c6fdd50d54aa8e23560c296424aeb61599aa71/LICENSE)

## Author

[shinyay](https://github.com/shinyay)
