//
//  EmployeeRepositoryData.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import Foundation
import CoreData

struct EmployeeRepositoryData : EmployeeRepositoryProtocol {
    
    func create(employee: Employee) {
        let cdEmployee = CDEmployee(context: PersistentStorage.shared.context)
        cdEmployee.id = employee.id
        cdEmployee.email = employee.email
        cdEmployee.name = employee.name
        cdEmployee.profilePic = employee.profilePic
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Employee]? {
        var allEmployees = [Employee]()
        
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDEmployee.self)
        
        result?.forEach({ cdEmployee in
            allEmployees.append(cdEmployee.convertToEmployee())
        })
        
        return allEmployees
    }
    
    func get(byIdentifier id: UUID) -> Employee? {
        
        let result = getCDEmployee(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToEmployee()
    }
    
    func update(employee: Employee) -> Bool {
        
        let cdEmployee = getCDEmployee(byIdentifier: employee.id)
        guard cdEmployee != nil else {return false}
        
        cdEmployee?.email = employee.email
        cdEmployee?.name = employee.name
        cdEmployee?.profilePic = employee.profilePic
        
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(id: UUID) -> Bool {
        
        let cdEmployee = getCDEmployee(byIdentifier: id)
        guard cdEmployee != nil else {return false}
        
        PersistentStorage.shared.context.delete(cdEmployee!)
        PersistentStorage.shared.saveContext()
        return true
    }
    
    
    
    private func getCDEmployee(byIdentifier id: UUID) -> CDEmployee?
    {
        let fetchRequest = NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            
            guard result != nil else {return nil}
            
            return result
            
        } catch let error {
            debugPrint(error)
        }
        
        return nil
    }
    
}
