//
//  RegisterViewController.swift
//  TestApp
//
//  Created by Eswar on 20/05/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet var txtRegEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnSignUp(_ sender: Any) {
        if (txtRegEmail.text != nil){
        if isValidEmail(testemail: txtRegEmail.text!) {
            if (txtPassword.text != nil) && (txtConfirmPassword.text != nil){
                let password = txtPassword.text?.lowercased()
                let ConfrmPassword = txtConfirmPassword.text?.lowercased()
                if password == ConfrmPassword{
                   
                    let dic = ["name":txtRegEmail.text,"password":txtPassword.text]
                      
                    DataController.shareInsatnce.save(object: dic as! [String : String])
                 
                    let RedisterVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                                self.addChild(RedisterVc)
                                self.view.addSubview((RedisterVc.view)!)
                                
                    if #available(iOS 13.0, *){
                                    
                        RedisterVc.modalPresentationStyle = .overFullScreen
                        
                    }
                    RedisterVc.didMove(toParent: self)

                }else{
                    let alert = UIAlertController(title: "Password Not Matching", message: "", preferredStyle: UIAlertController.Style.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
            
        }
        }
        
    }
        
    @IBAction func btnBack(_ sender: Any) {
       
        let RedisterVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.addChild(RedisterVc)
                    self.view.addSubview((RedisterVc.view)!)
                    
        if #available(iOS 13.0, *){
                        
            RedisterVc.modalPresentationStyle = .overFullScreen
            
        }
        RedisterVc.didMove(toParent: self)
    }
    func isValidEmail(testemail:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with:testemail)
        
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
