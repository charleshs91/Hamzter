import UIKit

public protocol TableViewCellRegistering {
  func registerComponent<T: ReusableTableViewCell>(ofType: T.Type)
}

public protocol CollectionViewCellRegistering {
  func registerComponent<T: ReusableCollectionViewCell>(ofType: T.Type)
}
