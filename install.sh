#!/bin/bash
git clone https://github.com/AlbGarciam/ProjectGeneration.git
cd ProjectGeneration

swift build -c release
cp -f .build/release/ProjectGeneration /usr/local/bin/ProjectGeneration

cd ..