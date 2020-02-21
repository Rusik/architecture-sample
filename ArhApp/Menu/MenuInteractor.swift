import Foundation

final class MenuInteractor {

    //MARK: - Types

    struct DocumentModel {
        let products: [Product]
        struct Product {
            let name: String
            let price: Int
            let currency: String
        }
    }

    //MARK: - Deps
    weak var presenter: MenuPresenter!

    //MARK: - Protocol

    func getData() {
        OperationQueue.main.addOperation {
            let model = DocumentModel(products: [
                .init(name: "Эспрессо", price: 90, currency: "RUB"),
                .init(name: "Капучинно", price: 130, currency: "RUB"),
                .init(name: "Раф", price: 150, currency: "RUB")
            ])
            self.presenter.setDocumentModel(model)
        }
    }
}
