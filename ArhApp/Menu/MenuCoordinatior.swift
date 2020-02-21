import UIKit

final class MenuCoordinatior {
    weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    // Создание модуля без билдера
    func start() {
        let vc = MenuViewController()
        let presenter = MenuPresenter(city: "Moscow")
        let interactor = MenuInteractor()

        vc.presenter = presenter
        presenter.view = vc
        presenter.coordinator = self
        presenter.interactor = interactor
        interactor.presenter = presenter

        self.rootViewController?.present(vc, animated: true, completion: nil)
    }

    // Создание модуля с билдером
    func start2() {
        let vc = MenuModuleBuilder(input: .init(city: "Moscow"), output: self).build()
        self.rootViewController?.present(vc, animated: true, completion: nil)
    }

    //MARK: - MenuModuleOutput
    func close() {
        self.rootViewController?.dismiss(animated: true)
    }

    func openCart() {
        self.rootViewController?.presentedViewController?.showSystemAlertWith(title: "Open Cart", message: nil, actionTitle: "OK")
    }

    func openItem(name: String) {
        self.rootViewController?.presentedViewController?.showSystemAlertWith(title: name, message: nil, actionTitle: "OK")
    }
}

extension MenuCoordinatior: MenuModuleOutput {
    // Уже реализован выше ↑
}
