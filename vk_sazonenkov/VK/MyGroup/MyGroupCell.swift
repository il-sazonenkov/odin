//
//  MyGroupCell.swift
//  VK
//
//  Created by Илья on 13/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class MyGroupCell: UITableViewCell {
    @IBOutlet weak var myGroupName: UILabel!
    @IBOutlet weak var myGroupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
