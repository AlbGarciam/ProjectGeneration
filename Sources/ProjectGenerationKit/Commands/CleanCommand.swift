//
//  Created by Alberto García-Muñoz on 14/11/21.
//

struct CleanCommand: CommandProtocol {
    let scheme: String
    let platforms: [Platforms]

    func getCommand() -> [String] {
        var command = ["rm", "-rf"]
        command.append("\(scheme).xcframework")
        return platforms.reduce(command) { $0 + ["archives/\($1.rawValue).xcarchive"] }
    }
}
