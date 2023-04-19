//
//  EpisodeTableViewCell.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import UIKit

struct EpisodeCellModel {
    var name: String
    var season: String
    var episode: String
    var airDate: String
}

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    
    public static let cellIdentifier = String(describing: EpisodeTableViewCell.self)
    
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
    
    public func updateData(model: EpisodeCellModel) {
        nameLabel.text = model.name
        seasonLabel.text = "Season: \(model.season)"
        episodeLabel.text = "Episode: \(model.episode)"
        airDateLabel.text = "Air Date:\n\(model.airDate)"
       
    }
    
}
