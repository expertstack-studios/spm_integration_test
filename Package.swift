// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "SecuredCallsVoiceSDK",
	platforms: [
		.iOS(.v16)
	],
	products: [
		.library(
			name: "SecuredCallsVoiceSDK",
			type: .static,
			targets: ["SecuredCallsVoiceSDKWrapper"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/Vonage/vonage-client-sdk-ios", from: "2.6.3")
	],
	targets: [
		.binaryTarget(
		    name: "SecuredCallsVoiceSDKBinary",
		    url: "https://github.com/expertstack-studios/spm_integration_test/releases/download/1.0.0-rc.1/SecuredCallsVoiceSDK.xcframework.zip",
		    checksum: "7dc1e553c25bd22b7fefcddbe2b76d4a95e84d3c9c53e67ff857ec9bd238c36e"
		),
		.target(
			name: "SecuredCallsVoiceSDKWrapper",
			dependencies: [
				"SecuredCallsVoiceSDKBinary",
				.product(name: "VonageClientSDK", package: "vonage-client-sdk-ios"),
				.product(name: "VonageClientSDKVoice", package: "vonage-client-sdk-ios")
			],
			path: "./Sources/SecuredCallsVoiceSDKWrapper",
			resources: [], // Explicitly no resources
			swiftSettings: [
				.enableExperimentalFeature("AccessLevelOnImport")
			]
		)
	]
)
