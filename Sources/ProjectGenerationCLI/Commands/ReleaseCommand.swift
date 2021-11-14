import Foundation
import ProjectGenerationKit
import SwiftCLI
import Version

final class ReleaseCommand: BaseBuildCommand {
    @CollectedParam(minCount: 1) var schemes: [String]
    
    init() {
        super.init(name: "Release", description: "Releases the version based on the targets")
    }

    override func execute() throws {
        try super.execute()
        try schemes.forEach { try generationKit.archive($0, Platforms.allCases) }
    }
}
