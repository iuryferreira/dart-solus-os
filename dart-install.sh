echo '******************************'
echo 'Installing Dart...'
echo $'------------------------------\n'
sh dependencies.sh
echo "Enter the version number you want to download (ex: 2.7.1): "
read version

SYSTEM=$(uname -m)

if [ ${SYSTEM} == 'x86_64' ]; then

    FILENAME=./dartsdk-linux-x64-release.zip

    if [ -e "$FILENAME" ]; then

        SHA256SUM=$(wget https://storage.googleapis.com/dart-archive/channels/stable/release/$version/sdk/dartsdk-linux-x64-release.zip.sha256sum)
        ACTFILE=$(sha256sum dartsdk-linux-x64-release.zip)

        if [ ${ACTFILE} == ${SHA256SUM} ]; then

            sh extract.sh
            exit
        fi
    fi

    WGET=$(
        wget https://storage.googleapis.com/dart-archive/channels/stable/release/$version/sdk/dartsdk-linux-x64-release.zip --continue --show-progress
    )

    EXITCODE=$?

    if [ $EXITCODE -ne 0 ]; then
        echo "The version entered was not found. Check the available versions in https://dart.dev/tools/sdk/archive and try again."
    else
        sh extract.sh
    fi

else
    echo "Your system does not support the Dart SDK."

fi