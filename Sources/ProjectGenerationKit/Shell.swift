//
//  File.swift
//  
//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

final class Shell {
    static func executeXcodegen() throws {
        return try execute(["swift run xcodegen generate"])
    }

    static func executeArchive(_ scheme: String, _ platform: Platforms) throws -> String {
        let archivePath = "archives/\(platform.rawValue).xcarchive"
        try execute(["xcodebuild", "archive",
                     "-scheme", scheme,
                     "-destination", platform.destination,
                     "-archivePath", archivePath,
                     "SKIP_INSTALL", "NO",
                     "BUILD_LIBRARY_FOR_DISTRIBUTION", "YES"
                    ])
        return archivePath
    }

    static func executeJoinArchives(_ scheme: String, _ frameworkPaths: [String]) throws -> String {
        var command = ["xcodebuild", "-create-xcframework"]
        frameworkPaths.forEach {
            command.append(contentsOf: ["-framework", $0])
        }
        command.append(contentsOf: ["-output", "\(scheme).xcframework"])
        try execute(command)
        return "\(scheme).xcframework"
    }


    private static func execute(_ command: String) throws {
        return try execute(command.components(separatedBy: " "))
    }

    private static func execute(_ args: [String]) throws {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = args
        task.launch()
        task.waitUntilExit()
        if task.terminationStatus != .zero {
            throw GenerationKitErrors.invalidCommand
        }
    }
}
