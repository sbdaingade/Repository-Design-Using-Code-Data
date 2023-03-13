//
//  EmployeeManager.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import Foundation

struct EmployeeManager {
    private let employeeRepositoryData = EmployeeRepositoryData()
    
     func createEmployee(employee: Employee) {
        employeeRepositoryData.create(employee: employee)
    }

     func fetchEmployee() -> [Employee]? {
        return employeeRepositoryData.getAll()
    }

      func fetchEmployee(byIdentifier id: UUID) -> Employee?
    {
        return employeeRepositoryData.get(byIdentifier: id)
    }

     func updateEmployee(employee: Employee) -> Bool {
        return employeeRepositoryData.update(employee: employee)
    }

     func deleteEmployee(id: UUID) -> Bool {
        return employeeRepositoryData.delete(id: id)
    }
    
}
