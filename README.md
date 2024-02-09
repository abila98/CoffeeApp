# My Portfolio Application

My Portfolio Application is a JavaServer Pages (JSP) application showcasing my resume and various projects. It is built using Ant and deployed on Apache Tomcat as a Docker container.

## Credits

- The Bootstrap 4 resume theme used in this application is sourced from [technext/resume-bootstrap4](https://github.com/technext/resume-bootstrap4). 

## Getting Started

To run My Portfolio Application locally, follow these steps:

## Prerequisites

Before you begin, ensure you have the following installed:

- Docker
  - Installation instructions: [Docker Documentation](https://docs.docker.com/get-docker/)
- Git
  - Installation instructions: [Git Downloads](https://git-scm.com/downloads)
- Github
  - A GitHub Personal Access Token is required for accessing GitHub Secrets in the workflow. Create one with the appropriate permissions and add it to your GitHub repository's secrets.


### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/abila98/PortfolioApp.git
    ```

2. Navigate to the project directory:

    ```bash
    cd PortfolioApp
    ```

3. Build the Docker image:

    ```bash
    docker build -t portfolioapp .
    ```

### Usage

4. Run the Docker container:

    ```bash
    docker run -d -p 8080:8080 portfolioapp
    ```

5. Access the Portfolio Application in your web browser at http://localhost:8080/portfolio/index.html.

## Docker Workflow

The Docker image for My Portfolio Application is built using a multi-stage Docker build process. Here's how it works:

1. **Stage 1: Build Application with ANT**  
   In this stage, the application is built using the ANT build tool. The WAR (Web Application Archive) file generated during this stage is stored in the `war` folder.

2. **Stage 2: Deploy to Tomcat**  
   Tomcat is launched in this stage, and the WAR file created in Stage 1 is deployed to it. The application is then exposed on port 8080.

## Continuous Integration with GitHub Actions

The Portfolio Application utilizes GitHub Actions to automate the Docker build and push process. Here's how it works:

- The GitHub workflow is triggered on a push to the main branch.
- Docker credentials are stored securely in GitHub Secrets and accessed during the Docker build and push process.
- The docker image is stored in github packages.


## Customization
Users can make required changes to customize the website by modifying the HTML file located at PortfolioApp/application/WebContent/index.html. Additionally, CSS and JavaScript files can be modified to further customize the appearance and functionality of the website.

## Deployment to AWS Auto Scaling Group (ASG)

To deploy My Portfolio Application to an AWS Auto Scaling Group (ASG), follow the steps outlined in the [PortfolioSetup](https://github.com/abila98/PortfolioSetup) repository.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for any bugs or feature requests.

## License

This project is licensed under the [MIT License](LICENSE).
