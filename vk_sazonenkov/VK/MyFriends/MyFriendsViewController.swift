//
//  MyFriendsViewController.swift
//  VK
//
//  Created by Илья on 14/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class MyFriendsViewController: UIViewController {
   
   // var allMyFriends = ["В": ["Вакуленко Василий"], "К": ["Каргинов Тимур", "Комаров Виктор"], "Н": //["Навальный Алексей"], "С": ["Светлаков Сергей", "Слепаков Семён", "Собчак Ксения"], "Х": //["Харламов Гарик", "Хрусталёв Владимир"]]
   //
   //
   // var objectArray = [Objects]()
    
    var filteredFriend = [Friend]()
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
     //   let sortedFriends = allMyFriends.sorted { $0.0 < $1.0 }
     //   for (key, value) in sortedFriends {
     //       print("\(key) -> (\(value)")
     //       objectArray.append(Objects(sectionName: key, sectionObjects: value))
     //   }
    
        
        tableView.register(UINib(nibName: "MyFriendsCustomCell", bundle: nil), forCellReuseIdentifier: "MyFriendsCustomCell")
         tableView.register(UINib(nibName: "HeaderForMyFriendsCustomCell", bundle: nil),        forHeaderFooterViewReuseIdentifier: "HeaderForMyFriendsCustomCell")
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 75
    }
}
