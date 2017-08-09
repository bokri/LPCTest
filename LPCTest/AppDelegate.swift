import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    // Set navigation bar color
    
    let navigationBarAppearace = UINavigationBar.appearance()
    navigationBarAppearace.isTranslucent = true
    navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: ColorName.black.color]
    navigationBarAppearace.barTintColor = ColorName.purple.color

    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
  }

  func applicationWillTerminate(_ application: UIApplication) {
  }


}

