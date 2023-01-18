# shinyproxy
Welcome to the ShinyProxy repository!

This repository contains the necessary files to deploy a ShinyProxy instance, which is a load balancer for Shiny apps. The entrypoint.sh file is used to set environment variables for the Postgres database and run the ShinyProxy jar file. The docker-compose.yml file describes the services that will be run, including the Postgres database, pgadmin, and ShinyProxy. The build-image.sh file can be used to build the ShinyProxy image. Finally, the application.yml file contains the configuration settings for the ShinyProxy instance.

Please note that the Postgres username and password are hardcoded in the entrypoint.sh and docker-compose.yml files for demonstration purposes. In a production environment, it is recommended to use environment variables or a configuration file to store these values. Additionally, the 'latest' tag should not be used in production.

The build-image.sh file is provided as an example of how to build the ShinyProxy image, however it is not necessary to use it.

You can use the application.yml file to customize the settings of your ShinyProxy instance, such as the title, logo, port, and authentication settings.

This deployment is set up to use the openanalytics/shinyproxy-rstudio-ide-demo image, however you can replace this with your own image.

Enjoy using ShinyProxy!
