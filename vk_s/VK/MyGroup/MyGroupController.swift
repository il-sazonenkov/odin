//
//  MyGroupController.swift
//  VK
//
//  Created by Илья on 13/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class MyGroupController: UITableViewController {
    

    @IBAction func addGroup(segue: UIStoryboardSegue) {
        //Проверяем индефикатор что бы убедиться что это нужный переход
        if segue.identifier == "addGroup" {
            //Получаем ссылку на контроллер с которого осуществлен переход
            guard let allGroupsController = segue.source as? AllGroupController else
            { return }
        
            
            //Получаем индекс выделенной ячейки
            if let indexPath = allGroupsController.tableView.indexPathForSelectedRow {
                //Получаем группу по индексу
                let group = allGroupsController.allMyGRP[indexPath.row]
                //Проверяем, что такой группы нет в списке
                for grp in myNewGRP {
                    if grp.nameGroup == group.nameGroup {
                        return
                    }
                }
                //Добавляем группу в список выбранных групп
                myNewGRP.append(group)
                //Обновляем таблицу
                tableView.reloadData()
                
            }
        }
    }

   
    var myNewGRP = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNewGRP.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupCell", for: indexPath) as! MyGroupCell
            //Получаем группу для конкретной строки
        let txtGroup = myNewGRP[indexPath.row]
        let imgGroup = myNewGRP[indexPath.row]
            //Устанавливаем группу в нашу ячейку
        cell.myGroupName.text = txtGroup.nameGroup
        cell.myGroupImage.image = imgGroup.avatarGroup
       
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Если была нажата кнопка "Удалить"
        if editingStyle == .delete {
            //Удаляем группу из массива
            myNewGRP.remove(at: indexPath.row)
            //И удалям строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
}
