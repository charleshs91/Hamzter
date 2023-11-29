import UIKit

extension UITableView: TableViewCellRegistering {
  public func registerComponent<T: ReusableTableViewCell>(ofType: T.Type) {
    register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
  }
}
