# Deploy Database Layer
cd ./layers/database
echo $PWD
./database-layer-script.sh
serverless deploy

# Deploy External Layer
cd ..
echo $PWD


# Deploy External Layer
cd ./externals
./externals-layer-script.sh
echo $PWD
serverless deploy

# Deploy Main Lambdas
cd ..
cd ..
echo $PWD
serverless deploy