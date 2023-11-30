import UIKit

public typealias ReusableCollectionViewCell = UICollectionViewCell & ReusableComponent

public struct ComponentGrid<Model, Cell>: CollectionComponentProviding
where Cell: ReusableCollectionViewCell,
      Cell.Model == Model {
  public typealias Modifier = (Cell) -> Void

  private let model: Model
  private var modifier: Modifier?

  public init(_ model: Model, modifier: Modifier? = nil) {
    self.model = model
    self.modifier = modifier
  }

  public func cell(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
    let identifier = Cell.reuseIdentifier
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: identifier,
      for: indexPath
    )
    guard let cell = cell as? Cell else {
      assertionFailure(MessageBuilder.cellTypeMismatchError(Cell.self, object: cell, identifier: identifier))
      return cell
    }
    cell.update(with: model)
    modifier?(cell)
    return cell
  }

  public func getModel<T>(as type: T.Type) -> T? {
    return model as? T
  }
}
