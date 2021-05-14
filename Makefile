build:
	mkdir -p Output
	yarn tailwindcss build theme.css -o Resources/styles.css -c tailwind.config.js
	swift run

build-release:
	swift build --configuration release

test:
	swift test

dev:
	swift package generate-xcodeproj

upgrade:
	echo "Not implemented"

clean:
	rm -rf .build Output

reinstall:
	echo "Not implemented"

lint:
	swiftlint
	# swiftformat --lint Sources

fmt:
	prettier --write "**/*.{ts,js,md,yaml,yml,sass,css,scss}"
	swift-format --recursive --in-place Sources/ Package.swift

reset-lsp:
	swift package reset
	swift package update
	killall sourcekit-lsp
