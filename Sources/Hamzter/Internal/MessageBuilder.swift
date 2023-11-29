import Foundation

enum MessageBuilder {
  static func cellTypeMismatchError<T, U>(_ type: T.Type, object: U, identifier: String) -> String {
    let objectType = String(describing: Swift.type(of: object))
    return "Failed to down-cast cell of type \(objectType) with identifier \(identifier) into type \(T.self)."
  }
}
