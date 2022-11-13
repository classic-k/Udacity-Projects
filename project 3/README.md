# Udacity Cloud NANO Degree | Microservice Project 3 Bootsrap by Udacity

## Menu

<details open>
  <summary> Contents </summary>
  <ol>
    <li><a href="#Notes"> Notes </a></li>
    <li><a href="#Endpoints"> Microservice URLs </a></li>
    <li> <a href="#Projects"> Microservice Projects </a> </li>
    <li><a href="#Screenshots"> Screenshots </a></li>
  </ol>
 </details 
 
## Notes

<div>
<h3>Monotholith to Microservice</h3>
Monolith was deivided into 3 seperate projects. Each project with its repo.
Also a repository is created for the reverse proxy to manage traffic to the api endpoints.
  #### Project Repository
  [Udagram API User Repository](https://github.com/classic-k/Udagram-API-User)
  [Udagram API Feed Repository](https://github.com/classic-k/Udagram-API-Feed)
  [Udagram-Frontend Repository](https://github.com/classic-k/Udagram-Frontnend)
  [Udagram Reverse Proxy Repository](https://github.com/classic-k/Udagram-Proxy)

  Each repository contain 3 branches namely dev, staging and main.
Staging and main branches are protected and cannot be pushed to directly.
  
If dev branch receive a push, action workflow on dev branch create a PR for staging, approve the PR and merge.
Staging branch action workflow approve and merge the PR. Staging branch action worflow is triggered by a push.
The workflow create a PR for main branch, approve and merge. Main branch workflow build project image and deploy to docher hub 
<a href="https://github.com/classic-k/Udagram-API-User"> Udagram API User Repo </a><br>
<a href="https://github.com/classic-k/Udagram-API-Feed"> Udagram API Feed Repo </a><br>
With Reverse Proxy To Manage Traffics to the backened
<br><a href="https://github.com/classic-k/Udagram-proxy"> Udagram Reverse Proxy Repo </a><br>
Github Action was used for CI (Travis Sites did not accept available cards)
</div>
  
## Endpoints

  <div align="center">
<a href="https://github.com/classic-k/Udagram-Frontend"> Udagram Frontent URL </a><br>
<a href="https://github.com/classic-k/Udagram-API-User"> Udagram Proxy URL </a></li>
  </div>

## Projects

<h3 align="center"><a href="https://github.com/classic-k/Udagram-Frontend"> Udagram Frontent Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project.
The test steps are:
<ul>
  <li> Verify dev, staging and main branches exist in the repo </li>
  <li> Verify working on feature branch or similar</li>
  <li> Verify cannot push to staging or main (protected branches) </li>
  </ul>
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3 align="center"><a href="https://github.com/classic-k/Udagram-Feed"> Udagram Feed-API Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3 align="center"><a href="https://github.com/classic-k/Udagram-User"> Udagram User-API Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3 align="center"><a href="https://github.com/classic-k/Udagram-proxy"> Udagram Reverse Proxy Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3 align="center"> Logging </h3>
Udagram-Feed and Udagram-User APIs use a logger middle ware to log requests
Autheneticated are assigned request ID by the middleware.

## Screenshots

<div>
<h3> Screenshot of Github Action CI</h3>
  
<h4 align="center"> Frontend Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="dev-push-CI" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="staging-push-CI" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="main-push-CI" />

  <h4> Frontend Action Tab (Summary) </h4>
<img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="frontend-action-tab" />

 <h4 align="center"> Feed API Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="dev-push-CI" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="staging-push-CI" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="main-push-CI" />

  <h4> Feed API Action Tab (Summary) </h4>
<img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="feed-action-tab" />

<h4 align="center"> User API Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="dev-push-CI" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="staging-push-CI" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="main-push-CI" />

<h4> User API Action Tab (Summary) </h4>
<img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="user-action-tab" />

<h4 align="center"> Reverseproxy Repo CI </h4>
<h4> Dev Branch CI After Push- Create and Merge PR to staging </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="dev-push-CI" />

<h4> Staging Branch CI After Push- reate and Merge PR to main </h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="staging-push-CI" />

<h4> Main Branch CI After Push- Build and Deploy to Docker</h4>
 <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="main-push-CI" />

  <h4> ReverseProxy Action Tab (Summary) </h4>
<img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" alt="proxy-action-tab" />
</div>

  <div>
<h3> Screenshot of Docker repos, Kubernente Deployments, Pods and Services</h3>

<h3 align="center">Docker Hub Repos Screnshots </h3>
<h4> Docker Images Repos </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="docker-repos" />

<h3 align="center"> Deployments Screnshots </h3>
<h4> kubectl get deployments </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="deployments" />

<h4> Kubectl describe deployments </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="desc-deploys" />

<h4>Frontend Deployment: kubectl describe deployments dep-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="desc-frontend-deploys" />

<h4>Feed API Deployment: kubectl describe deployments dep-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="desc-feed-deploys" />

<h4>User API Deployment: kubectl describe deployments dep-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="desc-user-deploys" />

<h4>Reverse Proxy Deployment: kubectl describe deployments dep-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="desc-reverseproxy-deploys" />

<h3 align="center"> Pods Screnshots </h3>
<h4> Kubectl get pods </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="pods" />

<h4> Kubectl describe pods </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="desc-pods" />

<h4> Frontend Pod Log: Kubectl logs pod-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="frontend-pod-logs" />

<h4> Feed API Pod Log: Kubectl logs pod-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="feed-api-pod-logs" />

<h4> Frontend Pod Log: Kubectl logs pod-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="frontend-pod-logs" />

<h4> User API Pod Log: Kubectl logs pod-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="user-api-pod-logs" />

<h4> Reverse Proxy Pod Log: Kubectl logs pod-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="reverseproxy-pod-logs" />

<h3 align="center"> HPA Screenshots</h3>
<h4> HPA: Kubectl get hpa </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="hpa" />

<h4> HPA: Kubectl hpa pod-name(POD with HPA) </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="reverseproxy-pod-logs" />

<h3 align="center"> Services Screnshots </h3>
<h4> Kubectl get services </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="services" />

<h4>Frontend-Service: kubectl describe svc ser-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="frontend-services" />

<h4>Feed-Service: kubectl describe svc ser-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="feed-services" />

<h4>User-Service: kubectl describe svc ser-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="user-services" />

<h4>Proxy-Service: kubectl describe svc ser-name </h4>
<img src="deployment_screenshots/eben4.JPG" width="900" height="400" alt="proxy-services" />
</div>
