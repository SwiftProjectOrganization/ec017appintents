// swift-tools-version: 6.4

import PackageDescription

let package = Package(
  name: "MoodUI",
  platforms: [.iOS(.v27), .macOS(.v27)],
  products: [
    .library(
      name: "MoodUI",
      targets: ["MoodUI"]
    ),
  ],
  dependencies: [.package(path: "../MoodModel")],
  targets: [
    .target(
      name: "MoodUI",
      dependencies: ["MoodModel"],
      swiftSettings: [
        .defaultIsolation(MainActor.self),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault")
      ],
    ),
  ]
)
