vpath %.swift Sources

.build/arm64-apple-macosx/debug/showosd: $(wildcard Sources/showosd/*.swift) $(wildcard Sources/*.h)
	swift build \
	    -Xswiftc -F$$PWD/Sources \
	    -Xswiftc -F/System/Library/PrivateFrameworks \
	    -Xswiftc -framework -Xswiftc DisplayServices \
	    -Xswiftc -framework -Xswiftc CoreDisplay \
	    -Xswiftc -framework -Xswiftc OSD \
	    -Xswiftc -import-objc-header -Xswiftc Sources/Bridging-Header.h

.build/arm64-apple-macosx/release/showosd: $(wildcard Sources/showosd/*.swift) $(wildcard Sources/*.h)
	swift build \
		-c release \
	    -Xswiftc -F$$PWD/Sources \
	    -Xswiftc -F/System/Library/PrivateFrameworks \
	    -Xswiftc -framework -Xswiftc DisplayServices \
	    -Xswiftc -framework -Xswiftc CoreDisplay \
	    -Xswiftc -framework -Xswiftc OSD \
	    -Xswiftc -import-objc-header -Xswiftc Sources/Bridging-Header.h

debug: .build/arm64-apple-macosx/debug/showosd
release: .build/arm64-apple-macosx/release/showosd

build: debug
all: build
