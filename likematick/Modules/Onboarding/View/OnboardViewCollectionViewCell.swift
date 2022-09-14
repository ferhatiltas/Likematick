//
//  OnboardViewCollectionViewCell.swift
//  likematick
//
//  Created by ferhatiltas on 11.09.2022.
//

import UIKit

class OnboardViewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardViewCollectionViewCell.self)
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(_ onboardModel : OnboardModel) {
        descriptionLabel.sizeToFit()
        imageView.image = onboardModel.image
        titleLabel.text = onboardModel.title
        descriptionLabel.text = onboardModel.description
    }
}
