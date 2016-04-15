//
//  CaptionTableViewCell.swift
//  ImagesAgainstHumanity
//
//  Created by Brock Oberhansley on 3/7/16.
//  Copyright © 2016 Brock Oberhansley. All rights reserved.
//

import UIKit

class CaptionTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var captionText: UITextField!
    
    var cellDelegate = CaptionCellDelegate?()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.captionText.delegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let delegate = cellDelegate {
            delegate.cellTapped(self)
        }
        
        captionText.resignFirstResponder()
        return true
    }
    
    
}

//MARK: Delegate
protocol CaptionCellDelegate {
    func cellTapped(cell: CaptionTableViewCell)
}