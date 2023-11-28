import UIKit

public protocol TableViewComponentRendering {
  func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
}

public typealias ReusableTableViewCell = UITableViewCell & ReusableComponent

public struct TableViewComponentRenderer<Model, Cell>: TableViewComponentRendering
where Cell: ReusableTableViewCell,
      Cell.Model == Model {
  public typealias Modifier = (Cell) -> Void

  private let model: Model
  private var modifier: Modifier?

  public init(model: Model, modifier: Modifier? = nil) {
    self.model = model
    self.modifier = modifier
  }

  public func cell(at indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
    let identifier = Cell.reuseIdentifier
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: identifier,
      for: indexPath
    ) as? Cell else {
      FatalError.cellTypeMismatch(Cell.self, identifier: identifier).raise()
    }
    cell.update(with: model)
    modifier?(cell)
    return cell
  }
}
