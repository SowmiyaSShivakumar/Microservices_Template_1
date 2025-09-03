# Microservices_Template_1

## 1. Directory Structure

```
Microservices_Template_1/
├── api-gateway/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── src/
│   ├── README.md
├── service-registry/
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── src/
│   ├── README.md
├── user-service/
│   ├── Dockerfile
│   ├── src/main/java/com/example/userservice/
│   ├── src/main/resources/application.yml
│   ├── pom.xml
│   ├── README.md
├── order-service/
│   ├── Dockerfile
│   ├── src/main/java/com/example/orderservice/
│   ├── src/main/resources/application.yml
│   ├── pom.xml
│   ├── README.md
├── frontend/
│   ├── Dockerfile
│   ├── package.json
│   ├── src/
│   ├── README.md
└── README.md
```

## 2. Configuration Files

### `api-gateway/Dockerfile`
```Dockerfile
FROM apache/apisix:latest
COPY . /usr/local/apisix
```

### `service-registry/Dockerfile`
```Dockerfile
FROM bitnami/kubectl:latest
```

### `user-service/Dockerfile`
```Dockerfile
FROM openjdk:11-jre-slim
COPY target/user-service.jar user-service.jar
ENTRYPOINT ["java", "-jar", "user-service.jar"]
```

### `order-service/Dockerfile`
```Dockerfile
FROM openjdk:11-jre-slim
COPY target/order-service.jar order-service.jar
ENTRYPOINT ["java", "-jar", "order-service.jar"]
```

### `frontend/Dockerfile`
```Dockerfile
FROM node:14
WORKDIR /app
COPY . .
RUN npm install
CMD ["npm", "start"]
```

### `docker-compose.yml`
```yaml
version: '3.8'

services:
  api-gateway:
    build: ./api-gateway
    ports:
      - "9080:9080"

  service-registry:
    build: ./service-registry

  user-service:
    build: ./user-service
    ports:
      - "8081:8080"
    environment:
      - SPRING_DATASOURCE_URL=jdbc:mysql://db:3306/userdb
      - SPRING_DATASOURCE_USERNAME=root
      - SPRING_DATASOURCE_PASSWORD=password

  order-service:
    build: ./order-service
    ports:
      - "8082:8080"
    environment:
      - SPRING_DATASOURCE_URL=jdbc:mysql://db:3306/orderdb
      - SPRING_DATASOURCE_USERNAME=root
      - SPRING_DATASOURCE_PASSWORD=password

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: microservices_db
    ports:
      - "3306:3306"
```

## 3. Sample Service Implementations
In the `user-service` and `order-service` directories, include a simple Spring Boot application structure:

### Example for `user-service/src/main/java/com/example/userservice/UserServiceApplication.java`
```java
package com.example.userservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class UserServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(UserServiceApplication.class, args);
    }
}
```

### Example for `order-service/src/main/java/com/example/orderservice/OrderServiceApplication.java`
```java
package com.example.orderservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OrderServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(OrderServiceApplication.class, args);
    }
}
}
```

## 4. Documentation Files

### `README.md` for the root directory
```markdown
# Microservices Template 1

This is a microservices template that includes an API Gateway using Apache APISIX, a Service Registry, and two example services (User and Order service) implemented in Java with Spring Boot, and a React frontend.

## Getting Started

1. Clone this repository.
2. Navigate into the directory: `cd Microservices_Template_1`
3. Run the following command to start all services:
   ```bash
   docker-compose up --build
   ```
4. Access the services through the following URLs:
   - API Gateway: `http://localhost:9080`
   - User Service: `http://localhost:8081`
   - Order Service: `http://localhost:8082`

## Database
MySQL is used as the database for both services, with a root password set to `password`.
```

### Individual Service README
Each service (user-service and order-service) includes a `README.md` explaining how to build and run the service.

## Summary
1. **Directory Structure**: Organized directories for API Gateway, Service Registry, microservices, and frontend.
2. **Configuration Files**: Dockerfiles and docker-compose.yml for multi-container management.
3. **Sample Services**: Basic implementations for User and Order services using Spring Boot.
4. **Documentation**: README files to guide users on how to set up and run the microservices.