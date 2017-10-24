FROM lingcv/work:base

MAINTAINER yanzhenlei@ling.ai

# install ndk
ENV ANDROID_NDK_VERSION r15c
ENV ANDROID_NDK_URL https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
ENV ANDROID_NDK_HOME /opt/android_ndk_${ANDROID_NDK_VERSION}

RUN curl -sSL "${ANDROID_NDK_URL}" -o ndk_${ANDROID_NDK_VERSION}-linux.zip \
    && unzip ndk_${ANDROID_NDK_VERSION}-linux.zip -d ${ANDROID_NDK_HOME} \
    && rm -rf ndk_${ANDROID_NDK_VERSION}-linux.zip

# install gradle
ENV GRADLE_HOME /opt/gradle
ENV GRADLE_VERSION 4.2.1
RUN curl -sSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip \
    && mv gradle-${GRADLE_VERSION} ${GRADLE_HOME}/ \
    && rm gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_OPTS "-Dorg.gradle.jvmargs=-Xmx4096M"

ENV PATH ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin:${ANDROID_NDK_HOME}:${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$PATH
