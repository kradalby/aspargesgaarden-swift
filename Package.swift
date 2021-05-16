// swift-tools-version:5.2

import PackageDescription

let package = Package(
  name: "Aspargesgaarden",
  products: [
    .executable(
      name: "Aspargesgaarden",
      targets: ["Aspargesgaarden"]
    )
  ],
  dependencies: [
    .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
  ],
  targets: [
    .target(
      name: "Aspargesgaarden",
      dependencies: ["Publish"]
    )
  ]
)
