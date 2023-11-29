import Foundation

public protocol ReusableComponent<Model>: Reusable {
  associatedtype Model
  func update(with viewModel: Model)
}
