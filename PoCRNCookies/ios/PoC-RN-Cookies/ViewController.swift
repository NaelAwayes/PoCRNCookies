//
//  ViewController.swift
//  PoC-RN-Cookies
//
//  Created by Nael Awayes on 10/10/2019.
//  Copyright © 2019 Nael Awayes. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    @IBOutlet private weak var callRequestButton: UIButton!
    @IBOutlet private weak var goToRNView: UIButton!

    var client = APIClient()

    
    @IBAction func navigateToRCT(_ sender: Any) {
        NSLog("Hello")
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "RNRequest",
            initialProperties: nil,
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        self.show(vc, sender: nil)
    }
    
    @IBAction func callRequest(_ sender: Any) {
        client.getPosts()
    }
    
    @IBAction func showCookies(_ sender: Any) {
        var cookie = HTTPCookieStorage.shared.cookies
        dump(cookie)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

