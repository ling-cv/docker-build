FROM lingcv/work:base

MAINTAINER yanzhenlei@ling.ai
# install android sdk
RUN curl -L https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip -o /tmp.zip
RUN unzip /tmp.zip -d /opt/android && rm /tmp.zip
#
# Environment variables
ENV ANDROID_HOME /opt/android
ENV PATH $ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH
#
# Update of Android SDK
RUN echo y | sdkmanager "platforms;android-24"
RUN echo y | sdkmanager "platforms;android-25"
RUN echo y | sdkmanager "build-tools;25.0.0"
RUN echo y | sdkmanager "build-tools;25.0.2"
RUN echo y | sdkmanager "build-tools;25.0.3"
RUN echo y | sdkmanager "platforms;android-26"
RUN echo y | sdkmanager "build-tools;26.0.0"
RUN echo y | sdkmanager "build-tools;26.0.1"
RUN echo y | sdkmanager "build-tools;26.0.2"
# # Accept licenses
RUN yes | sdkmanager --licenses

# install ndk
ENV ANDROID_NDK_VERSION r11c
ENV ANDROID_NDK_URL https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip
ENV ANDROID_NDK_HOME /opt/android-ndk-${ANDROID_NDK_VERSION}

RUN curl -sSL "${ANDROID_NDK_URL}" -o ndk_${ANDROID_NDK_VERSION}-linux.zip \
    && unzip ndk_${ANDROID_NDK_VERSION}-linux.zip \
    && mv android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} \
    && rm ndk_${ANDROID_NDK_VERSION}-linux.zip

# install gradle
ENV GRADLE_VERSION 4.2.1
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}

RUN curl -sSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle-${GRADLE_VERSION}-bin.zip \
    && unzip gradle-${GRADLE_VERSION}-bin.zip \
    && mv gradle-${GRADLE_VERSION} ${GRADLE_HOME} \
    && rm gradle-${GRADLE_VERSION}-bin.zip

ENV GRADLE_OPTS "-Dorg.gradle.jvmargs=-Xmx4096M"

ENV PATH ${GRADLE_HOME}/bin:${ANDROID_NDK_HOME}:${ANDROID_NDK_HOME}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$PATH
