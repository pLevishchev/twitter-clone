//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Павел Левищев on 14.12.2020.
//

import UIKit

class MainTabController: UITabBarController {

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        view.backgroundColor = .systemPink
    }
    
    // MARK: - Helpers
    
    func configureViewControllers() {
        let feed = templateNavigationController(image: UIImage(named: "home_unselected"),
                                                rootVC: FeedController())
        let explore = templateNavigationController(image: UIImage(named: "search_unselected"),
                                                   rootVC: ExploreController())
        let notifications = templateNavigationController(image: UIImage(named: "like_unselected"),
                                                         rootVC: NotificationsController())
        let conversations = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"),
                                                         rootVC: ConversationsController())
        
        viewControllers = [feed, explore, notifications, conversations]
    }
    
    func templateNavigationController(image: UIImage?, rootVC: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootVC)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        return nav
    }

}
