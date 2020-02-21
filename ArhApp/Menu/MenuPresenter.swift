import UIKit

final class MenuPresenter {

    //MARK: - Data

    private let city: String

    //MARK: - Deps
    var interactor: MenuInteractor!
    weak var view: MenuViewController!
    weak var coordinator: MenuCoordinatior!
    weak var output: MenuModuleOutput!

    //MARK: - Init

    init(city: String) {
        self.city = city
    }

    //MARK: - Protocol

    func getData() {
        interactor.getData()
    }

    func setDocumentModel(_ model: MenuInteractor.DocumentModel) {

        let items = model.products.map { product in
            MenuRootView.DisplayModel.Item(displayModel: .init(name: product.name, price: product.price)) {
                if UseModuleBuilder {
                    self.output.openItem(name: product.name)
                } else {
                    self.coordinator.openItem(name: product.name)
                }
            }
        }

        let model = MenuRootView.DisplayModel(items: items, title: self.city) { action in
            switch action {
            case .close:
                if UseModuleBuilder {
                    self.output.close()
                } else {
                    self.coordinator.close()
                }
            case .openCart:
                if UseModuleBuilder {
                    self.output.openCart()
                } else {
                    self.coordinator.openCart()
                }
            }
        }

        view.displayModel = model
    }
}
