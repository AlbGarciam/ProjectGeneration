import Foundation
import SwiftCLI

protocol CommandProtocol {
    func getCommand() -> String

    func execute() throws
}

extension CommandProtocol {
    func execute() throws {
        let command = getCommand()
        print("Executing command: \(command)")
        _ = try Task.capture(bash: command)
    }

    func getCommand() -> String { "" }
}
