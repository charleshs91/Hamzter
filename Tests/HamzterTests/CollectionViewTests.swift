import Hamzter
import UIKit
import XCTest

final class CollectionViewTests: XCTestCase {
  func test_registerComponent_methodCalledCorrectly() {
    let sut = UICollectionViewSpy(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    sut.registerComponent(ofType: ReusableStub.self)

    // UIKit spontaneously registers `UICollectionViewCell` with reuseIdentifier
    // "com.apple.UIKit.shadowReuseCellIdentifier", making call count be 2 instead of 1.
    XCTAssertEqual(sut.registerForCellWithReuseIdentifierCallCount, 2)
    XCTAssertEqual(sut.registerForCellWithReuseIdentifierInvocations.last?.0, String(describing: ReusableStub.self))
    XCTAssertEqual(sut.registerForCellWithReuseIdentifierInvocations.last?.1, ReusableStub.reuseIdentifier)
  }

  private struct DummyModel { }

  private class ReusableStub: UICollectionViewCell, ReusableComponent {
    func update(with viewModel: DummyModel) { }
  }
}
