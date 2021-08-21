//
//  ViewController.swift
//  ExampleAlamofirePulse
//
//  Created by Bagus andinata on 21/08/21.
//

import UIKit
import PulseUI
import Alamofire

class ViewController: UIViewController {
    
    let provider = ExampleProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: URL(string: "https://reqres.in/api/products/3")!) as URLRequestConvertible

        provider.request(request)
            .responseJSON { result in
                debugPrint(result)
            }
    }
}

extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let vc = MainViewController(store: .default)
            UIApplication.shared.windows.first?.rootViewController?.present(vc, animated: true)
        }
    }
}
