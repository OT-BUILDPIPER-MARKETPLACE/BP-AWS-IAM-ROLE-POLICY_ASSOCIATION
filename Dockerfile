FROM amazon/aws-cli

RUN yum update -y 
RUN yum install jq -y

ENV SLEEP_DURATION 5s
ENV ROLE_NAME=s3
ENV POLICIES=""
ENV ACTIVITY_SUB_TASK_CODE AWS-IAM-ROLE-POLICY_ASSOCIATION 

COPY build.sh .

ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENTRYPOINT [ "./build.sh" ]