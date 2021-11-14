//
//  File.swift
//  
//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

enum CommandErrors: Error {
    case invalidNumberOfSchemes

    var localizedDescription: String {
        switch self {
        case .invalidNumberOfSchemes:
            return "Invalid number of schemes, please provide the schemes you want to build"
        }
    }
}
