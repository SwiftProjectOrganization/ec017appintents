// swift-tools-version: 6.2

import PackageDescription

let package = Package(
  name: "MoodModelIntents",
  platforms: [.iOS(.v26), .macOS(.v26)],
  products: [
    .library(
      name: "MoodModelIntents",
      targets: ["MoodModelIntents"]
    ),
  ],
  dependencies: [.package(path: "../../../Support/MoodModel")],
  targets: [
    .target(
      name: "MoodModelIntents",
      dependencies: ["MoodModel"],
      swiftSettings: [.enableUpcomingFeature("NonisolatedNonsendingByDefault")]
    ),
  ]
)
