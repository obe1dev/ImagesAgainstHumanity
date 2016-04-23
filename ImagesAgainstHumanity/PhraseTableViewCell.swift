//
//  PhraseTableViewCell.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/14/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class PhraseTableViewCell: UITableViewCell {

    @IBOutlet weak var phraseLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
