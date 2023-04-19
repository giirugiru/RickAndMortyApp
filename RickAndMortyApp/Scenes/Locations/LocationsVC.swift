//
//  LocationsVC.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import UIKit

class LocationsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let vm = LocationsVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Locations"
        setup()
        fetch()
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: LocationTableViewCell.nib(), bundle: nil),
            forCellReuseIdentifier: LocationTableViewCell.cellIdentifier)
        vm.delegate = self
    }
    
    private func fetch() {
        vm.getLocationList()
    }
}

extension LocationsVC: LocationsVMDelegate {
    func updateData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func noticeError() {
        
    }
}

extension LocationsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tableViewViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.cellIdentifier, for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        cell.updateData(model: vm.tableViewViewModel[indexPath.row])
        return cell
    }
}

