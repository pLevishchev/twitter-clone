//
//  MainTabController.swift
//  TwitterClone
//
//  Created by Павел Левищев on 14.12.2020.
//

import UIKit

class MainTabController: UITabBarController {
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func actionButtonTapped() {
        print("tapped")
    }
     
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        
        let height: CGFloat = 56.0
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.rightAnchor,
                            paddingBottom: 64,
                            paddingRight: 16,
                            width: height,
                            height: height)
        actionButton.layer.cornerRadius = height / 2

    }
    
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
