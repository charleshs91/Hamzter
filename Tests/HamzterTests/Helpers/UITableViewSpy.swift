import UIKit

final class UITableViewSpy: UITableView {
  var registerForCellReuseIdentifierCallCount: Int = 0
  var registerForCellReuseIdentifierInvocations: [(String, String)] = []

  override func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
    registerForCellReuseIdentifierCallCount += 1
    guard let cellClass else { return }
    let classTypeString = String(describing: cellClass.self)
    registerForCellReuseIdentifierInvocations.append((classTypeString, identifier))
  }
}
