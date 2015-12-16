FROM swiftdocker/swift-dev

RUN rm -rf /development/cmark
WORKDIR /development/swift
RUN git pull
WORKDIR /development
RUN ./swift/utils/update-checkout --clone
RUN ./swift/utils/update-checkout --all
RUN ./swift/utils/build-script -R
