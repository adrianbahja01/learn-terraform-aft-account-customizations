echo "Account ID ..."
aws sts get-caller-identity --query Account --output text
