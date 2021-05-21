//
//  DataContoller.swift
//  TestApp
//
//  Created by Eswar on 20/05/21.
//

import Foundation
import CoreData
import UIKit
class DataController{
    
    static var shareInsatnce = DataController ()
 
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object : [String:String]){
    
        let UserDetails   = NSEntityDescription.insertNewObject(forEntityName: "Userinfo", into: context!) as? Userinfo
        UserDetails?.email = object["name"]
        UserDetails?.password = object["password"]

        do{
            try context?.save()
            print("Data Saved")
        }
        catch{
            print("Data Not Saved")
        }
    }
    
    var UserDb = [Userinfo]()

    func fetch() -> [Userinfo]{
        do{
//            UserDb = try context?.fetch(fetchRequest) as! [Userinfo]
            UserDb = try  context?.fetch(Userinfo.fetchRequest()) as! [Userinfo]

            print(UserDb)

        }
        catch{

        }
        return UserDb
    }
    
}
