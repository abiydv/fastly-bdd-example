# **Fastly BDD Tests Examples**

Fastly offers a huge opportunity of customizing user journeys using the VCL conditionals/flows. These rules are executed on edge, closer to end-users, and save the origin from handling these trivial cases. As the no of. rules increase though, there is a possibility of things breaking. Implementing BDD tests ensures there are no surprises when implementing new rules.

The different sections in the repo are as follows - 
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
## **NOTE** ##
To make full use of these tests, they can be run in a CI-CD pipeline after each Fastly deployment to do a quick check. Any issues identified can then be quickly addressed, before the production deployment.

## **NOTE** ##
This is a test/proof-of-concept. There are some configs to make it quick, which should be removed before actual implementation.

1. `verify=False` flag in `requests.get()` call. File [steps.py](tests/features/steps/steps.py).  
This is necessary because the Fastly shared certs will not have the test domain created (fastly-bdd-example.com) as part of this example. Without this flag the call will fail.

1. Adding the Fastly shared domain fastly-bdd-example.com.global.prod.fastly.net in [feature files](tests/featues).