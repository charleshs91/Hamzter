import UIKit

public protocol CollectionViewComponentRendering {
  func cell(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
}

public typealias ReusableCollectionViewCell = UICollectionViewCell & ReusableComponent

public struct CollectionViewComponentRenderer<Model, Cell>: CollectionViewComponentRendering
where Cell: ReusableCollectionViewCell,
      Cell.Model == Model {
  public typealias Modifier = (Cell) -> Void

  private let model: Model
  private var modifier: Modifier?

  public init(model: Model, modifier: Modifier? = nil) {
    self.model = model
    self.modifier = modifier
  }

  public func cell(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
    let identifier = Cell.reuseIdentifier
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: identifier,
      for: indexPath
    ) as? Cell else {
      FatalError.cellTypeMismatch(Cell.self, identifier: identifier).raise()
    }
    cell.update(with: model)
    modifier?(cell)
    return cell
  }
}
