echo "Executing Post-API Helpers"
echo "Account ID ..."
aws sts get-caller-identity --query Account --output text

export REGIONS=$(aws ec2 describe-regions | jq -r ".Regions[].RegionName")
for region in $REGIONS; do
# list vpcs
echo $region
aws --region=$region ec2 describe-vpcs | jq ".Vpcs[]|{is_default: .IsDefault, cidr: .CidrBlock, id: .VpcId} | select(.is_default)"
done