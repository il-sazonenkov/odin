//
//  AuthorizationManager.swift
//  VK
//
//  Created by Илья on 19/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//
import Foundation
import UIKit
import WebKit
import Alamofire

extension VKLoginFormConroller: WKNavigationDelegate {
    
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
            let fragment = url.fragment else {
                decisionHandler(.allow)
                return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce ([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let token = params["access_token"]
        print(token ?? "token is empty")
        let myToken = Session.instanceSession
        myToken.token = token ?? "token is empty(ex)"
        
        
        decisionHandler(.cancel)
    }
}
