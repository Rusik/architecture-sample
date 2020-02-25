import UIKit

final class MenuViewController: UIViewController, ViewSpecificController {

    //MARK: - Types

    typealias RootView = MenuRootView
    typealias DisplayModel = MenuRootView.DisplayModel

    //MARK: - Deps

    var presenter: MenuPresenter!

    //MARK: - Input

    func setDisplayModel(_ model: DisplayModel) {
        self.view().configure(model)
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
