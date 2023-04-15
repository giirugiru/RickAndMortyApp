//
//  MainTabVC.swift
//  RickAndMortyApp
//
//  Created by Gilang-M1Pro on 15/04/23.
//

import UIKit

final class MainTabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setViewControllers([
        makeVC(vc: CharactersVC(), title: "Characters"),
        makeVC(vc: LocationsVC(), title: "Locations"),
        makeVC(vc: EpisodesVC(), title: "Episodes")
        ], animated: true)
    }
    
    private func makeVC(vc: UIViewController, title: String) -> UINavigationController {
        let vc = vc
        vc.title = title
        return UINavigationController(rootViewController: vc)
    }
}
