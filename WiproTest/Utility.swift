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
    
    
    static func showProgressView(view:UIView,title:String,detailstitle:String)
        
    {
//        let spinnerActivity = MBProgressHUD.showAdded(to:view, animated: true);
//        spinnerActivity?.labelText = title
//        spinnerActivity?.opacity = 0.5
//        spinnerActivity?.dimBackground = true
//        spinnerActivity?.cornerRadius = 7
//        spinnerActivity?.margin = 30
//        spinnerActivity?.detailsLabelText = detailstitle;
//        spinnerActivity?.detailsLabelFont = UIFont.boldSystemFont(ofSize: 15)
//        spinnerActivity?.isUserInteractionEnabled = false;
        }
    
    static func hideProgressView(view:UIView)
    {
//        MBProgressHUD.hideAllHUDs(for: view, animated: true);
    }
}
