//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

public enum Platforms: String, CaseIterable {
    case iOS
    case iOSSimulator
    case ipadOS
    case ipadOSSimulator
    case macOSCatalyst

    var destination: String {
        switch self {
        case .iOS:
            return "generic/platform=iOS"
        case .iOSSimulator:
            return "generic/platform=iOS Simulator"
        case .ipadOS:
            return "generic/platform=iPadOS"
        case .ipadOSSimulator:
            return "generic/platform=iPadOS Simulator"
        case .macOSCatalyst:
            return "generic/platform=macOS,variant=Mac Catalyst"
        }
    }
}
