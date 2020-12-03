# StoryBooks

https://storybooks.devopsdirective.com

> Create public and private stories from your life

This app uses Node.js/Express/MongoDB with Google OAuth for authentication

It uses Docker + docker-compose for local execution, Terraform to provision cloud resources, and Github actions for CI/CD.

For full tutorial, see the video I created for the [Traversy Media YouTube channel](https://www.youtube.com/c/TraversyMedia/videos).

## Local Setup

Add your mongoDB URI and Google OAuth credentials to the config.env file.

Then run:
```
make run-local
```

This will use docker-compose to build the application into a docker image and then run it alongside a Mongo DB container.

## Terraform

The terraform configuration provisions:
- GCP Compute Engine Virtual Machine
- Atlas MongoDB Cluster
- Cloudflare DNS "A" Record

Using the terraform config requires:
1) Creating a GCP project (+ service account key for TF to use)
2) Creating an Atlas project (+ API key for TF to use)
3) Creating a Cloudflare account (+ API token for TF to use)

## Github Action

`.github/workflows/build-push-deploy.yaml` contains a workflow which deploys to a staging environment on pushes to the `master` branch and to a production environment on pushes of tags of the form `v#.#.#`.