#!/usr/bin/env bash

curl -s "https://get.sdkman.io" | bash
chmod +x "/root/.sdkman/bin/sdkman-init.sh"
source /root/.sdkman/bin/sdkman-init.sh
sdk install springboot