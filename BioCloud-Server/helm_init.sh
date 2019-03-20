start=`date +%s`

# Install the helm client
apt-get update
# Install snapd if not already installed
apt install snapd -y
snap install helm --classic

# Install Tiller (server portion of Helm)
helm init

# Get Helm Charts
git clone https://github.com/WKUCloudLab/BioCloud-HelmCharts.git
cd BioCloud-HelmCharts
helm package BioCloud-Server
helm install BioCloud-Server-0.1.0.tgz

end=`date +%s`
runtime=$((end-start))

echo "Run time is $runtime"