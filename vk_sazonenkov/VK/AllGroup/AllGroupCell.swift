//
//  AllGroupCell.swift
//  VK
//
//  Created by Илья on 13/08/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class AllGroupCell: UITableViewCell {
    @IBOutlet weak var allGroupName: UILabel!
    @IBOutlet weak var allGroupImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
