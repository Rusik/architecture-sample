import UIKit

final class AppCoordinator {

    private weak var window: UIWindow?
    private weak var viewController: RootViewController?
    private var menuCoordinator: MenuCoordinatior?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        self.viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? RootViewController
        self.viewController?.output = self
        self.window?.rootViewController = self.viewController
    }
}

//MARK: - RootViewControllerOutput
extension AppCoordinator: RootViewControllerOutput {
    func showMenu() {
        self.menuCoordinator = MenuCoordinatior(rootViewController: self.viewController, input: .init(city: "Москва"))
        menuCoordinator?.start()
    }
}
