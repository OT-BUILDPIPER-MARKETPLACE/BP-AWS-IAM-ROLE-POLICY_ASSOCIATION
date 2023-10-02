# BP-AWS-IAM-ROLE-POLICY_ASSOCIATION
Step to associate polic(ies) to an IAM role

## Setup
* Clone the code available at [BP-AWS-IAM-ROLE-POLICY_ASSOCIATION](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-AWS-IAM-ROLE-POLICY_ASSOCIATION)
* Build the docker image
```
git submodule init
git submodule update
docker build -t ot/aws-iam-role-policy-association:0.1 .
```

* Do local testing via image only

```
# Associate default policy with default role
docker run -it --rm -e AWS_ACCESS_KEY_ID=<xxx> -e AWS_SECRET_ACCESS_KEY=<xxx> -e POLICIES=s3 ot/aws-iam-role-policy-association:0.1

# Associate custome policy with custome role
docker run -it --rm -e POLICIES="ot-ec2-policy,ot-ecs-policy" -e ROLE_NAME=buildpiper  -e AWS_ACCESS_KEY_ID=<xxx> -e AWS_SECRET_ACCESS_KEY=<xxx> -e POLICIES=s3 ot/aws-iam-role-policy-association:0.1
```
