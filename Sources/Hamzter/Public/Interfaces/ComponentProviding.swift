import UIKit

public protocol ComponentProviding {
  func getModel<T>(as type: T.Type) -> T?
}

public protocol CollectionComponentProviding: ComponentProviding {
  func cell(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
}

public protocol TableComponentProviding: ComponentProviding {
  func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
}
