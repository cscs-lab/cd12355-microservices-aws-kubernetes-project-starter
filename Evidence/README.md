The deployment flow in this infra is explained below:

- Database is installed in the cluster via the yaml files pvc.yaml, pv.yaml, postgresql-deployment.yaml and the DB is named as postgresql

- The analytics folder contains the application code . We Dockerize this code to build the application and push the docker image to AWS ECR through AWS code build pipeline. In our case we used GitHub webhook event triggers (on condition : pull requests merged) to kick start the pipeline. Finally the new code is deployed to our k8s (i.e: AWS EKS) environment by pulling the image from ECR repository.

Auto build is triggered whenever there is a commit to main branch / files in the analytics folder and the new app code is deployed to our k8s environment.
The buildspec.yaml file details the different phases in the build lifecycle.

Logging is traced via CloudWatch. CloudWatch Container Insights logs shows the detailed application logs which can be further customized on need basis and it periodically prints the application health status.




