//
//  Created by Alberto García-Muñoz on 14/11/21.
//
import Foundation

struct GenerateXCFrameworkCommand: CommandProtocol {
    let scheme: String
    let frameworkPaths: [String]

    func getDestinationPath() -> String {
        "\(scheme).xcframework"
    }

    func getCommand() -> String {
        var command = ["xcodebuild", "-create-xcframework"]
        frameworkPaths.forEach {
            command.append(contentsOf: ["-framework", "\($0)/Products/Library/Frameworks/\(scheme).framework"])
            command.append(contentsOf: ["-debug-symbols", "\(FileManager.default.currentDirectoryPath)/\($0)/BCSymbolMaps"])
        }
        command.append(contentsOf: ["-output", "\(scheme).xcframework"])
        return command.joined(separator: " ")
    }
}
