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
