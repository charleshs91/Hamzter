import UIKit

public typealias ReusableTableViewCell = UITableViewCell & ReusableComponent

public struct ComponentRow<Model, Cell>: TableComponentProviding
where Cell: ReusableTableViewCell,
      Cell.Model == Model {
  public typealias Modifier = (Cell) -> Void

  private let model: Model
  private var modifier: Modifier?

  public init(_ model: Model, modifier: Modifier? = nil) {
    self.model = model
    self.modifier = modifier
  }

  public func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let identifier = Cell.reuseIdentifier
    let cell = tableView.dequeueReusableCell(
      withIdentifier: identifier,
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
