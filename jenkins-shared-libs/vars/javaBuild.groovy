def call(String buildTool){
    echo "Building the application using ${buildTool}"
    if ( buildTool == "Maven" ) {
        echo "Maven build started"
    } else if ( buildTool == "Gradle" ) {
        echo "Gradle build started"
    } else {
        echo "No build tool specified"
    }

}