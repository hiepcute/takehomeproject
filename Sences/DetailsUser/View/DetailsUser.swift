//
//  DetailsUser.swift
//  TakeHome
//
//  Created by MACBOOK on 21/12/24.
//

import UIKit

class DetailsUser: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        guard let contentView = Bundle.main.loadNibNamed("DetailsUser", owner: self, options: nil)?.first as? UIView else {
            return
        }
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
}
