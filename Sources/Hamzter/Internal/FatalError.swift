import Foundation

struct FatalError {
  let message: String

  func raise() -> Never {
    fatalError(message)
  }
}

extension FatalError {
  static func cellTypeMismatch<T>(_ type: T.Type, identifier: String) -> FatalError {
    return FatalError(
      message: "Failed to down-cast cells with identifier \(identifier) into type \(T.self)."
    )
  }
}
