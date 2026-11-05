#!/bin/bash
set -e
mkdir apk
mkdir build
cd cmd/

chmod +x corsc.sh coapk.sh coclass.sh d8.sh dexadd.sh apkalign.sh signapk.sh

./corsc.sh
./coapk.sh

cd ..
mkdir -p build/classes
cd cmd/

./coclass.sh
./d8.sh
./dexadd.sh
./apkalign.sh
./signapk.sh

echo apk build successfuls 😎😎😎