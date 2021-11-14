import Foundation
import SwiftCLI
import Version

public final class ProjectGenerationCLI {
    let cli: CLI

    public init(version: Version) {
        let buildCommand = BuildCommand()
        cli = CLI(name: "project generation",
                  version: version.description,
                  description: "Generates Xcode projects",
                  commands: [buildCommand, ReleaseCommand()])
        cli.parser.routeBehavior = .searchWithFallback(buildCommand)
    }

    public func execute(arguments: [String]) {
        let status: Int32
        if !arguments.isEmpty {
            print("executing with arguments")
            status = cli.go(with: arguments)
        } else {
            status = cli.go()
        }
        exit(status)
    }
}
