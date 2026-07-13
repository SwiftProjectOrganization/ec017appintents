// swift-tools-version: 6.4

import PackageDescription

let package = Package(
  name: "MoodModel",
  platforms: [.iOS(.v27), .macOS(.v27)],
  products: [
    .library(
      name: "MoodModel",
      targets: ["MoodModel"]
    ),
  ],
  targets: [
    .target(
      name: "MoodModel",
      swiftSettings: [.enableUpcomingFeature("NonisolatedNonsendingByDefault")]
    ),
    
  ]
)
