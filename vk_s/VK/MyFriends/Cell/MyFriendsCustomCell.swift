//
//  MyFriendsCustomCell.swift
//  VK
//
//  Created by Илья on 06/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class MyFriendsCustomCell: UITableViewCell {

    @IBOutlet weak var friendsAvatarView: UIImageView!
    @IBOutlet weak var friendsNameLabel: UILabel!
    @IBOutlet weak var friendsBackLabel: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
//  override func prepareForReuse() {
//      friendsNameLabel.text = nil
//      friendsAvatarView.image = nil
//
//  }
    
    func setupCellFromFriends(_ friend: Friend) {
        
        self.friendsAvatarView.image = friend.avatarFriend
        self.friendsNameLabel.text = friend.nameFriend
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        friendsAvatarView.layer.borderWidth = 2
        friendsAvatarView.layer.borderColor = UIColor.black.cgColor
        friendsAvatarView.layer.cornerRadius = friendsAvatarView.bounds.height / 2
        
        friendsBackLabel.layer.borderWidth = 2
        friendsBackLabel.layer.borderColor = UIColor.black.cgColor
        friendsBackLabel.layer.cornerRadius = friendsBackLabel.bounds.height / 2
        friendsBackLabel.layer.shadowOffset = CGSize(width: 5, height: 3)
        friendsBackLabel.layer.shadowOpacity = 0.6
        friendsBackLabel.layer.shadowRadius = 1.9
        friendsBackLabel.layer.shadowColor = UIColor.black.cgColor
        friendsBackLabel.layer.masksToBounds = false
    }
}
