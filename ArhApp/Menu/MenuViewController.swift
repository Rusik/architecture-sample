import UIKit

final class MenuViewController: UIViewController, ViewSpecificController {

    //MARK: - Types

    typealias RootView = MenuRootView
    typealias DisplayModel = MenuRootView.DisplayModel

    //MARK: - Deps

    var presenter: MenuPresenter!

    //MARK: - Model

    var displayModel: DisplayModel! {
        didSet {
            self.view().configure(displayModel)
        }
    }

    //MARK: - View managing

    override func loadView() {
        self.view = MenuRootView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getData()
    }
}
