//
//  SecondViewController.swift
//  IntTejvir
//
//  Created by english on 2021-09-30.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblUsername: UILabel!
    
    public var data : String = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToThirdView"){
                    
                    //Creating a let to point ThirdView Conroller
                    let ThirdViewController = segue.destination as! ThirdViewController
                    
                    guard let email = lblUsername.text else {
                        return
                    }
                    ThirdViewController.data = email
                }
    }
    
    override func viewDidLoad() {
        lblUsername.text = data
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
