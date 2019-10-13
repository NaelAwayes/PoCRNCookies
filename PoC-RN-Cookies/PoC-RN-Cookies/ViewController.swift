//
//  ViewController.swift
//  PoC-RN-Cookies
//
//  Created by Nael Awayes on 10/10/2019.
//  Copyright © 2019 Nael Awayes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var callRequestButton: UIButton!
    @IBOutlet private weak var goToRNView: UIButton!

    var client = APIClient()

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

