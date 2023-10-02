#!/bin/bash

source /opt/buildpiper/shell-functions/log-functions.sh
source /opt/buildpiper/shell-functions/aws-functions.sh
source /opt/buildpiper/shell-functions/functions.sh

logInfoMessage "I'll be creating associating policies [${POLICIES}] to IAM role [$ROLE_NAME]"

sleep  $SLEEP_DURATION

TASK_STATUS=0

AWS_ACCOUNT_ID=`getAccountId`
POLICY_ARN="arn:aws:iam::${AWS_ACCOUNT_ID}:policy/${POLICY_NAME}"

POLICY_EXISTS=`policyExists ${POLICY_ARN}`

if [ "$POLICY_EXISTS" -eq 0 ]
then
    logWarningMessage "Policy with ARN ${POLICY_ARN} doesn't exist please check"
else
    logInfoMessage "Associating Policy with ARN ${POLICY_ARN} to role [$ROLE_NAME]"
    aws iam attach-role-policy --policy-arn POLICY_ARN --role-name ${ROLE_NAME}
fi

saveTaskStatus ${TASK_STATUS} ${ACTIVITY_SUB_TASK_CODE}