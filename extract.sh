sudo unzip /tmp/dartsdk-linux-x64-release.zip -d /usr/lib
sudo chown -R $(whoami) /usr/lib/dart-sdk
echo 'export PATH="$PATH:/usr/lib/dart-sdk/bin"' >> $HOME/.bashrc
echo "---------------------------------------------------------"
source $HOME/.bashrc
echo "The Dart SDK has been successfully installed. Open a new terminal to use it."
