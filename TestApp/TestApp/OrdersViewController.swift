//
//  OrdersViewController.swift
//  TestApp
//
//  Created by Eswar on 20/05/21.
//

import UIKit

class OrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    var arrOrderId = ["1111","2222","3333","4444"]
    var arrName = ["A","B","C","D"]
    var arrPhone = ["9999999999","8888888888","7777777777","6666666666"]
    var arrDueDate = ["12-12-2000","12-12-2000","12-12-2000","12-12-2000"]
    var arrOrderTotal = ["$100","$200","$300","$400"]
    var arrAddress = ["Street","Sector","Area","Road"]
    var Sel:Int = 0

    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext

        
    @IBOutlet var NavBar: UINavigationBar!
    @IBOutlet var tabelView: UITableView!
    @IBOutlet var vwAddorEdit: UIView!
    @IBOutlet var txtOrdetNum: UITextField!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtPhone: UITextField!
    @IBOutlet var txtAddress: UITextField!
    @IBOutlet var txtOrderTotal: UITextField!
    @IBOutlet var txtDueDate: UITextField!
    var vwDim = UIView()
  
//    var Datapass:Userinfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        employe = DataManger.shareInsatnce.fetch()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 135
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOrderId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.lblOrderNumber.text = "OrderID : "+arrOrderId[indexPath.row]
        cell.lblCustomerName.text = "Name : "+arrName[indexPath.row]
        cell.lblCustomerPhone.text = "Phone : "+arrPhone[indexPath.row]
        cell.lblOrderTotal.text = "OrderTotal : "+arrOrderTotal[indexPath.row]
        cell.lblOrderDueDate.text = "Date : "+arrDueDate[indexPath.row]
        cell.lblCustomerAddress.text = "Address : "+arrAddress[indexPath.row]

    return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        txtOrdetNum.text = arrOrderId[indexPath.row]
        txtName.text = arrName[indexPath.row]
        txtPhone.text = arrPhone[indexPath.row]
        txtDueDate.text = arrDueDate[indexPath.row]
        txtOrderTotal.text = arrOrderTotal[indexPath.row]
        txtAddress.text = arrAddress[indexPath.row]

        Sel = indexPath.row
        
        NavBar.topItem?.title = "Edit"

        vwDim = UIView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height))
        vwDim.backgroundColor = UIColorFromHex(rgbValue:0x696969, alpha: 0.5)
        self.view.addSubview(vwDim)
        
        vwAddorEdit.frame=CGRect(x: 20, y: (view.frame.size.height-350)/2, width: (view.frame.size.width-40), height: 350)
        
        vwDim.addSubview(vwAddorEdit)

    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            arrName.remove(at: indexPath.row)
            arrPhone.remove(at: indexPath.row)
            arrOrderId.remove(at: indexPath.row)
            arrAddress.remove(at: indexPath.row)
            arrDueDate.remove(at: indexPath.row)
            arrOrderTotal.remove(at: indexPath.row)

            tableView.reloadData()
        }
    }
    @IBAction func btnAddNewOrder(_ sender: Any) {
        
        txtName.text=""
        txtPhone.text=""
        txtAddress.text=""
        txtOrderTotal.text=""
        txtDueDate.text=""
        txtOrdetNum.text=""
        NavBar.topItem?.title = "Add New Order"

        vwDim = UIView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height))
        vwDim.backgroundColor = UIColorFromHex(rgbValue:0x696969, alpha: 0.5)
        self.view.addSubview(vwDim)
        
        vwAddorEdit.frame=CGRect(x: 20, y: (view.frame.size.height-350)/2, width: (view.frame.size.width-40), height: 350)
        
        vwDim.addSubview(vwAddorEdit)

        
        
    }
    
    @IBAction func btnSave(_ sender: Any) {
       
        if NavBar.topItem?.title == "Edit"{
           
            arrName[Sel] = txtName.text!
            arrOrderId[Sel] = txtOrdetNum.text!
            arrPhone[Sel] = txtPhone.text!
            arrAddress[Sel] = txtAddress.text!
            arrDueDate[Sel] = txtDueDate.text!
            arrOrderTotal[Sel] = txtOrderTotal.text!

            let alert = UIAlertController(title: "Successfully Updated", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }else{
        arrName.append(txtName.text!)
        arrOrderId.append(txtOrdetNum.text!)
        arrPhone.append(txtName.text!)
        arrAddress.append(txtName.text!)
        arrDueDate.append(txtName.text!)
        arrOrderTotal.append("$"+txtOrderTotal.text!)
            
            let alert = UIAlertController(title: "Successfully Added", message: "", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

    }
      
        tabelView.reloadData()
        txtName.text=""
        txtPhone.text=""
        txtAddress.text=""
        txtOrderTotal.text=""
        txtDueDate.text=""
        txtOrdetNum.text=""
        vwDim .removeFromSuperview()
        vwAddorEdit.removeFromSuperview()

        
//        Datapass?.arrnames = arrName
//        do{
//            try context?.save()
//            print("Data Saved")
//        }
//        catch{
//            print("Data Not Saved")
//        }
//        var Det = [Userinfo]()
//
//        Det = DataController.shareInsatnce.fetch()

        return
    }
    
    @IBAction func btnClosePopUp(_ sender: Any) {

        vwDim .removeFromSuperview()
        vwAddorEdit.removeFromSuperview()
    }
    
    @IBAction func btnSignOut(_ sender: Any) {
        let RedisterVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                    self.addChild(RedisterVc)
                    self.view.addSubview((RedisterVc.view)!)
                    
        if #available(iOS 13.0, *){
                        
            RedisterVc.modalPresentationStyle = .overFullScreen
            
        }
        RedisterVc.didMove(toParent: self)
        UserDefaults.standard.removeObject(forKey: "Email")

    }
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
}
