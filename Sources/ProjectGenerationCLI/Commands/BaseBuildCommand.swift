import ProjectGenerationKit
import SwiftCLI

class BaseBuildCommand: Command {
    var name: String
    var shortDescription: String
    var generationKit: ProjectGenerationKit

    init(name: String, description: String) {
        self.name = name
        self.shortDescription = description
        self.generationKit = ProjectGenerationKit()
    }

    func execute() throws {
        try generationKit.build()
    }
}
