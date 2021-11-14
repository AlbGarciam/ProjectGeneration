import SwiftCLI

final class BuildCommand: BaseBuildCommand {
    init() {
        super.init(name: "Build", description: "Generates xcodeproj structure")
    }
}
