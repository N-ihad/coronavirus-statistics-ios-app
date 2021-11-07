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
        let summaryNavigationController = UINavigationController(rootViewController: SummaryViewController())
        summaryNavigationController.title = "Summary"
        summaryNavigationController.tabBarItem.image = .summaryTabBarIcon
        summaryNavigationController.navigationBar.barTintColor = .white
        
        let byCountryNavigationController = UINavigationController(rootViewController: ByCountryViewController())
        byCountryNavigationController.title = "By country"
        byCountryNavigationController.tabBarItem.image = .byCountryTabBarIcon
        byCountryNavigationController.navigationBar.barTintColor = .white
        
        viewControllers = [summaryNavigationController, byCountryNavigationController]
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
