//
//  Created by Alberto García-Muñoz on 14/11/21.
//

struct CleanCommand: CommandProtocol {
    let scheme: String
    let platforms: [Platforms]

    func getCommand() -> String {
        platforms
            .reduce(["rm", "-rf", "\(scheme).xcframework"]) { $0 + ["archives/\($1.rawValue).xcarchive"] }
            .joined(separator: " ")
    }
}
