pipeline {
    agent any

    environment {
        // Define the path to the Terraform configuration directory
        TF_CONFIG_PATH = "S3_module_Demo_Source_Local/config/non-prod/s3/"
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the GitHub repository containing Terraform scripts
                git 'https://github.com/venugopalsgnew/terraform-training-Nov.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Navigate to the Terraform configuration directory and initialize Terraform
                dir("${TF_CONFIG_PATH}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                // Navigate to the Terraform configuration directory and generate a Terraform plan
                dir("${TF_CONFIG_PATH}") {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                // Navigate to the Terraform configuration directory and apply the Terraform changes
                dir("${TF_CONFIG_PATH}") {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
