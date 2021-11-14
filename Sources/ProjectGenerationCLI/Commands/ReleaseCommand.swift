import Foundation
import SwiftCLI
import Version

final class ReleaseCommand: BaseBuildCommand {
    @Param var version: String
    @CollectedParam(minCount: 1) var schemes: [String]
    
    init() {
        super.init(name: "Release", description: "Releases the version based on the targets")
    }

    override func execute() throws {
        try super.execute()
        try generationKit.archive(.iOS, .ipadOS, .macOSCatalyst)
    }
}
