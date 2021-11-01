function prepare_externals_lambda_layer() {
    

    echo "Cleaning up workspace ..."
    rm -rf lambda-layers-externals

    echo "Creating layer ..."
    mkdir -p lambda-layers-externals/nodejs/node14/

    echo "Copy package.json"
    cp -r package.json lambda-layers-externals/nodejs/node14/

    echo "Jump into temp dicrectory"
    cd ./lambda-layers-externals/nodejs/node14/

    echo "Install externals lambda layer dependencies ..."
    npm install --production

    echo "Jump into dicrectory"
    cd ..
    cd ..
    cd ..
    echo "Current dictory: ${PWD}"




    # echo "Compressing ..."
    # pushd lambda-layers-externals && tar -zcf /tmp/externals.tar.gz . && mv /tmp/externals.tar.gz ./externals.tar.gz

    # echo "Remove unzipped files ..."
    # rm -rf nodejs

    # echo "Stats:"
    # ls -lh externals.tar.gz

  popd
}

prepare_externals_lambda_layer