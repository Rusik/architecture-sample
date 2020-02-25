import UIKit

final class MenuPresenter {

    //MARK: - Data

    private let city: String

    //MARK: - Deps
    var interactor: MenuInteractor!
    weak var viewController: MenuViewController!
    weak var output: MenuModuleOutput!

    //MARK: - Init

    init(city: String) {
        self.city = city
    }

    //MARK: - Protocol

    func getData() {
        interactor.getData(forCity: self.city)
    }

    func setModel(_ model: MenuInteractor.MenuModel) {

        let items = model.products.map { product in
            MenuRootView.DisplayModel.Item(displayModel: .init(name: product.name, price: product.price)) {
                self.output.openItem(name: product.name)
            }
        }

        let model = MenuRootView.DisplayModel(items: items, title: self.city) { action in
            switch action {
            case .close:
                self.output.close()
            case .openCart:
                self.output.openCart()
            }
        }

        viewController.setDisplayModel(model)
    }
}
