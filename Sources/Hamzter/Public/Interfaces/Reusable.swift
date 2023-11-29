import Foundation

public protocol Reusable {
  static var reuseIdentifier: String { get }
  func prepareForReuse()
}

public extension Reusable {
  static var reuseIdentifier: String {
    String(describing: self)
  }
}
