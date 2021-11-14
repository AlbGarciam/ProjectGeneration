#!/bin/bash
rm -rf ProjectGeneration
git clone https://github.com/AlbGarciam/ProjectGeneration.git
cd ProjectGeneration

swift build -c release
cp -f .build/release/ProjectGeneration /usr/local/bin/ProjectGeneration

cd ..
rm -rf ProjectGeneration