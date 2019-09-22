//
//  FriendsViewController.swift
//  VK
//
//  Created by Илья on 14/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit
import Alamofire

class FriendsViewController: UICollectionViewController {
    
    var friend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FotoFriends", for: indexPath) as! FriendsViewCell
        
        let session = Session.instanceSession
        cell.myTokenLabel.text = "Мой токен: \(session.token)"
        cell.myIdLabel.text = "Мой id: \(session.userId)"
        //Устанавливаем в ячейку аватар для друга
        cell.fotoFriends.image = self.friend?.avatarFriend
      
        return cell
    }
}
