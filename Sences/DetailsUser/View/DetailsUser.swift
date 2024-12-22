//
//  DetailsUser.swift
//  TakeHome
//
//  Created by MACBOOK on 21/12/24.
//

import UIKit

class DetailsUser: UIView {
    
    @IBOutlet weak var avataImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerImageView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupContainerView()
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupContainerView()
        setupImageView()
        setupContainerImageView()
    }
    
    private func setupContainerView() {
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
        containerView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
    }
    
    private func setupImageView() {
        borderView.layer.borderWidth = 1
        borderView.clipsToBounds = true
        borderView.layer.borderColor = UIColor.black.cgColor
        avataImageView.contentMode = .scaleToFill
        borderView.layer.cornerRadius = borderView.frame.height/2
    }
    
    private func setupContainerImageView() {
        containerImageView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerImageView.layer.cornerRadius = 16
        containerImageView.layer.masksToBounds = true
    }
    
    private func commonInit() {
        guard let contentView = Bundle.main.loadNibNamed("DetailsUser", owner: self, options: nil)?.first as? UIView else {
            return
        }
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
    func setupView(model: UserDetailsViewModel) {
        if let url = URL(string: model.imageViewURL) {
            self.avataImageView.kf.setImage(with: url)
        } else {
            self.avataImageView.image = UIImage(systemName: "person")
        }
        userNameLabel.text = model.name
    }
    
    func setLocationValue(value: String) {
        self.locationLabel.text = value
    }
    
}
