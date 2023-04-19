//
//  LocationTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import UIKit

struct LocationCellModel {
    var name: String
    var type: String
    var dimension: String
}

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    public static let cellIdentifier = String(describing: LocationTableViewCell.self)
    
    public static func nib() -> UINib {
        return UINib(nibName: cellIdentifier, bundle: nil)
    }
    
    public static func nib() -> String {
        return cellIdentifier
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func updateData(model: LocationCellModel) {
        nameLabel.text = model.name
        typeLabel.text = model.type
        dimensionLabel.text = model.dimension
    }
}
