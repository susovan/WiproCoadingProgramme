//
//  ContentTableviewCustomCell.swift
//  WiproCodingTest
//
//  Created by Susovan Pati - (Digital) on 13/03/19.
//  Copyright © 2019 Wipro Digital. All rights reserved.
//

import UIKit
import SDWebImage
class ContentTableviewCustomCell: UITableViewCell {
    
    
    
    
    
    @IBOutlet weak var transparentView: UIView!
    @IBOutlet weak var titleLabelText: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var descriptionText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.transparentView.layer.cornerRadius = 5
        self.transparentView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    /// func cellAttribute(): pass the *ContentDetailsModel* object  which update the tableview Cell.
    
    
    func cellAttribute(modelValue:ContentDetailsModel)  {
        
        titleImage.sd_setImage(with: URL(string:modelValue.imageHref ?? "" ), placeholderImage: UIImage(named: "flag_of_canada"))
        titleLabelText.text = modelValue.title
        descriptionText.text = modelValue.descriptionDetails
    }

}
