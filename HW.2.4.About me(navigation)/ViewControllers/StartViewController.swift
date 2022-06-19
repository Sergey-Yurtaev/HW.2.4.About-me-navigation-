//
//  StartViewController.swift
//  HW.2.4.About me(navigation)
//
//  Created by Sergey Yurtaev on 12.11.2021.
//

import UIKit

class StartViewController: UIViewController {
    
    // MARK: IB Outlet
    @IBOutlet var exitButtonOutlet: UIButton!
    @IBOutlet var userNameLabel: UILabel!
    
    // MARK: - Public properties
    var userName: UserInfo!
    
    // MARK: - Private properties
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    // MARK: Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        exitButtonOutlet.layer.cornerRadius = 8
        userNameLabel.text = "Welcome, \(userName.userName)"
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
    }
    
    deinit {
        print("StartViewController has been dealocated")
    }

}

// MARK: - Set background color
extension StartViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}

