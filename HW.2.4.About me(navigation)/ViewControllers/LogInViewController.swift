//
//  ViewController.swift
//  HW.2.4.About me(navigation)
//
//  Created by Sergey Yurtaev on 10.11.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: IB Outlet
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    // MARK: Private Properties
    private let userInfo = UserInfo.getUserInfo()
    
    // MARK: Ovveride Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // keyboard setting
        userNameTextField.keyboardAppearance = .dark
        passwordTextField.keyboardAppearance = .dark
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let startVC = tabBarController.viewControllers?.first as! StartViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let myFriendVC = navigationVC.topViewController as! MyFriendViewController
        startVC.userName = userInfo
        myFriendVC.userNameTwo = userInfo
    }
       
    // MARK: IB Actions
    @IBAction func logInButton() {
        guard
            userNameTextField.text == userInfo.userName,
            passwordTextField.text == userInfo.password
        else {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
   
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Oooops!",
                  message: "Your name is - \(userInfo.userName)")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Oooops!",
                  message: "Your password is - \(userInfo.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    deinit {
        print("LogInViewController has been dealocated")
    }
    
}

//MARK: - Alert Controller
extension LogInViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = nil }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension LogInViewController: UITextFieldDelegate {
    
    //Calls this function when the tap is recognized.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
}


