# Udacity Cloud NANO Degree | Microservice Project 3 Bootsrap by Udacity

## Menu
<details>
  <summary> Contents  </summary>
  <ol>
    <li><a href="#Notes"> Notes </a></li>
  </ol>
   <ol>
    <li><a href="#Endpoints"> Microservice URLs </a></li>
  </ol>
  <ol>
    <li href="#Projects"> Microservice Projects </li>
  </ol>
  <ol>
    <li><a href="#Screenshots"> Screenshots </a></li>
  </ol>
  
  </details>
  
### Notes

<div>
<h3>Monotholith to Microservice</h3>
Monolith was deivided into 3 seperate projects. Each project with its repo. 
Repository for each projects contain 3 branches namely dev, staging and main.
Staging and main branches are protected and cannot be pushed to directly.
If dev breanch receive a push, action workflow on dev branch create a PR for staging.
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
<h3><a href="https://github.com/classic-k/Udagram-Frontend"> Udagram Frontent Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3><a href="https://github.com/classic-k/Udagram-Feed"> Udagram Feed-API Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3><a href="https://github.com/classic-k/Udagram-User"> Udagram User-API Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.

<h3><a href="https://github.com/classic-k/Udagram-proxy"> Udagram Reverse Proxy Repo </a></h3>
Dev Branch: Dev branch action workflow is triggered by push. The workflow perform the test in the udagram_test folder of the project
If the test passed, it merge the change and create a PR for staging, approve the PR and merge.

Staging Branch: Action worflow is triggered by push. Workflow create a PR on main, approve the PR and merge.
Main branch workflow build images and deploy to docker hub using the commit sha as tag for the images.
## Screenshots

  <div>
  <h3> Screenshot of Docker Hub Showing Images</h3>
  <img src="deployment_screenshots/ebenv2.JPG" width="900" height="400" />
  </div>
  <div>
  <h3> Screenshot of Github Actions After Push to Main </h3>
  <h4> Udagram-Frontend Github Action Deployment to Docker</h4>
  <img src="deployment_screenshots/ebenv3.JPG" width="900" height="400" />
  <h4> Udagram-API-User Github Action Deployment to Docker</h4>
  <img src="deployment_screenshots/ebenv3.JPG" width="900" height="400" />
  <h4> Udagram-API-Feed Github Action Deployment to Docker</h4>
  <img src="deployment_screenshots/ebenv3.JPG" width="900" height="400" />
  <h4> Udagram-Proxy Github Action Deployment to Docker</h4>
  <img src="deployment_screenshots/ebenv3.JPG" width="900" height="400" />
  </div>
  <div>
  <h3> Screenshot of Kubernente Showing Deployments</h3>
  <h4> Kubectl Showing Pods Screenshot </h4>
  <img src="deployment_screenshots/eben4.JPG" width="900" height="400" />
  <h4> Kubectl Describe Services Screenshot </h4>
  <img src="deployment_screenshots/eben4.JPG" width="900" height="400" />
  <h4> Kubectl Reverse Proxy Screenshot </h4>
  <img src="deployment_screenshots/eben4.JPG" width="900" height="400" />
  <h4> Kubectl Showing HPA Screenshot </h4>
  <img src="deployment_screenshots/eben4.JPG" width="900" height="400" />
  <h4> Kubectl Showing Logs For API-User Screenshot </h4>
  <img src="deployment_screenshots/eben4.JPG" width="900" height="400" />
  <h4> Kubectl Showing Logs For API-Feed Screenshot </h4>
  <img src="deployment_screenshots/eben4.JPG" width="900" height="400" />
  </div>
  
  <div>
