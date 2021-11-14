struct XcodegenCommand: CommandProtocol {
    func getCommand() -> [String] {
        return ["swift", "run", "xcodegen", "generate"]
    }
}
