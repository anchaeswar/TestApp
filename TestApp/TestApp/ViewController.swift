//
//  ViewController.swift
//  TestApp
//
//  Created by Eswar on 20/05/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnRemeber: UIButton!

    var Checked : Bool = false
    var UserDetaisl = [Userinfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let myString = UserDefaults.standard.string(forKey: "Email")

        if myString != nil{
        
            let ListViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
                        self.addChild(ListViewController)
                        self.view.addSubview((ListViewController.view)!)
                        
            if #available(iOS 13.0, *){
                            
                ListViewController.modalPresentationStyle = .overFullScreen
                
            }
            ListViewController.didMove(toParent: self)
        }
               
        UserDetaisl = DataController.shareInsatnce.fetch()
    }
    
    func isValidEmail(testemail:String) -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with:testemail)
        
    }

    @IBAction func btnRegister(_ sender: Any) {
        let RedisterVc = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
                    self.addChild(RedisterVc)
                    self.view.addSubview((RedisterVc.view)!)
                    
        if #available(iOS 13.0, *){
                        
            RedisterVc.modalPresentationStyle = .overFullScreen
            
        }
        RedisterVc.didMove(toParent: self)

    }
    
    
    @IBAction func btnRemeberMe(_ sender: Any) {

        if !(Checked){
        UserDefaults.standard.set(txtEmail.text, forKey:"Email")
            Checked = true
        btnRemeber.setImage(UIImage(named: "checkbox_check.png"), for: .normal)
        }
        else {
            btnRemeber.setImage(UIImage(named: "checkbox_uncheck.png"), for: .normal)
            Checked = false
        }
    }
    
    @IBAction func LogIN(_ sender: Any) {
        if (txtEmail.text == "") && (txtPassword.text == "") {
            let alert = UIAlertController(title: "Please Enter Login Details", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }

        if (txtEmail.text != nil){
        if isValidEmail(testemail: txtEmail.text!) {
            if (txtPassword.text == ""){
                let alert = UIAlertController(title: "Please Enter Password", message: "", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let ListViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrdersViewController") as! OrdersViewController
                                self.addChild(ListViewController)
                                self.view.addSubview((ListViewController.view)!)
                    if #available(iOS 13.0, *){
                        ListViewController.modalPresentationStyle = .overFullScreen
                    }
                    ListViewController.didMove(toParent: self)
            
        }else
        {
            let alert = UIAlertController(title: "Please Enter Valied EmailId", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        }
        
    }
    
}



