//
//  UIViewcontroller+Properties.swift
//  Movies_RK
//
//  Created by Reus on 09/09/19.
//  Copyright © 2019 RK. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

extension UIViewController{
    
    
    func setCommonNavigationBar(title:String, largeTitle:Bool, tranpernt:Bool, tint: UIColor, fontColor: UIColor, bacKBg:Bool? = false, isPresent:Bool? = false, backhide:Bool? = false){
        
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title  = NSLocalizedString(title, comment: "")
        
        self.navigationController?.navigationBar.barTintColor = tint
        
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:fontColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
        
        self.navigationController?.navigationBar.prefersLargeTitles = largeTitle
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:fontColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 22.0)]
        
        
        if !backhide!{
            let backButton:UIBarButtonItem =  UIBarButtonItem(image: #imageLiteral(resourceName: "backWhite"), style: .plain, target: self, action: #selector(UIViewController.backTapped))
            backButton.tintColor = fontColor
            self.navigationItem.leftBarButtonItem = backButton
        }else{
            self.navigationItem.leftBarButtonItem = nil
        }
        
        
        self.navigationItem.hidesBackButton = true
        
        if tranpernt {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.view.backgroundColor = UIColor.clear
            self.navigationController?.navigationBar.isTranslucent = true
        }else{
            self.navigationController?.view.backgroundColor = tint
            self.navigationController?.navigationBar.isTranslucent = false
            
        }
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        
        // navigationItem.largeTitleDisplayMode = .never
        
        //  self.navigationController!.interactivePopGestureRecognizer!.delegate = self;
        
    }
    
    
    @objc func backTapped() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
}

public class Reachability {
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }
}
