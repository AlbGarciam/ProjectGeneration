//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation

public enum Platforms: String {
    case iOS
    case ipadOS
    case macOSCatalyst

    var destination: String {
        ""
    }
}
