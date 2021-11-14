//
//  Created by Alberto García-Muñoz on 14/11/21.
//

struct ArchiveCommand: CommandProtocol {
    let scheme: String
    let platform: Platforms

    func getDestinationPath() -> String {
        "archives/\(platform.rawValue).xcarchive"
    }

    func getCommand() -> String {
        ["xcodebuild", "archive",
        "-scheme", scheme,
        "-destination", platform.destination,
        "-archivePath", getDestinationPath()
        ].joined(separator: " ")
    }
}
