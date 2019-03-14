//
//  Utility.swift
//  WiproTest
//
//  Created by Susovan Pati - (Digital) on 14/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    
    
    static func showMessage(title: String, msg: String) {

        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
         topViewController()?.present(alert, animated:true, completion:nil)
        
    }
    
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }

}
