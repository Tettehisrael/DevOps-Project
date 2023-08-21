# How to send AWS CloudWatch Alarms to Slack



## Create Slack App 
You need to create a Slack channel to receive CloudWatch alarms and Slack App. Give it a name for the channel `alarms`.

![](https://i.imgur.com/9Vfiam6.png)

Next, to create a Slack app, go to https://api.slack.com/apps and click Create an App. Then click on Create an App from Scratch. Let's call it `CloudWatch Alarms` and put it in your workspace.

![](https://i.imgur.com/QTMmLxt.png)

![](https://i.imgur.com/PB0oBq6.png)

We're going to be using webhooks to receive events from CloudWatch. Go ahead and activate incoming webhooks and add them to the alarms Slack channel. Slack will generate a URL that we can use from Lambda to publish messages.

![](https://i.imgur.com/YyGkyBN.png)

## Set up Infrastructure
* cd terraform folder
* run `terraform init` to initialize the terraform folder 
* run `terraform apply -auto-approve` to set up the infrastructure 
* 
