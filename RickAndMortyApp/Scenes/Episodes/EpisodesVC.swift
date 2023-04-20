//
//  EpisodesVC.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import UIKit

class EpisodesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let vm = EpisodesVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Episodes"

        setup()
        fetch()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: EpisodeTableViewCell.nib(), bundle: nil),
            forCellReuseIdentifier: EpisodeTableViewCell.cellIdentifier)
        vm.delegate = self
    }
    
    private func fetch() {
        vm.getEpisodeList()
    }
}

extension EpisodesVC: EpisodesVMDelegate {
    func updateData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func noticeError(error: Error) {
        makeToast(error: error)
    }
}

extension EpisodesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tableViewViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.cellIdentifier, for: indexPath) as? EpisodeTableViewCell else { return UITableViewCell() }
        cell.updateData(model: vm.tableViewViewModel[indexPath.row])
        return cell
    }
}
