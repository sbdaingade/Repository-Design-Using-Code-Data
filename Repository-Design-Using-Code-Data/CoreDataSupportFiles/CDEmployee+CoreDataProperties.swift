//
//  CDEmployee+CoreDataProperties.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var profilePic: Data?

    
    func convertToEmployee() -> Employee {
        return Employee(id: self.id!, name: self.name, email: self.email, profilePic: self.profilePic)
    }
}

extension CDEmployee : Identifiable {

}
