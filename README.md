# Cloud & DevOps Engineer Assessment

This repository contains the necessary files to deploy a simple static web application to a cloud-based Kubernetes solution. The application is containerized using Docker, deployed via Kubernetes, and monitored with Prometheus. The infrastructure is provisioned using Terraform, ensuring a fully automated and repeatable deployment process.

## Application Functionality

The web application displays a simple static page with content. This page is served via a containerized environment in a Kubernetes cluster.

## Technologies Used:
- Kubernetes (for container orchestration)
- Docker (for containerization)
- Terraform (for Infrastructure as Code)
- Prometheus (for monitoring)
- Cloud Provider: [Your chosen cloud provider, e.g., AWS, GCP, Azure]

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [Docker](https://www.docker.com/get-started)
- Kubernetes cluster (can use [Minikube](https://minikube.sigs.k8s.io/docs/) for local setup or cloud Kubernetes service)
- [Prometheus](https://prometheus.io/docs/introduction/overview/) (or use managed services like [AWS CloudWatch](https://aws.amazon.com/cloudwatch/))
- Cloud provider credentials (AWS, GCP, etc.)

---

## Setting Up Infrastructure

1. Clone the repository:
    ```bash
    git clone https://github.com/payaldhapodkar/devops-app.git
    cd devops-app
    ```

2. Configure your cloud provider credentials (AWS, GCP, Azure, etc.).
   
3. Initialize Terraform:
    ```bash
    terraform init
    ```

4. Plan the deployment:
    ```bash
    terraform plan
    ```

5. Apply the Terraform configuration to provision the infrastructure:
    ```bash
    terraform apply
    ```

This will provision a Kubernetes cluster and the necessary infrastructure to run your web application.

---

## Containerizing the Web Application

1. Build the Docker image:
    ```bash
    docker build -t devops-web-app .
    ```

2. Verify the image:
    ```bash
    docker images
    ```

3. Run the container locally to test:
    ```bash
    docker run -d -p 8080:80 devops-web-app
    ```

4. Push the Docker image to a container registry (e.g., Docker Hub, AWS ECR, GCP GCR, etc.):
    ```bash
    docker tag devops-web-app <your-registry>/devops-web-app
    docker push <your-registry>/devops-web-app
    ```

---

## Kubernetes Deployment

1. Deploy the web application to the Kubernetes cluster:
    ```bash
    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service.yaml
    ```

2. Verify the deployment:
    ```bash
    kubectl get pods
    kubectl get services
    ```

3. Access the application:
    - If you're using Minikube:
      ```bash
      minikube service devops-web-app
      ```
    - Or, access via the LoadBalancer or NodePort, depending on your cloud setup.

---

## Monitoring with Prometheus

1. Deploy Prometheus to your Kubernetes cluster:
    ```bash
    kubectl apply -f prometheus/prometheus-deployment.yaml
    ```

2. Configure Prometheus to monitor the web application by adding appropriate scrape configurations (if not already set).

3. Access Prometheus:
    - Use port forwarding to access the Prometheus dashboard:
      ```bash
      kubectl port-forward svc/prometheus-server 9090:80
      ```
    - Visit `http://localhost:9090` to access the Prometheus dashboard.

4. Set up alerting rules (optional) based on your requirements for application metrics.

---

## Verifying the Deployment

- Access the application and ensure that the static content is being served properly.
- Check the status of the Kubernetes pods and services.
    ```bash
    kubectl get pods
    kubectl get services
    ```
- Verify that Prometheus is collecting metrics.
    - You can query Prometheus metrics via `http://localhost:9090` to check the status of your application.

---

## Cleanup

To destroy the infrastructure and clean up resources, run the following:

1. Run Terraform destroy:
    ```bash
    terraform destroy
    ```

2. Optionally, delete Docker images from the registry:
    ```bash
    docker rmi <your-registry>/devops-web-app
    ```

This will clean up the deployed application, Kubernetes resources, and cloud infrastructure.

---

## Conclusion

This solution provides a fully automated deployment of a simple web application on a cloud-based Kubernetes cluster with monitoring. The application is containerized using Docker and deployed with Kubernetes, while Prometheus is used for monitoring.

You can customize this solution by modifying the application code, adjusting infrastructure configurations, or adding more monitoring and alerting rules.

Please finf below result I got:


![image](https://github.com/user-attachments/assets/7e1f0b41-4344-4919-8e81-3d4b6f0c43fe)

![image](https://github.com/user-attachments/assets/9f037761-3316-490b-948f-748a8b180943)

