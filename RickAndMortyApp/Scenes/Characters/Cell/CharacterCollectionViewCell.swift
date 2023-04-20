//
//  CharacterCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import UIKit
import Kingfisher

struct CharacterCellModel {
    var imageUrl: String
    var name: String
    var species: String
}

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    public static let cellIdentifier = String(describing: CharacterCollectionViewCell.self)
    
    public static func nib() -> UINib {
        return UINib(nibName: cellIdentifier, bundle: nil)
    }
    
    public static func nib() -> String {
        return cellIdentifier
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 20
        bgView.backgroundColor = .systemGray5
    }
    
    public func updateData(model: CharacterCellModel) {
        nameLabel.text = model.name
        speciesLabel.text = model.species
        if let url = URL(string: model.imageUrl) {
            imageView.kf.setImage(with: url)
        }
    }
}
