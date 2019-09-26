//
//  AllGroupController.swift
//  VK
//
//  Created by Илья on 13/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class AllGroupController: UITableViewController {
    
    var allMyGRP: [Group] = groups
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllGroupCell", for: indexPath) as! AllGroupCell
            //Получаем группу для конкретной строки
        let group = groups[indexPath.row]
        //Устанавливаем группу в UILabel ячейки
        cell.allGroupName.text = group.nameGroup
        //Устанавливаем группу в UIImage ячейки
        cell.allGroupImage.image = group.avatarGroup
      
        return cell
    }
}
