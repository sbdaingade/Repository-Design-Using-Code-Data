//
//  Employee.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import Foundation

/*
 @NSManaged public var email: String?
 @NSManaged public var id: UUID?
 @NSManaged public var name: String?
 @NSManaged public var profilePic: Data?
 */

struct Employee {
    let id: UUID
    let name: String?
    let email: String?
    let profilePic: Data?
}
