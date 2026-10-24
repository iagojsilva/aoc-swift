import Foundation

public enum InputFileError: Error {
    case resourceNotFound(name: String, extension: String)
}

public func readInput(
    named name: String,
    extension fileExtension: String = "txt",
    bundle: Bundle
) throws -> String {
    guard let fileURL = bundle.url(forResource: name, withExtension: fileExtension) else {
        throw InputFileError.resourceNotFound(name: name, extension: fileExtension)
    }

    return try String(contentsOf: fileURL, encoding: .utf8)
}
