//
//  CharacterDetailVC.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 19/04/23.
//

import UIKit
import Kingfisher

struct CharacterDetailVCModel {
    let name: String
    let imageUrl: String
    let status: String
    let gender: String
    let species: String
    let created: String
    let origin: String
    let location: String
    let episode: [String]
}

class CharacterDetailVC: UIViewController {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var dateCreatedLabel: UILabel!
    
    var vm = CharacterDetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetch()
    }

    private func setup() {
        vm.delegate = self
        self.navigationItem.largeTitleDisplayMode = .never
        characterImage.layer.cornerRadius = 20
        characterImage.contentMode = .scaleAspectFill
    }
    
    private func fetch() {
        vm.getCharacterDetail()
    }
}

extension CharacterDetailVC: CharacterDetailVMDelegate {
    func updateData(model: CharacterDetailVCModel) {
        self.title = model.name
        self.nameLabel.text = model.name
        if let url = URL(string: model.imageUrl) {
            self.characterImage.kf.setImage(with: url)
        }
        self.statusLabel.text = "Status: \(model.status)"
        self.genderLabel.text = "Gender: \(model.gender)"
        self.speciesLabel.text = "Species: \(model.species)"
        self.dateCreatedLabel.text = "Created\n\(model.created)"
    }
    
    func noticeError(error: Error) {
        makeToast(error: error)
    }
}
