//
//  NewsViewController+UITableViewDataSource.swift
//  VK
//
//  Created by Илья on 07/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allMyNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewCell") as! NewsViewCell
        cell.setupCellFromNews(allMyNews[indexPath.row])
        return cell
    }
}
