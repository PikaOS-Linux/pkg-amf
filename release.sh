# Sign the packages
dpkg-sig --sign builder ./output/libffmpeg-amf*.deb

# Pull down existing ppa repo db files etc
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libffmpeg-amf*)'

# Add the new package to the repo
reprepro -C main -V --basedir ./output/repo/ includedeb lunar ./output/libffmpeg-amf*.deb

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
