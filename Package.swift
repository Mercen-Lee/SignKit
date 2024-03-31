// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "SignKit",
  platforms: [.iOS(.v11)],
  products: [
    .library(
      name: "SignKit",
      targets: ["SignKit"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "SignKit",
      dependencies: [])
  ]
)
