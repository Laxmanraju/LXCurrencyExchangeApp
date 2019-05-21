//
//  LXCustomTableViewCell.swift
//  LXSwensonHe
//
//  Created by laxman penmetsa on 5/16/19.
//  Copyright © 2019 com.laxman. All rights reserved.
//

import UIKit
import SDWebImage

class LXCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func confiugreForCode(_ code: String, rate: String) {
        let imageCode = code.prefix(2)
        let imageUrl = URL(string: String(format: LXSwensonContants.imageURL, imageCode as CVarArg))
        flagImageView.sd_setImage(with: imageUrl)
        nameLabel.text = code
        rateLabel.text = rate
    }
}
