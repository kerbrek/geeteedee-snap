#!/bin/sh

filename="codea-geeteedee_0.2.608_amd64.deb"
downloadpath="/tmp/${filename}"
url="https://www.codea.ru/download/${filename}"
checksum="beaef45c44ec8066c6371a99852ea2befdc9257cb6fbbf152c25efa0eb683f0d"

curl -f -L "$url" -o "$downloadpath"
if [ $? -ne 0 ]; then echo "curl error" && exit 1; fi

echo "$checksum  $downloadpath" | sha256sum --check
if [ $? -ne 0 ]; then echo "wrong checksum" && exit 1; fi

mv "$downloadpath" .

dpkg-deb --extract "$filename" tmpdir
dpkg-deb --control "$filename" tmpdir/DEBIAN

rm ./tmpdir/usr/bin/geeteedee
ln -s ../../opt/codea/geeteedee/geeteedee ./tmpdir/usr/bin/geeteedee

oldicon="Icon=codea-geeteedee"
newicon="Icon=\/usr\/share\/icons\/hicolor\/256x256\/apps\/codea-geeteedee.png"
sed -i "s/${oldicon}/${newicon}/" ./tmpdir/opt/codea/geeteedee/codea-geeteedee.desktop

olddep="libqt4-gui (>= 4.8.0)"
newdep="libqt4-designer (>= 4.8.0), libqt4-opengl (>= 4.8.0), libqt4-svg (>= 4.8.0), libqtgui4 (>= 4.8.0)"
sed -i "s/${olddep}/${newdep}/" ./tmpdir/DEBIAN/control

dpkg-deb --build tmpdir codea-geeteedee_fixed_amd64.deb
rm -rf tmpdir
