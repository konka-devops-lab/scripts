def call(String environment, String appName, String imageTag){
    echo "Java Application Deployment Started on ${environment} for ${appName} with image tag ${imageTag}"
    if (environment == 'dev'){
        echo "Deployment to Development environment"
    } else if (environment == 'qa'){
        echo "Deployment to QA environment"
    } else if (environment == 'prod'){
        echo "Deployment to Production environment"
    } else {
        echo "Invalid environment. Please specify 'dev', 'qa', or 'prod'."
    }

}