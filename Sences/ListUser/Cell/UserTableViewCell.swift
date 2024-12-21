//
//  UserTableViewCell.swift
//  TakeHome
//
//  Created by MACBOOK on 21/12/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avataImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var linkedinLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
