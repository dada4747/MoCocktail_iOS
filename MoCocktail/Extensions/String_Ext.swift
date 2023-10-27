//
//  String_Ext.swift
//  MoCocktail
//
//  Created by Admin on 29/08/22.
//

import Foundation
extension String {
    func isValidPhone() -> Bool {
        
        let phoneRegex = "[0-9]{5,16}$" //"^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    
    
    func isValidEmail() -> Bool {
        
        // create a regex string...
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        // create predicate with format matching your regex string...
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicateTest.evaluate(with: self)
    }
    func validateName(name: String) ->Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "^\\w{3,18}$"
          let trimmedString = name.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
          return isValidateName
       }
    
    func isValidPassword() -> Bool {
        let passWordRegEx = "^.{5,}$"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passWordRegEx)
        return passwordTest.evaluate(with: self)
    }
    func isValidInput() -> Bool {
        
        let nameRegex = "^[A-Za-z\\s]{2,18}$"//"\\A\\w{3,18}\\z"
        let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        return validateName.evaluate(with: self)
        
        //return Input.range(of: "\\A\\w{3,18}\\z", options: .regularExpression) != nil
    }
}
