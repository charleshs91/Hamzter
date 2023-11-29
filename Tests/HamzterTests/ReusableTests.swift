import Hamzter
import XCTest

final class ReusableTests: XCTestCase {
  func test_reuseIdentifier_defaultImplementation_shouldGetCorrectResult() {
    XCTAssertEqual(ReusableStub.reuseIdentifier, String(describing: ReusableStub.self))
  }

  private class ReusableStub: Reusable {
    func prepareForReuse() { }
  }
}
