// swift-tools-version: 6.4

import PackageDescription

let package = Package(
  name: "MoodModelIntents",
  platforms: [.iOS(.v27), .macOS(.v27)],
  products: [
    .library(
      name: "MoodModelIntents",
      targets: ["MoodModelIntents"]
    ),
  ],
  dependencies: [.package(path: "../../../Support/MoodUI")],
  targets: [
    .target(
      name: "MoodModelIntents",
      dependencies: ["MoodUI"],
      swiftSettings: [.enableUpcomingFeature("NonisolatedNonsendingByDefault")]
    ),
  ]
)
