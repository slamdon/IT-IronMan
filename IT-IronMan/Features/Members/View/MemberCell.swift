//
//  MemberCell.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class MemberCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var subscribeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var postCountLabel: UILabel!
    
    private var model:MemberModel?
    private var imageName:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func setupWithModel(_ model:MemberModel, imageName:String) {
        self.model = model
        self.imageName = imageName
        renderView()
    }
    
    private func renderView() {
        if imageName != nil {
            imageView.image = UIImage(named: imageName!)
        } else {
            imageView.image = UIImage(named: "bg-default-banner")
        }
        
        if let item = model {
            DispatchQueue.main.async { [unowned self] in
                self.subscribeLabel.text = "\(item.subscriberCount)"
                self.nameLabel.text = item.name
                self.subjectLabel.text = item.title
                self.postCountLabel.text = "\(item.postCount)"
            }
        }
    }
    
}
