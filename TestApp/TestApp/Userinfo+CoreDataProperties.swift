//
//  Userinfo+CoreDataProperties.swift
//  TestApp
//
//  Created by Eswar on 20/05/21.
//
//

import Foundation
import CoreData


extension Userinfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Userinfo> {
        return NSFetchRequest<Userinfo>(entityName: "Userinfo")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var arrnames: [String]?

}

extension Userinfo : Identifiable {

}
