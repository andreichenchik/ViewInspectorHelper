// swift-tools-version: 6.1

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "ViewInspectorHelper",
  platforms: [
    .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13),
  ],
  products: [
    .library(
      name: "ViewInspectorHelper",
      targets: ["ViewInspectorHelper"]
    ),
    .executable(
      name: "ViewInspectorHelperClient",
      targets: ["ViewInspectorHelperClient"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-syntax", "509.0.0"..<"602.0.0"),
    .package(url: "https://github.com/pointfreeco/swift-macro-testing", from: "0.6.3"),
  ],
  targets: [
    .macro(
      name: "ViewInspectorHelperMacros",
      dependencies: [
        .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
        .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
      ]
    ),
    .target(
      name: "ViewInspectorHelper",
      dependencies: ["ViewInspectorHelperMacros"]
    ),
    .executableTarget(
      name: "ViewInspectorHelperClient",
      dependencies: ["ViewInspectorHelper"]
    ),
    .testTarget(
      name: "ViewInspectorHelperTests",
      dependencies: [
        "ViewInspectorHelperMacros",
        .product(name: "MacroTesting", package: "swift-macro-testing"),
      ]
    ),
  ]
)

