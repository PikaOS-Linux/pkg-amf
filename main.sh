# Clone Upstream
git clone https://github.com/GPUOpen-LibrariesAndSDKs/AMF
cp -rvf ./debian ./AMF
mv ./AMF ./amf
cd ./amf

# Get build deps
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p amf_1.4.29
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
