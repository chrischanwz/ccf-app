#!/bin/bash

# Install dependencies (git, node, yarn, jq)
yum update -y
yum install -y git
curl --silent --location https://rpm.nodesource.com/setup_14.x | bash -
yum install -y nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo
rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
yum install -y yarn
yum install -y jq

# Clone CCF repository and install dependencies
su - ec2-user
cd /home/ec2-user
git clone https://github.com/cloud-carbon-footprint/cloud-carbon-footprint.git
cd cloud-carbon-footprint/
yarn install

# Set env variables for Node API
cd packages/api
cp .env.template .env

sed -i '23,48d' .env
sed -i '17,18d' .env
sed -i 's/your-target-account-role-name (e.g. ccf-app)/<ccf-app>/g' .env
sed -i 's/your-athena-db-name/<athenacurcfn_test_report1>/g' .env
sed -i 's/your-athena-db-table/<testreport1>/g' .env
sed -i 's/your-athena-region/<ap-southeast-1>/g' .env
sed -i 's/your-athena-query-results-location/<athenachrisresultsversion1>/g' .env
sed -i 's/your-billing-account-id/<590183919153>/g' .env
sed -i 's/your-billing-account-name/<chrischan>/g' .env
sed -i 's/=default/=IAM/g' .env

cd ../..

# Set env variables for React client
cd packages/client
cp .env.template .env

sed -i 's/REACT_APP_PREVIOUS_YEAR_OF_USAGE/#REACT_APP_PREVIOUS_YEAR_OF_USAGE/g' .env
sed -i 's/=2/=12/g' .env

cat <<EOF >> .env
EOF

# Start CCF application (client and API)
cd /home/ec2-user/cloud-carbon-footprint
yarn start
