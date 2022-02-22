# REFERENCE: Shiny App + Docker + Github Actions + Azure

The purpose of this repo is to demonstrate (for future me) how to deploy an R shiny application using Docker, Github Actions, and Azure.

***

Example Variables:

- Name of rproject: `myrproj`
- Name of shiny app: `myshinyapp`

### Shiny App

- Create the app directory _within_ the project directory like this:
- `myrproj/myshinyapp/ui.R`

### Docker

- Create a `Dockerfile` in the root directory of the project (`myrproj/Dockerfile` in this example). 
- I use [this one](https://gitlab.com/analythium/shinyproxy-hello/-/blob/master/Dockerfile) created by Peter Solymos.
- Note that if you build the image locally you may have to forward some ports in order to actually connect, so if you wanted to map port 3838:
  - `docker run --rm -p 3838:3838 whatever_img_name_you_want`
  - and then open a browser and connect with `http://localhost:3838`

### Github Actions

- Follow along with the "Deploy a container to an Azure Web App" action. Github has a good outline of the steps to set it up but I'll summarize here:
  1. Copy the Public Profile from your `App Service` and paste into the `AZURE_WEBAPP_PUBLISH_PROFILE` repo secret
  2. Create a github personal access token
  3. Set the following app settings in the `App Service`:
    - DOCKER_REGISTRY_SERVER_URL
    - DOCKER_REGISTRY_SERVER_USERNAME
    - DOCKER_REGISTRY_SERVER_PASSWORD
  4. Add `App Service` name to `.github/workflows/azure-container-webapp.yml`

### Azure

- Create an `App Service`
- In "Deployment Center", connect the github repo that will build the docker image

### General Notes

- The actual github action that build the docker image takes a few minutes to run usually
- Changes aren't seen at the `App Service` url for around 10ish minutes
- [This R-bloggers post](https://www.r-bloggers.com/2021/05/dockerizing-shiny-applications/) was helpful while working through all this.
