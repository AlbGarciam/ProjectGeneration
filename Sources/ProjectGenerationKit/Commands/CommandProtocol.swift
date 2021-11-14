import Foundation

protocol CommandProtocol {
    func getCommand() -> [String]

    func execute() throws
}

extension CommandProtocol {
    func execute() throws {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = getCommand()
        task.launch()
        task.waitUntilExit()
        if task.terminationStatus != .zero {
            throw GenerationKitErrors.invalidCommand
        }
    }
}
