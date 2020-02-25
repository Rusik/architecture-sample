import Foundation

final class MenuInteractor {

    //MARK: - Types

    struct MenuModel {
        let products: [Product]
        struct Product {
            let name: String
            let price: Int
        }
    }

    //MARK: - Deps
    weak var presenter: MenuPresenter!
    private var menuNetworkService: MenuNetworkService = MenuNetworkService()

    //MARK: - Protocol

    func getData(forCity city: String) {
        menuNetworkService.loadMenu(forCity: city) { result in
            let model = MenuModel(products: [
                .init(name: "Эспрессо", price: 90),
                .init(name: "Капучинно", price: 130),
                .init(name: "Раф", price: 150)
            ])
            self.presenter.setModel(model)
        }
    }
}
