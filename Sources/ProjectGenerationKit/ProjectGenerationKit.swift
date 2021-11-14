//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

public final class ProjectGenerationKit {
    public init() {}

    public func build() throws {
        try XcodegenCommand().execute()
    }

    @discardableResult
    public func archive(_ scheme: String, _ platforms: [Platforms]) throws -> String {
        try CleanCommand(scheme: scheme, platforms: platforms).execute()
        let commands = platforms.map { ArchiveCommand(scheme: scheme, platform: $0) }
        try commands.forEach { try $0.execute() }
        let paths: [String] = commands.reduce([]) { $0 + [$1.getDestinationPath()] }
        let generateCommand = GenerateXCFrameworkCommand(scheme: scheme, frameworkPaths: paths)
        try generateCommand.execute()
        return generateCommand.getDestinationPath()
    }
}
