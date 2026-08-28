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
		    url: "https://github.com/expertstack-studios/spm_integration_test/releases/download/v1.0.1-rc.1/SecuredCallsVoiceSDK.xcframework.zip",
		    checksum: "df99f84d0e8a9abe7c9fea2b1777a2ee37965fc6cc39e59703e45235e0681ba7"
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
