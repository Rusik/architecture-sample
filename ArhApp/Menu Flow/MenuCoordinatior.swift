import UIKit

final class MenuCoordinatior {

    weak var rootViewController: UIViewController?
    private let input: Input

    struct Input {
        let city: String
    }

    init(rootViewController: UIViewController?, input: Input) {
        self.rootViewController = rootViewController
        self.input = input
    }

    // Создание модуля без билдера
    func start_withoutBuilder() {
        let vc = MenuViewController()
        let presenter = MenuPresenter(city: self.input.city)
        let interactor = MenuInteractor()

        vc.presenter = presenter
        presenter.viewController = vc
        presenter.interactor = interactor
        interactor.presenter = presenter

        self.rootViewController?.present(vc, animated: true, completion: nil)
    }

    // Создание модуля с билдером
    func start() {
        let vc = MenuModuleBuilder(input: .init(city: self.input.city), output: self).build()
        self.rootViewController?.present(vc, animated: true, completion: nil)
    }
}

//MARK: - MenuModuleOutput
extension MenuCoordinatior: MenuModuleOutput {
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
