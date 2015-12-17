FROM swiftdocker/swift-dev

RUN rm -rf /development/cmark
WORKDIR /development/swift
RUN git pull
WORKDIR /development
RUN ./swift/utils/update-checkout --clone
RUN ./swift/utils/update-checkout --all
RUN ./swift/utils/build-script --assertions --no-swift-stdlib-assertions --llbuild --swiftpm --xctest --build-subdir=buildbot_linux --lldb --release --foundation -- --swift-enable-ast-verifier=0 --install-swift --install-lldb --install-llbuild --install-swiftpm --install-xctest --install-prefix=usr '--swift-install-components=compiler;clang-builtin-headers;stdlib;sdk-overlay;dev' --build-swift-static-stdlib=1 --install-destdir=/ --install-foundation --reconfigure
RUN swift --version
