//
//  ViewController.swift
//  LearnUIKit
//
//  Created by Duc Do on 20/03/2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }
    
    private func setupTabs() {
        let characterVC = CharacterViewController()
        let locationVC = LocationViewController()
        let episodeVC = EpisodeViewController()
        let settingVC = SettingViewController()
        
        let navCharacter = UINavigationController(rootViewController: characterVC)
        let navLocation = UINavigationController(rootViewController: locationVC)
        let navEpisode = UINavigationController(rootViewController: episodeVC)
        let navSetting = UINavigationController(rootViewController: settingVC)
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingVC.navigationItem.largeTitleDisplayMode = .automatic
        
        navCharacter.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        navLocation.tabBarItem = UITabBarItem(title: "Locatonis", image: UIImage(systemName: "globe"), tag: 2)
        navEpisode.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), tag: 3)
        navSetting.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "gear"), tag: 4)
        
        setViewControllers([navCharacter, navLocation, navEpisode, navSetting], animated: true)
    }
}
