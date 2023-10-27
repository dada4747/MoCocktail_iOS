//
//  ForgotPasswordViewModel.swift
//  MoCocktail
//
//  Created by Admin on 30/08/22.
//

import Foundation

struct ForgotPasswordViewModel: AuthenticationProtocol {
    var email : String? = ""
//    var password: String? = ""
    
    var isFormValid: Bool {
        return !email!.isValidEmail() == false
    }
}
