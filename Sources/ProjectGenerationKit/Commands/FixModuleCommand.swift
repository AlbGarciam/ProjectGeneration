//
//  File.swift
//  
//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

struct FixModuleCommand: CommandProtocol {
    let xcframeworkPath: String
    let scheme: String

    func execute() throws {
        try getSwiftInterfaces().forEach { try fixInterfaceForFileAt($0) }
    }

    private func getSwiftInterfaces() -> [String] {
        let enumerator = FileManager.default.enumerator(atPath: xcframeworkPath)
        let filePaths = enumerator?.allObjects as! [String]
        return filePaths.filter { $0.contains(".swiftinterface") }
    }

    private func fixInterfaceForFileAt(_ path: String) throws {
        let data = try readFileAt(path)
        var content = String(data: data, encoding: .utf8) ?? ""
        content = content.replacingOccurrences(of: "\(scheme).", with: "")
        try writeFileAt(content, path)
    }

    private func readFileAt(_ path: String) throws -> Data {
        let interfacePath = "\(FileManager.default.currentDirectoryPath)/\(xcframeworkPath)/\(path)"
        let fileURL = URL(fileURLWithPath: interfacePath)
        return try Data(contentsOf: fileURL)
    }

    private func writeFileAt(_ content: String, _ path: String) throws {
        let interfacePath = "\(FileManager.default.currentDirectoryPath)/\(xcframeworkPath)/\(path)"
        let fileURL = URL(fileURLWithPath: interfacePath)
        try content.data(using: .utf8)?.write(to: fileURL)
    }
}
