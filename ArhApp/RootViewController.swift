import UIKit

protocol RootViewControllerOutput: class {
    func showMenu()
}

class RootViewController: UIViewController {
    weak var output: RootViewControllerOutput?

    @IBAction func start() {
        self.output?.showMenu()
    }
}
