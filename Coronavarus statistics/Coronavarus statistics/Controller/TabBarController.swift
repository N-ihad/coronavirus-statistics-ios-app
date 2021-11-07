//
//  MainTabController.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
    }

    private func setup() {
        let overviewNavigationController = UINavigationController(rootViewController: OverviewVC())
        overviewNavigationController.title = "Overview"
        overviewNavigationController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")
        overviewNavigationController.navigationBar.barTintColor = .white
        
        let byCountryNavigationController = UINavigationController(rootViewController: ByCountryVC())
        byCountryNavigationController.title = "By country"
        byCountryNavigationController.tabBarItem.image = UIImage(systemName: "globe")
        byCountryNavigationController.navigationBar.barTintColor = .white
        
        viewControllers = [overviewNavigationController, byCountryNavigationController]
    }

    private func style() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black

        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().tintColor = .black
    }
}
