//
//  EmployeeRepository.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import Foundation
import CoreData


protocol EmployeeRepositoryProtocol {
    func create(employee: Employee)
    func getAll() -> [Employee]?
    func get(byIdentifier id: UUID) -> Employee?
    func update(employee: Employee) -> Bool
    func delete(id: UUID) -> Bool
}
