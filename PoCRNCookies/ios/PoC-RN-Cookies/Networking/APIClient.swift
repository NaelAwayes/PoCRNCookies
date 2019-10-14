//
//  APIClient.swift
//  PoC-RN-Cookies
//
//  Created by Nael Awayes on 10/10/2019.
//  Copyright © 2019 Nael Awayes. All rights reserved.
//

import Moya

class APIClient {
    var provider = MoyaProvider<APIService>(plugins: [NetworkLoggerPlugin()])


    func getPosts() {
        provider.request(.posts) { (result) in
            return
        }
    }
}
