import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var coordinator: MenuCoordinatior!

    @IBAction func start() {
        coordinator = MenuCoordinatior(rootViewController: self)
        if UseModuleBuilder {
            coordinator.start2()
        } else {
            coordinator.start()
        }
    }
}

