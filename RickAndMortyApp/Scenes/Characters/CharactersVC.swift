//
//  CharactersVC.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import UIKit

class CharactersVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let vm = CharactersVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Characters"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: nil)
        setup()
    }
    
    private func setup() {
        collectionView.register(UINib(nibName: CharacterCollectionViewCell.nib(), bundle: nil), forCellWithReuseIdentifier: CharacterCollectionViewCell.cellIdentifier)

        vm.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        vm.getCharacterList()
    }
}

extension CharactersVC: CharactersVMDelegate {
    func updateData() {
        print("DATA UPDATED")
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func noticeError() {
        print("SOMETHING WRONG BRUH")
    }
}

extension CharactersVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
        let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
        let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
        return CGSize(width: size, height: size)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.collectionViewModel.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.cellIdentifier, for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        cell.updateData(model: vm.collectionViewModel[indexPath.row])
        cell.backgroundColor = UIColor.red
        return cell
    }
}
