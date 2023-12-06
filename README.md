<p>
  🚀 Deploying a React App on AWS EC2 using Jenkins Pipeline with Docker 🛠️
</p>
<p>
  This project showcases an automated pipeline using Jenkins to deploy a React application on AWS EC2 using Docker. The pipeline streamlines the build, Docker image creation, and deployment processes, simplifying the management and deployment of your React app on the cloud.
</p>

<h2>🛠️ Jenkins React App Pipeline Overview 🚀</h2>
<ul>
  <li>Agent: Any</li>
  <li>Stages: Checkout ➡️ Build ➡️ Build Docker Image ➡️ Start Application ➡️ Cleanup</li>
</ul>

<h2>🌟 Pipeline Stages and Functionality 🌟</h2>
<h3>Checkout:</h3>
<ul>
  <li>Fetches code from the master branch of your GitHub repository.</li>
</ul>

<h3>Build:</h3>
<ul>
  <li>Runs Docker containers for React build tasks.</li>
  <li>Executes Node commands for npm versions, directory listings, dependency installation, and build execution.</li>
  <li>Stops Docker container after the build is completed.</li>
</ul>

<h3>Build Docker Image:</h3>
<ul>
  <li>Creates a Docker image named jenkins-react-app:v1.0.0 using the provided Dockerfile.</li>
</ul>

<h3>Start Application:</h3>
<ul>
  <li>Initiates the Docker container named 'test' running the built image, exposed on port 80.</li>
</ul>

<h3>Cleanup:</h3>
<ul>
  <li>Deletes the Jenkins workspace directory to maintain cleanliness.</li>
</ul>

<p>
  This Jenkins pipeline automates the deployment of your React application using Docker on AWS EC2. It effectively manages the build, image creation, and deployment processes, making deployment hassle-free while utilizing Jenkins, Docker, and AWS EC2 efficiently.
</p>
