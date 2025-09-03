# Microservices Template 1

This repository contains a microservices architecture built with Python (Flask), React, and several other technologies as detailed below.

## Services Overview

- **API Gateway (NGINX)**: Routes requests to the appropriate microservices.
- **Service Registry (Eureka)**: Tracks available services in the system.
- **Config Server**: Manages configurations using Kubernetes ConfigMaps.
- **Auth Service**: Provides authentication using OAuth2.
- **User and Product Services**: Handle user and product functionalities.
- **Message Queue**: Utilizes RabbitMQ for communication between services.
- **Caching**: Implements Memcached for performance improvement.
  
## Running the Application

1. Make sure Docker and Docker Compose are installed on your machine.
   
2. Clone the repository:
   ```bash
   git clone <repository-url>
   cd Microservices_Template_1
   ```
   
3. Build and run the services:
   ```bash
   docker-compose up --build
   ```
   
4. Access the services through the API Gateway at `http://localhost`.

## Contributing

For any contributions, please create a new branch and submit a pull request.
