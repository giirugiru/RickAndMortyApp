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
        makeVC(vc: CharactersVC(), title: "Characters", icon: UIImage(named: "ic_character_active")),
        makeVC(vc: LocationsVC(), title: "Locations", icon: UIImage(named: "ic_locations_active")),
        makeVC(vc: EpisodesVC(), title: "Episodes", icon: UIImage(named: "ic_episodes_active"))
        ], animated: true)
    }
    
    private func makeVC(vc: UIViewController, title: String, icon: UIImage? = nil, iconSelected: UIImage? = nil) -> UINavigationController {
        let vc = vc
        vc.title = title
        let nav = UINavigationController(rootViewController: vc)
        nav.navigationBar.prefersLargeTitles = true
        nav.tabBarItem = .init(title: title,
                               image: icon,
                               selectedImage: iconSelected)
        return nav
    }
}
