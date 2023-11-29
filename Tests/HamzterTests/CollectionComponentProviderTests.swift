import Hamzter
import UIKit
import XCTest

final class CollectionComponentProviderTests: XCTestCase {
  func test_cellAtIndexPathInCollectionView_dequeuedCellIsCorrectlyConfigured() {
    let injectingMessage = #function
    let model = TestingModel(text: "TestingText")
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.registerComponent(ofType: TestingCell.self)
    let sut = CollectionComponentProvider<TestingModel, TestingCell>(model) { cell in
      cell.message = injectingMessage
    }

    let cell = sut.cell(at: IndexPath(item: 0, section: 0), in: collectionView) as? TestingCell

    XCTAssertEqual(cell?.message, injectingMessage)
    XCTAssertEqual(cell?.textLabel.text, model.text)
  }

  func test_modelAs_castingIntoMatchingType_returnsModelCorrectly() throws {
    let model = TestingModel(text: "TestingText")
    let sut = CollectionComponentProvider<TestingModel, TestingCell>(model)

    let outputModel = try XCTUnwrap(sut.getModel(as: TestingModel.self))

    XCTAssertEqual(outputModel, model)
  }

  func test_modelAs_castingIntoWrongType_returnsNil() throws {
    let model = TestingModel(text: "TestingText")
    let sut = CollectionComponentProvider<TestingModel, TestingCell>(model)

    XCTAssertNil(sut.getModel(as: AnotherModel.self))
  }

  private struct TestingModel: Equatable {
    let text: String
  }

  private struct AnotherModel { }

  private class TestingCell: UICollectionViewCell, ReusableComponent {
    let textLabel = UILabel()
    var message: String?
    func update(with viewModel: TestingModel) {
      textLabel.text = viewModel.text
    }
  }
}
