#! /bin/bash

# Clone Upstream
git clone https://github.com/GPUOpen-LibrariesAndSDKs/AMF -b v1.4.30 ./amf
cp -rvf ./debian ./amf
cd ./amf
for i in ../patches/* ; do patch -Np1 -i $i; done

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
