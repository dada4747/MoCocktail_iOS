//
//  LoginViewModel.swift
//  MoCocktail
//
//  Created by Admin on 29/08/22.
//

import Foundation

protocol AuthenticationProtocol {
    var isFormValid : Bool { get }
}

struct SignInViewModel: AuthenticationProtocol {
    var email : String? = ""
    var password: String? = ""
    
    var isFormValid: Bool {
        return !email!.isValidEmail() == false && !password!.isValidPassword() == false
    }
}
