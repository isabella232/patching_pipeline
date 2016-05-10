# patching_pipeline

This is a Chef Delivery Build Cookbook to manage the promotion of RPMs through a Devlivery Pipeline

Supported Platforms:
Centos 

# How it works 

The pipeline is driven by a JSON document that lists the OS Patches available for update. These are a curated list of patches from the Errata and Security channels of the distribution. When a change to this JSON document is made and submitted for review, the Pipeline will take the following steps:

* Verify
 ** Lint the JSON
 ** Syntax check the JSON
 ** Unit - Skipped
* Build
 ** Lint the JSON
 ** Syntax check the JSON
 ** Unit - Skipped
 ** Security - Skipped (GPG sig check)
 ** Quality - Skipped 
 ** Publish - Satelite: Activate the RPMs in Channel
* AURD
 ** Provision - Update the Repo on Repo Server
 ** Deploy - On the AURD node, yum update
 ** Smoke - Skipped
 ** Functional - Ispec? Test Version of RPM?
 










