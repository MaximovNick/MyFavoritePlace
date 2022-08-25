//
//  CustomTableViewCell.swift
//  MyFavoritePlace
//
//  Created by Nikolai Maksimov on 14.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var imagePlace: UIImageView! {
        didSet {
            imagePlace.layer.cornerRadius = imagePlace.frame.size.height / 2
            imagePlace.clipsToBounds = true
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
}
