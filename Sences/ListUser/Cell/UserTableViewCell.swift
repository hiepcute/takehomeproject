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
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avataImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var linkedinLabel: UILabel!
    @IBOutlet weak var containerImageView: UIView!
    @IBOutlet weak var borderView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLinkedInprofile()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerView()
        setupContainerImageView()
        setupImageView()
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
    }
    
    private func setupContainerImageView() {
        containerImageView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerImageView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
    }
    
    private func setupImageView() {
        borderView.layer.borderWidth = 1
        borderView.clipsToBounds = true
        borderView.layer.borderColor = UIColor.black.cgColor
        avataImageView.contentMode = .scaleToFill
        borderView.layer.cornerRadius = borderView.frame.height/2
    }
    
    private func setupLinkedInprofile() {
        let text = "https://www.linkedin.com/"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: (text as NSString).range(of: text))
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: (text as NSString).range(of: text))
        linkedinLabel.attributedText = attributedString
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
