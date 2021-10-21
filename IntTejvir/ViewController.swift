//
//  ViewController.swift
//  IntTejvir
//
//  Created by Tejvir Dhami on 2021-09-30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var switchRememberUsername: UISwitch!
    
    @IBAction func txtChanged(_ sender: Any) {
        txtEmail.backgroundColor = UIColor.white
        txtPassword.backgroundColor = UIColor.white
    }
    
    
    @IBAction func btnLogin(_ sender: Any) {
        guard let email : String = txtEmail.text else {
            return
        }
        guard let password : String = txtPassword.text else {
            return
        }
        
        if(email.count == 0 || password.count == 0){
            txtEmail.backgroundColor = UIColor.cyan
            txtPassword.backgroundColor = UIColor.cyan
            return
        }
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ToSecondView"{
            
            guard let email : String = txtEmail.text else {
                return false
            }
            guard let password : String = txtPassword.text else {
                return false
            }
            
            if(email.count == 0 || password.count == 0){
                txtEmail.backgroundColor = UIColor.red
                txtPassword.backgroundColor = UIColor.red
                Toast.ok(view: self, title: "Information", message: "Kindly enter the username and password!", handler: nil)
                return false
            }
            if(email == "admin@int4fc.com" && password == "Lasalle2000"){
                return true
            }
            else
            {
                Toast.ok(view: self, title: "Information", message: "Incorrect username or password!", handler: nil)
                return false
            }
        }
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "ToSecondView"){
            
            //Creating a let to point SecondView Conroller
            let SecondViewController = segue.destination as! SecondViewController
            
            guard let email = txtEmail.text else {
                return
            }
            SecondViewController.data = email
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields();
        // Do any additional setup after loading the view.
        
        func getLastAccessCredentials(){
        /* This func handles the "remember me" option. It is using the UserInfo
        class to get the stored information. */
        let username = UserInfo.getUsername()
        if username.count > 0 {
            txtEmail.text = "admin@int4fc.com"
            switchRememberUsername.isOn = true
        } else {
        switchRememberUsername.isOn = false
        } }
        
        
        func setLastAccessCredentials(){
        /* This func handles the "remember me" option. It is using the UserInfo
        class to save the username (if switch is on) or clearing it (if switch
        is off). */
        if switchRememberUsername.isOn == true { UserInfo.setUsername(username: txtEmail.text!)
        } else { UserInfo.clearUsername()
        }
        }
        
    }
    
    func setupTextFields() {
               let toolbar = UIToolbar()
               let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                               target: nil, action: nil)
               let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                                target: self, action: #selector(doneButtonTapped))
               
               toolbar.setItems([flexSpace, doneButton], animated: true)
               toolbar.sizeToFit()
               
               txtEmail.inputAccessoryView = toolbar
               txtPassword.inputAccessoryView = toolbar
           }

       @objc func doneButtonTapped() {
           view.endEditing(true)
       }
    


}

