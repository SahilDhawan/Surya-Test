//
//  InitialViewController.swift
//  surya1
//
//  Created by Sahil Dhawan on 15/05/18.
//  Copyright © 2018 Sahil Dhawan. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    
    //MARK: Outlets
    let emailTextField = UITextField()
    let submitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }
    
    func setupSubViews(){
        setupEmailTextField()
        setupSubmitButton()
    }
    
    fileprivate func setupSubmitButton() {
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.frame.size = CGSize(width: 200, height: 40)
        submitButton.frame.origin = CGPoint(x: self.view.center.x - 100, y: 225)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        self.view.addSubview(submitButton)
    }
    
    fileprivate func setupEmailTextField() {
        emailTextField.frame.size = CGSize(width: Constants.frameWidth - 60 , height: 40)
        emailTextField.frame.origin = CGPoint(x: 30, y: 150)
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = UIColor.white
        emailTextField.textColor = UIColor.black
        emailTextField.delegate = self
        self.view.addSubview(emailTextField)
    }
    
    @objc func submitButtonTapped(){
        let userEmail = emailTextField.text!
        if userEmail != "" {
            if userEmail.contains("@") && userEmail.contains(".") {
                let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
                detailViewController.email = userEmail
                self.present(detailViewController, animated: true, completion: nil)
            } else {
                // not a valid email address
                self.showAlert(msg: "Please enter a valid email address!")
            }
        } else {
            // not a valid input
            self.showAlert(msg: "Textfield cannot be empty!")
        }
    }
}

//MARK: UITextFieldDelegate
extension InitialViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
