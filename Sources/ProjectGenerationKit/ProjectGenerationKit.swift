//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

public final class ProjectGenerationKit {
    public init() {}

    public func build() throws {
        try Shell.executeXcodegen()
    }

    @discardableResult
    public func archive(_ scheme: String, _ platforms: Platforms...) throws -> String {
        var paths: [String] = []
        try platforms.forEach { paths.append(try Shell.executeArchive(scheme, $0)) }
        return try Shell.executeJoinArchives(scheme, paths)
    }
}
