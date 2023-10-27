//
//  SignUpViewModel.swift
//  MoCocktail
//
//  Created by Admin on 29/08/22.
//

import Foundation

struct SignUpViewModel: AuthenticationProtocol {
    var name : String? = ""
    var email : String? = ""
    var password : String? = ""
    var confirmPassword : String? = ""
    var isCheckSelect : Bool? = false
    var isFormValid: Bool {
        return !name!.isValidInput() == false && !(email?.isValidEmail())! == false && !(password?.isValidPassword())! == false && !(confirmPassword == password) == false && isCheckSelect! == true
    }
}
