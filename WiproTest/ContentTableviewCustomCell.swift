//
//  ContentTableviewCustomCell.swift
//  WiproCodingTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import UIKit

class ContentTableviewCustomCell: UITableViewCell {
    
    @IBOutlet weak var titleLabelText: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellAttribute(modelValue:ContentDetailsModel)  {
//        titleImage.sd_setImage(with: URL(string:searchModel.thumnailImage ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
//        titleLabel.text = searchModel.title
//        descriptionLabel.text = searchModel.descriptionTitle
    }

}
