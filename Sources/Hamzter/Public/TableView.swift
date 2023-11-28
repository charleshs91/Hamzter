import UIKit

public protocol TableView {
  func registerComponent<T: ReusableTableViewCell>(ofType: T.Type)
}

extension UITableView: TableView {
  public func registerComponent<T: ReusableTableViewCell>(ofType: T.Type) {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }
}
