import UIKit

final class UICollectionViewSpy: UICollectionView {
  var registerForCellWithReuseIdentifierCallCount: Int = 0
  var registerForCellWithReuseIdentifierInvocations: [(String, String)] = []

  override func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) {
    registerForCellWithReuseIdentifierCallCount += 1
    guard let cellClass else { return }
    let classTypeString = String(describing: cellClass.self)
    registerForCellWithReuseIdentifierInvocations.append((classTypeString, identifier))
  }
}
