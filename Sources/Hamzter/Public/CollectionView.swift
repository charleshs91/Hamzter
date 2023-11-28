import UIKit

public protocol CollectionView {
  func registerComponent<T: ReusableCollectionViewCell>(ofType: T.Type)
}

extension UICollectionView: CollectionView {
  public func registerComponent<T: ReusableCollectionViewCell>(ofType: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
}
