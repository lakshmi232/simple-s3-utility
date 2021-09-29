#!/bin/bash
### Please configure your system to authenticate with AWS or specify the details below ###
# export AWS_DEFAULT_REGION=<REGION_HERE>
# export AWS_ACCESS_KEY_ID=<ACCESS KEY HERE>
# export AWS_SECRET_ACCESS_KEY=<SECRET_KEY_HERE>
HORIZANTALLINE="============================================================================================="
echo "\n$HORIZANTALLINE"
echo "Simple S3 Utility - This is a shell utility which will perform the following"
echo "1) List the Buckets across the regions"
echo "2) Based on given input (Bucket name), details and metrics of the buckets will be displayed"
echo "\n$HORIZANTALLINE"
blist=$(aws s3api list-buckets --output text | grep BUCKETS | awk '{print $3}')
i=1
for BUCKET in $blist
do
echo "$i) $BUCKET"
i=$((i+1))
done
read -p "Enter the Bucket Name:" bucketname
echo "\n$HORIZANTALLINE"
for BUCKET in $blist
    do
        if [ "$bucketname" == "$BUCKET" ]
            then
                objcount=$(aws s3 ls s3://$BUCKET --human-readable --output text | wc -l )
                bktsize=$(aws s3 ls s3://$BUCKET --human-readable --summarize --output text | grep "Total Size" | awk '{ print $3 $4 }')
                dt=$(aws s3api list-buckets --output text | grep -E "(^|\s)"$BUCKET"($|\s)" | awk '{ print $2 }')
                lastmodifiedfile=$(aws s3 ls s3://$BUCKET --human-readable --output text | sort | tail -1 | awk '{ print $1 , $2 , $5 }')
                bucketlocation=$(aws s3api get-bucket-location --bucket $BUCKET --query LocationConstraint --output text) 
                bucketencryption=$(aws s3api get-bucket-encryption --bucket $BUCKET --output text | tail -1 | awk '{ print $2 }')
                bucketlogging=$(aws s3api get-bucket-logging --bucket $BUCKET --output text)
                echo "\n$HORIZANTALLINE"
                echo "Details of $BUCKET bucket"
                echo "\n$HORIZANTALLINE"
                echo "Bucket Name: $BUCKET"
                echo "Creation Time: $dt"
                echo "Object Count: $objcount"
                echo "Total Size: $bktsize"
                echo "Last Modified File: $lastmodifiedfile"
                echo "Bucket Location: $bucketlocation"
                echo "Bucket Encryption: $bucketencryption"
                #echo "Public Access Block: $publicaccessblock"
                echo "Bucket Logging: $bucketlogging"
                echo "\n$HORIZANTALLINE"
        fi
    done