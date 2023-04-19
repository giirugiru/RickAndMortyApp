//
//  CharactersVC.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import UIKit

class CharactersVC: UIViewController {
    
    let vm = CharactersVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Characters"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: nil)
        setup()
    }
    
    private func setup() {
        vm.delegate = self
        vm.getCharacterList()
    }
}

extension CharactersVC: CharactersVMDelegate {
    func updateData() {
        print("DATA UPDATED")
    }
    
    func noticeError() {
        print("SOMETHING WRONG BRUH")
    }
}
