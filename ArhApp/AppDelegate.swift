import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?
    private lazy var appCoordinator: AppCoordinator = AppCoordinator(window: self.window)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        self.appCoordinator.start()

        return true
    }
}
