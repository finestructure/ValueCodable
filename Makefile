.PHONY: magic

PROJ = FSValue
proj = $(shell echo $(PROJ) | tr A-Z a-z)

clean:
	rm -rf .build

xcodeproj:
	swift package generate-xcodeproj

docker-build:
	docker build --tag $(proj) .

test-linux: magic docker-build
	docker run --rm $(proj) swift test

test-macos:
	set -o pipefail && \
	xcodebuild test \
		-scheme $(PROJ)-Package \
		-destination platform="macOS" \

test-swift:
	swift test

test-all: test-linux test-macos

magic:
	sourcery   --templates ./.sourcery   --sources Tests   --args testimports='@testable import '"$(PROJ)"Tests   --output Tests/LinuxMain.swift
