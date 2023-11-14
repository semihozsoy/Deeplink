# Deeplink

# Usage
We are going to use deeplink manager in the AppDelegate
```swift
@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var deeplinkManager: DeeplinkManager!
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        deeplinkManager = DeeplinkManager(supportedLinks: [CustomerLink()])
    }
    @discardableResult func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        if let link = deeplinkManager.getLinkable(url) {
            link.link(from: self)
            return true
        }
    }
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        if let link = deeplinkManager.getLinkable(payload: response.notification.request.content.userInfo) {
            link.link(from: self)
        }

        completionHandler()
    }
}
extension AppDelegate: CustomerLinkRoutable {
    public func customerLinkRoute(_ link: CustomerLink) {
        // Route to customer detail with the attributes of `link`.
    }
}
```
