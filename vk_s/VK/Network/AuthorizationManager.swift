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
        //print(token ?? "token is empty")
        let myToken = Session.instanceSession
        myToken.token = token ?? "token is empty(ex)"
        print(myToken.token)
        
        decisionHandler(.cancel)
        
        //Получение списка друзей
        let urlFriendsList = "https://api.vk.com/method/friends.get"
               let idForRequest = Session.instanceSession.userId
               // параметры
               let parameters: Parameters = [
                   "user_id": idForRequest,
                   "order": "name",
                   "list_id": "",
                   "count": "3",
                   "offset": "5",
                   "fields": "city,domain",
                   "name_case": "nom",
                   "ref": "",
                   "access_token": myToken.token,
                   "v": "5.101"
               ]
        
        Alamofire.request(urlFriendsList, method: .get, parameters: parameters).responseJSON { repsonse in
                   print(repsonse.value ?? "value is empty")
                
          //Получение фотографий
                let urlPhotos = "https://api.vk.com/method/photos.get"
                             let parameters: Parameters = [
                                 "owner_id": idForRequest,
                                 "album_id": "profile",
                                 "photo_ids": "",
                                 "rev": "0",
                                 "extended": "0",
                                 "feed_type": "photo",
                                 "feed": "",
                                 "photo_sizes": "0",
                                 "offset": "",
                                 "count": "2",
                                 "access_token": myToken.token,
                                 "v": "5.101"
                             ]
                      
                             Alamofire.request(urlPhotos, method: .get, parameters: parameters).responseJSON { repsonse in
                                 print(repsonse.value ?? "value is empty")
                                
            //Получение групп текущего пользователя
                let urlGroups = "https://api.vk.com/method/groups.get"
                            let parameters: Parameters = [
                                "user_id": idForRequest,
                                "extended": "1",
                                "filter": "",
                                "fields": "description, type, name",
                                "offset": "",
                                "count": "3",
                                "access_token": myToken.token,
                                "v": "5.101"
                            ]
                            Alamofire.request(urlGroups, method: .get, parameters: parameters).responseJSON { repsonse in
                            print(repsonse.value ?? "value is empty")
                                
                //Получение групп по поисковому запросу
                let urlSearchGroups = "https://api.vk.com/method/groups.search"
                //Текст запроса
                let SearchGroup: String = "Music"
                let SearchGroupCountry: String = ""
                let SearchGroupCity: String = ""
                            let parameters: Parameters = [
                                "q": SearchGroup,
                                "type": SearchGroupCountry,
                                "country_id": SearchGroupCity,
                                "future": "",
                                "market": "",
                                "sort": "",
                                "offset": "3",
                                "count": "3",
                                "access_token": myToken.token,
                                "v": "5.101"
                            ]
                            Alamofire.request(urlSearchGroups, method: .get, parameters: parameters).responseJSON { repsonse in
                            print(repsonse.value ?? "value is empty")
                                }
                                }
                }
        }
    }
}
