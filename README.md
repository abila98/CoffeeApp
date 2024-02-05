# Kohee

Kohee is a simple JavaServer Pages (JSP) application which talks about the different coffee drinks around the work. 
It is built using Ant and deployed on Apache Tomcat as a Docker container.

## Getting Started

To run Kohee application locally, follow these steps:

### Prerequisites

- Docker installed on your system

### Installation

1. Clone the repository:

    ```bash
    git clone [https://github.com/abila98/Kohee-App.git]
    ```

2. Navigate to the project directory:

    ```bash
    cd Kohee-App
    ```

3. Build the Docker image:

    ```bash
    docker build -t koheeapp .
    ```

### Usage

4. Run the Docker container:

    ```bash
    docker run -d -p 8080:8080 koheeapp
    ```

5. Access KoheeApp in your web browser at [http://localhost:8080](http://localhost:8080).

## Docker Workflow

The Docker image for KoheeApp is built using a multi-stage Docker build process. Here's how it works:

1. **Stage 1: Build Application with ANT**  
   In this stage, the application is built using the ANT build tool. The WAR (Web Application Archive) file generated during this stage is stored in the `war` folder.

2. **Stage 2: Deploy to Tomcat**  
   Tomcat is launched in this stage, and the WAR file created in Stage 1 is deployed to it. The application is then exposed on port 8080.

## Continuous Integration with GitHub Actions

KoheeApp utilizes GitHub Actions to automate the Docker build and push process. Here's how it works:

- The GitHub workflow is triggered on a push to the main branch.
- Docker credentials are stored securely in GitHub Secrets and accessed during the Docker build and push process.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the [MIT License](LICENSE).
