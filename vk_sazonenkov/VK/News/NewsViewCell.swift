//
//  NewsViewCell.swift
//  VK
//
//  Created by Илья on 07/09/2019.
//  Copyright © 2019 Ilya Sazonenkov. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsFoto: UIImageView!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsOptions: UIView!
    
    @IBOutlet weak var newsLikesButton: UIButton!
    var newsLikes: Bool = true
    @IBOutlet weak var newsLikesCountLabel: UILabel!
    var newsLikesCount: Int = 0
    @IBOutlet weak var newsCommentButton: UIButton!
    var newsComment: Bool = true
    @IBOutlet weak var newsShareButton: UIButton!
    var newsShare: Bool = true
    @IBOutlet weak var newsEyeButton: UIButton!
    var newsEye: Bool = true
    @IBOutlet weak var newsEyeCountLabel: UILabel!
    var newsEyeCount: Int = 0
  
    
    @IBAction func goRepost(_ sender: UIButton) {
        print("Cделан репост")
    }
    @IBAction func goComment(_ sender: UIButton) {
        print("Комментарий оставлен")
    }
    @IBAction func likeForLike(_ sender: UIButton) {
        
        if newsLikes {
            newsLikes = false
            sender.setImage(UIImage(named: "yes"), for: .normal)
            newsLikesCount += 1
            newsLikesCountLabel.textColor = UIColor.red
            newsLikesCountLabel.text = "\(newsLikesCount)"
        }
        else {
            newsLikes = true
            sender.setImage(UIImage(named: "no"), for: .normal)
            newsLikesCount -= 1
            newsLikesCountLabel.textColor = UIColor.black
            newsLikesCountLabel.text = "\(newsLikesCount)"
        }
    }
    
 override func prepareForReuse() {
    super.prepareForReuse()
    newsTitle.text = nil
    newsFoto.image = nil
    newsText.text = nil
    //newsLikes.self = true

 }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setupCellFromNews(_ news: News) {
        self.newsTitle.text = news.titleNews
        self.newsFoto.image = news.fotoNews
        self.newsText.text = news.textNews
    }
}
