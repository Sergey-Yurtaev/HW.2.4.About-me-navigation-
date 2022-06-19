//
//  MyFriendViewController.swift
//  HW.2.4.About me(navigation)
//
//  Created by Sergey Yurtaev on 13.11.2021.
//

import UIKit

class MyFriendViewController: UIViewController {
    
    // MARK: IB Outlet
    @IBOutlet var userNameLabel: UILabel!
    
    // MARK: - Public properties
    var userNameTwo: UserInfo!
    
    // MARK: Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userNameTwo.userName
        title = userNameLabel.text
    }
    
    deinit {
        print("MyFriendViewController has been dealocated")
    }
}
