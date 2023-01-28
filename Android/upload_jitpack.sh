#!/bin/bash

#定义颜色的变量
RED_COLOR="\033[1;31m"  #红
GREEN_COLOR="\033[1;32m" #绿
YELOW_COLOR="\033[1;33m" #黄
BLUE_COLOR="\033[1;34m"  #蓝
PINK="\033[1;35m"    #粉红
RES="\033[0m"

./gradlew checkUploadConfig4Local || ! echo -e  "${RED_COLOR}未通过打包的配置检测！！！ ${RES}" || exit
./gradlew copyPluginSource
./gradlew clean
#./gradlew assembleRelease --stacktrace
./gradlew :dokit-plugin:assemble --stacktrace
./gradlew :dokit:assembleRelease --stacktrace
./gradlew :dokit-no-op:assembleRelease --stacktrace
./gradlew :dokit-okhttp-api:assembleRelease --stacktrace
./gradlew :dokit-okhttp-v3:assembleRelease --stacktrace
./gradlew :dokit-okhttp-v4:assembleRelease --stacktrace
./gradlew :dokit-ft:assembleRelease --stacktrace
./gradlew :dokit-test:assembleRelease --stacktrace
./gradlew :dokit-autotest:assembleRelease --stacktrace
./gradlew :dokit-mc:assembleRelease --stacktrace
./gradlew :dokit-util:assembleRelease --stacktrace
./gradlew :dokit-weex:assembleRelease --stacktrace
./gradlew :dokit-pthread-hook:assembleRelease --stacktrace
./gradlew :dokit-gps-mock:assembleRelease --stacktrace
#publishToMavenLocal
./gradlew :dokit-plugin:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-no-op:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-okhttp-api:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-okhttp-v3:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-okhttp-v4:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-ft:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-test:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-autotest:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-mc:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-util:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-weex:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-pthread-hook:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
./gradlew :dokit-gps-mock:publishToMavenLocal --stacktrace -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
echo -e "${GREEN_COLOR}本地打包完成！！！${RES}" -Pgpr.user=$MVN_USER -Pgpr.key=$MVN_GITHUB
