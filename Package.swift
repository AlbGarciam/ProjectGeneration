// swift-tools-version:5.5
import PackageDescription

//MARK: - Extensions
extension Target.Dependency {
    init(_ target: Target, _ condition: TargetDependencyCondition? = nil) {
        self = .target(name: target.name, condition: condition)
    }
}

//MARK: - Target dependencies definition
let swiftCLI: Target.Dependency = .product(name: "SwiftCLI", package: "SwiftCLI")
let version: Target.Dependency = .product(name: "Version", package: "Version")

//MARK: - Targets definition
let projectGenerationKit: Target = .target(name: "ProjectGenerationKit",
                                           dependencies: [])
let projectGenerationCLI: Target = .target(name: "ProjectGenerationCLI",
                                           dependencies: [swiftCLI, version, .init(projectGenerationKit)])
let projectGeneration: Target = .target(name: "ProjectGeneration",
                                        dependencies: [.init(projectGenerationCLI), version])

//MARK: - Package definition
let package = Package(
    name: "ProjectGeneration",
    platforms: [.macOS(.v10_14)],
    products: [
        .executable(name: "projectGeneration", targets: [projectGeneration.name]),
        .library(name: projectGenerationCLI.name, targets: [projectGenerationCLI.name]),
        .library(name: projectGenerationKit.name, targets: [projectGenerationKit.name])
    ],
    dependencies: [
        .package(url: "https://github.com/yonaskolb/XcodeGen.git", from: "2.25.0"),
        .package(url: "https://github.com/mxcl/Version.git", from: "2.0.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI.git", from: "6.0.3")
    ],
    targets: [projectGeneration,
              projectGenerationCLI,
              projectGenerationKit]
)
