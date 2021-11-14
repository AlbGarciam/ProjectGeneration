//
//  Created by Alberto García-Muñoz on 14/11/21.
//

import Foundation
import ProjectGenerationCLI
import Version

let version = Version("0.1.0")!
let cli = ProjectGenerationCLI(version: version)
let arguments = Array(CommandLine.arguments.dropFirst())
cli.execute(arguments: arguments)
