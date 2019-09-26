//
//  VKLoginFormConroller.swift
//  VK
//
//  Created by Илья on 19/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//
import Foundation
import UIKit
import WebKit
import Alamofire

class VKLoginFormConroller: UIViewController {

    
    @IBOutlet weak var wkview: WKWebView! {
        didSet {
            wkview.navigationDelegate = self
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создаем экземпляр сервиса
       //let weatherService = WeatherService()
  
        
        //отправим запрос для получения погоды для Москвы
       //weatherService.loadWeatherData(city: "Moscow")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7140314"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        wkview.load(request)

    }
}

