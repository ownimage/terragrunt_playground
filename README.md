# Introduction
This repo is designed to be a playground for testing out terragrunt.

# Directory structure
In this directory there is a main.tf file which is the starting point, it defines a docker nginx service.  
It is docker, rather then aws, so that terraform and terragrunt can be run locally and without external credentials.

In the terragrunt directory there are 3 directories:
- modules, which is a definition of the service that will be run (it is a parameterised version of the main.tf in the top level directory)
- dev, which has a terragrunt.hcl which points to the modules directory and has the input parameters for dev
- prod, which has a terragrunt.hcl which points to the modules directory and has the input parameters for prod

# Running the example
    cd terragrunt/dev
    terragrunt plan \
    terragrunt apply \
    
    cd ../prod \
    terragrunt plan \
    terragrunt apply 


After running the above
    docker ps

Should show something like

    CONTAINER ID   IMAGE   COMMAND         CREATED          STATUS          PORTS                  NAMES \
    eef7a9ffb8c3   88736   "/docker-..."   8 seconds ago    Up 7 seconds    0.0.0.0:8082->80/tcp   prod_nginx \
    e6818b1f7911   88736   "/docker-..."   10 minutes ago   Up 10 minutes   0.0.0.0:8081->80/tcp   dev_nginx

The changes in the ports and names from the dev or prod terragrunt.hcl files can be seen.