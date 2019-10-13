//
//  APIService.swift
//  PoC-RN-Cookies
//
//  Created by Nael Awayes on 10/10/2019.
//  Copyright © 2019 Nael Awayes. All rights reserved.
//

import Moya

enum APIService {
    case posts
}

extension APIService: TargetType {
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }

    var path: String {
        switch self {
        case .posts:
            return "/posts/"
        }
    }

    var method: Method {
        switch self {
        case .posts:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .posts:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }


}
