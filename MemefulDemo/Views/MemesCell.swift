//
//  MemsCell.swift
//  MemefulDemo
//
//  Created by SAURABH MISHRA on 17/04/20.
//  Copyright © 2020 SAURABH MISHRA. All rights reserved.
//

import UIKit
import SDWebImage

class MemesCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upVote: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
       super.awakeFromNib()
        containerView.layer.cornerRadius = 6
        containerView.layer.masksToBounds = true
     }

    var meme:Meme?{
      
        didSet{
            
        if let meme = meme{
            
            if let titletxt = meme.title{
                 title.text = titletxt
              }
            if let points = meme.points{
              upVote.text = "\(points)"
            }
          
            if let imgUrl = meme.images?.first?.link{
              imageView.sd_setImage(with: URL(string: imgUrl), completed: nil)
            }
           
            }
          
            
        }
    }
}
