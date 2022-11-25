# Cloud NANO Degree | Monolith to Microservice Project 3
Udagram is cloud application developed using ionic angular for frontend and node js for backend. 
It allows users to sign up and login , post images to the feed and process photos using image filtering microservice.
## Menu

<details open>
  <summary> Contents </summary>
  <ol>
    <li><a href="#Microservice"> Monolith to Microservice </a></li>
    <li><a href="#Endpoints"> Microservice URLs </a></li>
    <li> <a href="#Projects"> Microservice Projects </a> </li>
    <li><a href="#Screenshots"> Screenshots </a></li>
  </ol>
 </details 
 
## Microservice

Monolith was deivided into 3 seperate projects. Each project with its repo.
Also a repository is created for the reverse proxy to manage traffic to the api endpoints.
  
- [Udagram API User Repository](https://github.com/classic-k/Udagram-API-User).
- [Udagram API Feed Repository](https://github.com/classic-k/Udagram-API-Feed).
- [Udagram-Frontend Repository](https://github.com/classic-k/Udagram-Frontnend).
- [Udagram Reverse Proxy Repository](https://github.com/classic-k/Udagram-Proxy).

Each repository contain 3 branches namely dev, staging and main.
  
Staging and main branches are protected and cannot be pushed to directly.
  
If dev branch receive a push, action workflow on dev branch do test if defined, create a PR for staging, approve the PR and merge.
  
Staging branch action worflow is triggered by a push as a result of PR merge.
  
Staging branch  workflow create a PR for main branch, approve and merge.
  
Main branch workflow build project image and deploy to docker hub 
  
Github Action was used for CI (Travis Sites did not accept available cards)

  
## Endpoints
  
- [Udagram Frontent URL](http://ab79f09e2098b4b4998548d6fda2b66f-764639449.us-east-2.elb.amazonaws.com)
- [Udagram Proxy URL](http://a0d3f71b0bb324b5eaae4015bfbae63a-1456592312.us-east-2.elb.amazonaws.com )

    
N:B Only Frontend and Proxy Services are expose and can be access via internet


## Projects

<h3 align="center"><a href="https://github.com/classic-k/Udagram-Frontend"> Udagram Frontent Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project.
The test steps are:
  
- Verify dev, staging and main branches exist in the repo
- Verify working on feature branch or similar
- Verify cannot push to staging or main (protected branches) 
 
If the test passed, it create a PR for staging branch, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
  
Main branch workflow build images and deploy to docker hub repository.

<h3 align="center"><a href="https://github.com/classic-k/Udagram-Feed"> Udagram Feed-API Repo </a></h3>
  
- Dev Branch: Dev branch action workflow is triggered by push. The workflow create a PR for staging, approve the PR and merge.
- Staging Branch: Action worflow is triggered by push. The workflow create a PR for main, approve the PR and merge.
- Main branch workflow build images and deploy to docker hub repository.

<h3 align="center"><a href="https://github.com/classic-k/Udagram-User"> Udagram User-API Repo </a></h3>

- Dev Branch: Dev branch action workflow is triggered by push. The workflow create a PR for staging, approve the PR and merge.
- Staging Branch: Action worflow is triggered by push. The workflow create a PR for main, approve the PR and merge.
- Main branch workflow build images and deploy to docker hub repository.

<h3 align="center"><a href="https://github.com/classic-k/Udagram-proxy"> Udagram Reverse Proxy Repo </a></h3>
  
- Dev Branch: Dev branch action workflow is triggered by push. The workflow create a PR for staging, approve the PR and merge.
- Staging Branch: Action worflow is triggered by push. The workflow create a PR for main, approve the PR and merge.
- Main branch workflow build images and deploy to docker hub repository.
 
<h3 align="center"> Logging </h3>

- Udagram-Feed and Udagram-User APIs use a logger middleware to log requests to console
- Authenticated request are assigned ID by the middleware.

<h3 align="center"> Deployment </h3>

- Create Repository for each project in docker hub

- create VPC on aws for eks cluster
```bash
aws cloudformation create-stack --stack-name vpc_name --region us-east-2 --template-body file://yaml_files/vpctempv2.yaml --profile name
```
- create eks cluster using subnets from vpc above
```bash
aws eks create-cluster --region reg_name --name cluster_name --role-arn arn-for-cluster-role --resources-vpc-config subnetIds=subnetids,securityGroupIds=security_ids --profile name
```
- create node group for eks cluster
```bash
aws eks create-nodegroup --cluster-name name --nodegroup-name node_name --subnets subnet-087fd67accea15e3b,sourceSecurityGroups=sg-0a516b2d76d7e8364 --scaling-config minSize=3,maxSize=4,desiredSize=4 --ami-type type --node-role arn-for-node-role --disk-size 20 --capacity-type ON_DEMAND --instance-types m5.large --region us-east-1 --profile name
```
- Update kubeconfig
```bash
aws eks update-kubeconfig --name udagdeveks --region us-east-2 --profile dev
```
- Create, configmap, secrets, deployment, service
```bash
# k8apply.sh contain script to apply configmap, secrets, deployments, services and hpa
sudo ./k8apply.sh
```
## Screenshots

<div>
<h3> Screenshot of Github Action CI</h3>
  
<h4 align="center"> Frontend Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>

 <img src="screenshots/frontend_ci/fr_dev_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Create PR" />
<img src="screenshots/frontend_ci/fr_dev_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Approve PR" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
  <img src="screenshots/frontend_ci/fr_st_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Create PR" />
<img src="screenshots/frontend_ci/fr_st_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Approve PR" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="screenshots/frontend_ci/fr_main_build.jpg" width="900" height="400" alt="dev-push-CI" alt="Main_Branch Build And Deploy" />

  <h4> Frontend Action Tab (Summary) </h4>
<img src="screenshots/frontend_ci/ac.jpg" width="900" height="400" alt="dev-push-CI" alt="Action Tab Summary" />

 <h4 align="center"> Feed API Repo CI </h4>
 
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
<img src="screenshots/feed_ci/dev_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Create PR" />
<img src="screenshots/feed_ci/dev_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Approve PR" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
<img src="screenshots/feed_ci/st_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Create PR" />
<img src="screenshots/feed_ci/st_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Approve PR" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="screenshots/feed_ci/main_build.jpg" width="900" height="400" alt="dev-push-CI" alt="Main_Branch Build And Deploy" />

  <h4> Feed API Action Tab (Summary) </h4>
<img src="screenshots/feed_ci/ac.jpg" width="900" height="400" alt="dev-push-CI" alt="Action Tab Summary" />

<h4 align="center"> User API Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
 <img src="screenshots/user_ci/dev_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Create PR" />
<img src="screenshots/user_ci/dev_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Approve PR" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
<img src="screenshots/user_ci/st_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Create PR" />
<img src="screenshots/user_ci/st_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Approve PR" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
<img src="screenshots/user_ci/main_build.jpg" width="900" height="400" alt="dev-push-CI" alt="Main_Branch Build And Deploy" />

<h4> User API Action Tab (Summary) </h4>
<img src="screenshots/user_ci/ac.jpg" width="900" height="400" alt="dev-push-CI" alt="Action Tab Summary" />


<h4 align="center"> Reverseproxy Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
 <img src="screenshots/proxy_ci/dev_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Create PR" />
<img src="screenshots/proxy_ci/dev_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Dev_Branch Approve PR" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
 <img src="screenshots/proxy_ci/st_cre.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Create PR" />
<img src="screenshots/proxy_ci/st_app.jpg" width="900" height="400" alt="dev-push-CI" alt="Stage_Branch Approve PR" />


<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="screenshots/proxy_ci/main_build.jpg" width="900" height="400" alt="dev-push-CI" alt="Main_Branch Build And Deploy" />

  <h4> ReverseProxy Action Tab (Summary) </h4>
<img src="screenshots/proxy_ci/ac.jpg" width="900" height="400" alt="dev-push-CI" alt="Action Tab Summary" />
</div>

  <div>
<h3> Screenshot of Docker repos, Kubernente Deployments, Pods and Services</h3>

<h3 align="center">Docker Hub Repos Screnshots </h3>
<h4> Docker Images Repos </h4>
<img src="screenshots/docker/hub.jpg" width="900" height="400" alt="Docker Hub Repository" />

<h3 align="center"> Deployments Screnshots </h3>
<h4> kubectl get deployments </h4>
<img src="screenshots/dep/get.jpg" width="900" height="400" alt="List Deployments" />

<h4>Frontend Deployment: kubectl describe deployments udagram_forntend_dep </h4>
<img src="screenshots/dep/fr.jpg" width="900" height="400" alt="Describe Frontend Deployments" />

<h4>Reverse Proxy Deployment: kubectl describe deployments proxy-dep </h4>
<img src="screenshots/dep/pr.jpg" width="900" height="400" alt="Describe Proxy Deployments" />

<h4>User API Deployment: kubectl describe deployments udagram-user-dep </h4>
<img src="screenshots/dep/us.jpg" width="900" height="400" alt="Describe User Deployments" />

<h4>Feed API Deployment: kubectl describe deployments udagram-feed-dep </h4>
<img src="screenshots/dep/fe.jpg" width="900" height="400" alt="Describe Feed Deployments" />

<h3 align="center"> Pods Screnshots </h3>
<h4> Kubectl get pods </h4>
<img src="screenshots/pod/get.jpg" width="900" height="400" alt="List PODs" />


<h4> Frontend Pod Log: Kubectl logs pod-name </h4>
<img src="screenshots/logs/fr.jpg" width="900" height="400" alt="Frontend Pod Log" />

<h4> Feed API Pod Log: Kubectl logs pod-name </h4>
<img src="screenshots/logs/fe.jpg" width="900" height="400" alt="Feed Pod Log" />

<h4> User Pod Log: Kubectl logs pod-name </h4>
<img src="screenshots/logs/us.jpg" width="900" height="400" alt="User Pod Log" />

<h4> Reverse Proxy Pod Log: Kubectl logs pod-name </h4>
<img src="screenshots/logs/pr.jpg" width="900" height="400" alt="Reverse Proxy Pod Log" />

<h3 align="center"> HPA Screenshots</h3>
<h4> HPA: Kubectl get hpa </h4>
<img src="screenshots/hpa/get.jpg" width="900" height="400" alt="LIST HPA" />

<h4> HPA: Kubectl describe hpa </h4>
<img src="screenshots/hpa/desc.jpg" width="900" height="400" alt="Describe HPA" />

<h3 align="center"> Services Screnshots </h3>
<h4> Kubectl get services </h4>
<img src="screenshots/svc/get.jpg" width="900" height="400" alt="List Service" />

<h4>Frontend-Service: kubectl describe svc frontend-service </h4>
<img src="screenshots/svc/fr.jpg" width="900" height="400" alt="Describe Frontend Service" />

<h4>Feed-Service: kubectl describe svc feed-service </h4>
<img src="screenshots/svc/fe.jpg" width="900" height="400" alt="Describe Feed Service" />

<h4>User-Service: kubectl describe svc user-service </h4>
<img src="screenshots/svc/us.jpg" width="900" height="400" alt="Describe User Service" />

<h4>Proxy-Service: kubectl describe svc proxy-service </h4>
<img src="screenshots/svc/pr.jpg" width="900" height="400" alt="Describe Proxy Service" />
</div>
