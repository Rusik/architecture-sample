import UIKit

//MARK: -
protocol Configurable {
    associatedtype Model
    func configure(_ model: Model)
}

//MARK: -
protocol Tappable {}

extension Tappable {
    @discardableResult
    func tap(_ tap: (Self) -> Void) -> Self {
        tap(self)
        return self
    }
}

extension NSObject: Tappable {}

//MARK: -
extension UIViewController {
    func showSystemAlertWith(title: String?, message: String?, actionTitle: String?, action: ((UIAlertAction) -> Void)? = nil) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: actionTitle ?? "OK", style: .default, handler: action))
        present(alertVC, animated: true)
    }
}

//MARK: -
public protocol ViewSpecificController {
    associatedtype RootView: UIView
}

public extension ViewSpecificController where Self: UIViewController {
    func view() -> RootView {
        return self.view as! RootView
    }
}
