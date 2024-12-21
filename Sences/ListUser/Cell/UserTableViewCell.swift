//
//  UserTableViewCell.swift
//  TakeHome
//
//  Created by MACBOOK on 21/12/24.
//

import UIKit
import Kingfisher

class UserTableViewCell: UITableViewCell {
    
    static let identifier = "UserTableViewCell"
    
    @IBOutlet weak var avataImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var linkedinLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupData(model: UserCellModel) {
        if let url = URL(string: model.imageViewURL) {
            self.avataImageView.kf.setImage(with: url)
        } else {
            self.avataImageView.image = UIImage(systemName: "person")
        }
        userNameLabel.text = model.name
    }
    
    
}
