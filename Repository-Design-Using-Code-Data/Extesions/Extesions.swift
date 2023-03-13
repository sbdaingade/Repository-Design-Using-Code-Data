//
//  Extesions.swift
//  Repository-Design-Using-Code-Data
//
//  Created by Sachin Daingade on 13/03/23.
//

import Foundation

extension String{
    
    func isValidForType(type: Validation) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", type.description).evaluate(with: self)
    }
}

public enum Validation : CustomStringConvertible {
    case email
    case password
    case firstName
    case lastName
    
    public var description: String {
        switch self {
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .password:
            //small letter, capital letter, special case and number.
            return "(?=^.{8,16}$)(?=.*\\d)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$"
        case .firstName:
            return "^[a-zA-Z]{2,10}"
        case .lastName:
            return "^[a-zA-Z]{2,12}"
        }
    }
}
