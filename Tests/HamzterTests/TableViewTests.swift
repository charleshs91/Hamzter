import Hamzter
import UIKit
import XCTest

final class TableViewTests: XCTestCase {
  func test_registerComponent_methodCalledCorrectly() {
    let sut = UITableViewSpy()

    sut.registerComponent(ofType: ReusableStub.self)

    XCTAssertEqual(sut.registerForCellReuseIdentifierCallCount, 1)
    XCTAssertEqual(sut.registerForCellReuseIdentifierInvocations.first?.0, String(describing: ReusableStub.self))
    XCTAssertEqual(sut.registerForCellReuseIdentifierInvocations.first?.1, ReusableStub.reuseIdentifier)
  }

  private struct DummyModel { }

  private class ReusableStub: UITableViewCell, ReusableComponent {
    func update(with viewModel: DummyModel) { }
  }
}
