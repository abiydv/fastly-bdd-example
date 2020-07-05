# **Fastly BDD Tests Examples**

This repo contains - 

* [terraform](terraform) - Terraform config to create a sample Fastly service
* [vcl](vcl) - The VCL snippets that are deployed to the service
* [tests](tests) - Contains the feature files and tests implementation

## **REQUIRMENTS**

* Sign-up for a *limited* free Fastly account
* Terraform 12 or above

## **DEPLOY FASTLY SERVICE**

1. Export `FASTLY_API_KEY`
   ```
   export FASTLY_API_KEY=aabbccdd_01234
   ````

1. Switch to `terraform` directory, initialize `terraform` and check plan
   ```
   cd terraform
   terraform plan
   ````

1. Apply plan to create the Fastly service
   ```
   terraform apply

   $ Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
   ````

## **RUN TESTS**

1. Switch to `tests` directory and create a virtual py environment
   ```
   cd tests
   python3 -m venv env
   ````

1. Activate the py virtual environment and install dependencies 
   ```
   source env/bin/activate
   (env) pip3 install -r requirements.txt
   ````

1. Execute `behave` tests 
   ```
   behave
   .
   .
   1 feature passed, 0 failed, 0 skipped
   1 scenario passed, 0 failed, 0 skipped
   6 steps passed, 0 failed, 0 skipped, 0 undefined
   Took 0m0.051s
   ````

## **CLEANUP**

1. Export `FASTLY_API_KEY`
   ```
   export FASTLY_API_KEY=aabbccdd_01234
   ````

1. Switch to `terraform` directory
   ```
   cd terraform
   terraform plan
   ````

1. Delete the Fastly service
   ```
   terraform destroy

   $ Apply complete! Resources: 0 added, 0 changed, 3 destroyed.
   ````
