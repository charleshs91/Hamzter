import UIKit

extension UICollectionView: CollectionViewCellRegistering {
  public func registerComponent<T: ReusableCollectionViewCell>(ofType: T.Type) {
    register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
}
