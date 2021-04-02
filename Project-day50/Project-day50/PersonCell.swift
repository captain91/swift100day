//
//  PersonCell.swift
//  Project-day50
//
//  Created by Shibo Sun on 2021/4/2.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet var imageV: UIImageView!
    @IBOutlet var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
