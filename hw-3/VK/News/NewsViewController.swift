//
//  NewsViewController.swift
//  VK
//
//  Created by Илья on 07/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var allNews: [News] = allMyNews
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsViewCell", bundle: nil), forCellReuseIdentifier: "NewsViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.rowHeight = 400

    }
    
}
