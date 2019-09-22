//
//  MyFriendsViewController+UITableViewDataSource.swift
//  VK
//
//  Created by Илья on 06/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

extension MyFriendsViewController: UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

    //ПОИСК ПО ПЕРВЫМ БУКВАМ:
      func filterContentForSearchText(_ searchText: String) {
    
          filteredFriend = friends.filter({$0.nameFriend.lowercased().prefix(searchText.count) == searchText.lowercased()})
        
          tableView.reloadData()
      }
    
    //ПОИСК ПО ВСЕМ БУКВАМ:
  //  func filterContentForSearchText(_ searchText: String) {
  //
  //      filteredFriend = friends.filter({(friend: Friend) -> Bool in
  //          return friend.nameFriend.lowercased().contains(searchText.lowercased())
  //      })
  //      tableView.reloadData()
  //  }

    func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
        //return objectArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredFriend.count
        }
        return friends.count
        //return objectArray[section].sectionObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCustomCell") as! MyFriendsCustomCell
        var friend: Friend
        if isFiltering {
            friend = filteredFriend[indexPath.row]
        } else {
            friend = friends[indexPath.row]
        }
        
        //let friend = friends[indexPath.row]
        cell.friendsNameLabel.text = friend.nameFriend
        cell.friendsAvatarView.image = friend.avatarFriend
        
        return cell
    }
    
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderForMyFriendsCustomCell") as? HeaderForMyFriendsCustomCell else { return nil }
          view.FirstLetterNameLabel?.text = "hello"
 
      return view
  }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //let friend = friends[indexPath.row]
        let friendly: Friend
        if isFiltering {
            friendly = filteredFriend[indexPath.row]
        } else {
            friendly = friends[indexPath.row]
        }
       
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FriendsViewController") as! FriendsViewController
     
        vc.friend = friendly
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
