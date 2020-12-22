//
//  NotificationsController.swift
//  TwitterClone
//
//  Created by Павел Левищев on 14.12.2020.
//

import UIKit

class NotificationsController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
    }
}
