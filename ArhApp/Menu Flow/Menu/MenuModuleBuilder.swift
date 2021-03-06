import UIKit

struct MenuModuleInput {
    let city: String
}

protocol MenuModuleOutput: class {
    func close()
    func openCart()
    func openItem(name: String)
}

struct MenuModuleBuilder {

    let input: MenuModuleInput
    let output: MenuModuleOutput

    func build() -> UIViewController {

        let vc = MenuViewController()
        let presenter = MenuPresenter(city: input.city)
        let interactor = MenuInteractor()

        vc.presenter = presenter
        presenter.viewController = vc
        presenter.output = output
        presenter.interactor = interactor
        interactor.presenter = presenter

        return vc
    }
}
