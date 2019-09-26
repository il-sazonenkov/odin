//
//  LikesLike.swift
//  VK
//
//  Created by Илья on 01/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class LikesLike: UIView {
    
    @IBOutlet weak var likes: UIButton!
    var isLikes: Bool = true
    
    @IBOutlet weak var count: UILabel!
    var countLike = 0
    
    @IBAction func like(_ sender: UIButton) {
        
        if isLikes {
            isLikes = false
            sender.setImage(UIImage(named: "yes"), for: .normal)
            countLike += 1
            count.textColor = UIColor.red
            count.text = "\(countLike)"
        }
        else {
            isLikes = true
            sender.setImage(UIImage(named: "no"), for: .normal)
            countLike -= 1
            count.textColor = UIColor.black
            count.text = "\(countLike)"
            
        }
    }
}



