Simple S3 Utility - This is a simple shell utility which takes Bucket Name as input and gives Bucket Details/Metrics as output. 

As a prerequisite, you will need to configure your system to authenticate with the AWS Account or specify the below details in the script directly. 

export AWS_DEFAULT_REGION=<REGION_HERE>
export AWS_ACCESS_KEY_ID=<ACCESS KEY HERE>
export AWS_SECRET_ACCESS_KEY=<SECRET_KEY_HERE>

How to execute: Just open a terminal, and execute the below command.

#sh list.sh

Example:

xmchemac056:s3-list sriramparthasarathy$ sh list.sh 

=============================================================================================
S3 Utility - This is a shell based utility which will perform the following
1) List the Buckets across the regions
2) Based on given input (Bucket name), details and metrics of the buckets will be displayed

=============================================================================================
1) cf-templates-q2scgczbmupi-ca-central-1
2) cf-templates-q2scgczbmupi-us-east-1
3) cf-templates-q2scgczbmupi-us-west-2
=============================================================================================
Enter the Bucket Name:cf-templates-q2scgczbmupi-ca-central-1

=============================================================================================
Details of cf-templates-q2scgczbmupi-ca-central-1 bucket

=============================================================================================
Bucket Name: cf-templates-q2scgczbmupi-ca-central-1
Creation Time: 2021-02-24T06:33:40+00:00
Object Count:       22
Total Size: 172.7KiB
Last Modified File: 2021-02-24 15:51:15 2021055czE-asses-cf.yml
Bucket Location: ca-central-1
Bucket Encryption: AES256
Bucket Logging: 

=============================================================================================


