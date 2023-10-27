//
//  constants.swift
//  MoCocktail
//
//  Created by Admin on 10/08/22.
//

import UIKit
// MARK: - Colors
struct AppColors {
    static var appBlack                 = UIColor(hexString: "#000000")
    static var appGray1                 = UIColor(hexString: "#484848")
    static var appGray2                 = UIColor(hexString: "#797979")
    static var appGray3                 = UIColor(hexString: "#A9A9A9")
    static var appGray4                 = UIColor(hexString: "#D9D9D9")
    static var appWhite                 = UIColor(hexString: "#FFFFFF")
    
    static var appPrimary100            = UIColor(hexString: "#5C1518")
    static var appPrimary90             = UIColor(hexString: "#74171C")
    static var appPrimary80             = UIColor(hexString: "#8A1B21")
    static var appPrimary70             = UIColor(hexString: "#A42026")
    static var appPrimary60             = UIColor(hexString: "#BD242A")
    static var appPrimary50             = UIColor(hexString: "#D82730")
    static var appPrimary40             = UIColor(hexString: "#DF4E52")
    static var appPrimary30             = UIColor(hexString: "#E87578")
    static var appPrimary20             = UIColor(hexString: "#EFA1A3")
    static var appPrimary10             = UIColor(hexString: "#F7CECF")
    static var appPrimary0              = UIColor(hexString: "#FBE7E7")
    
    static var appSecondary100          = UIColor(hexString: "#129575")
    static var appSecondary90           = UIColor(hexString: "#71B1A1")
    static var appSecondary80           = UIColor(hexString: "#AFD3CA")
    static var appSecondary70           = UIColor(hexString: "#DBEBE7")
    static var appSecondary60           = UIColor(hexString: "#F6FAF9")

    static var appRating                = UIColor(hexString: "#F6FAF9")
    static var appError100              = UIColor(hexString: "#E60027")
    static var appError10               = UIColor(hexString: "#E8E0E1")
    static var appSucess100             = UIColor(hexString: "#2BA243")
    static var appSucess                = UIColor(hexString: "#ABCCB4")
    static var appTertiary100 = UIColor(hexString: "#FF9C00")
    static var apTertiaryp80 = UIColor(hexString: "#FFA61A")
    static var apTertiaryp60 = UIColor(hexString: "#FFBA4D")
    static var apTertiaryp40 = UIColor(hexString: "#FFCE80")
    static var apTertiaryp20 = UIColor(hexString: "#FFE1B3")
    static var appIngredientCell = UIColor(hexString: "#F1F1F1")
}
// MARK: - Fonts
struct  AppFonts {
    //bold
    static var titleBold                = UIFont.poppinsBold(size: 50)
    static var headerBold               = UIFont.poppinsBold(size: 30)
    static var largeBold                = UIFont.poppinsBold(size: 20)
    static var mediumBold               = UIFont.poppinsBold(size: 18)
    static var normalBold               = UIFont.poppinsBold(size: 16)
    static var SmallBold                = UIFont.poppinsBold(size: 14)
    static var SmallerBold              = UIFont.poppinsBold(size: 11)
    //regurlar
    static var titleRegular             = UIFont.poppinsRegular(size: 50)
    static var headerRegular            = UIFont.poppinsRegular(size: 30)
    static var largeRegular             = UIFont.poppinsRegular(size: 20)
    static var mediumRegular            = UIFont.poppinsRegular(size: 18)
    static var NormalRegular            = UIFont.poppinsRegular(size: 16)
    static var smallRegular             = UIFont.poppinsRegular(size: 14)
    static var SmallerRegular           = UIFont.poppinsRegular(size: 11)
    static var ToSmallerRegular           = UIFont.poppinsRegular(size: 8)
    
}
// MARK: - Icons
struct AppIcons {
    static var avatar = UIImage(named: "avatar")
    //bold icons
    static var outline_home             = UIImage(named: "Inactive_home")
    static var bold_arrow_down          = UIImage(named: "ic_bold_arrow_down")
    static var bold_arrow_right         = UIImage(named: "ic_bold_arrow_right")
    static var bold_arrow_up            = UIImage(named: "ic_bold_arrow_up")
    static var bold_doc_favorite        = UIImage(named: "ic_bold_doc_favorite")
    static var bold_doc_text            = UIImage(named: "ic_bold_doc_text")
    static var bold_home_2              = UIImage(named: "ic_bold_home_2")
    static var bold_inactive            = UIImage(named: "ic_bold_inactive")
    static var bold_location            = UIImage(named: "ic_bold_location")
    static var bold_message             = UIImage(named: "ic_bold_message")
    static var bold_more                = UIImage(named: "ic_bold_more")
    static var bold_nav                 = UIImage(named: "ic_bold_nav")
    static var bold_notification_bing   = UIImage(named: "ic_bold_notification_bing")
    static var bold_profile             = UIImage(named: "ic_bold_profile")
    static var bold_search_normal       = UIImage(named: "ic_bold_search_normal")
    static var bold_setting_2           = UIImage(named: "ic_bold_setting_2")
    static var bold_setting             = UIImage(named: "ic_bold_setting-4")
    static var bold_star                = UIImage(named: "ic_bold_star 1")
    static var bold_timer               = UIImage(named: "ic_bold_timer")
    static var bold_star_wt             = UIImage(named: "ic_bold_star_wt")
    static var bold_rightArrow_wt       = UIImage(named:  "ic_bold_arrow_right_wt")
    //outline icons
    static var  outline_arrow_down      = UIImage(named: "ic_outline_arrow_down")
    static var  outline_arrow_right     = UIImage(named: "ic_outline_arrow_right")
    static var  outline_arrow_up        = UIImage(named: "ic_outline_arrow_up")
    static var  outline_doc_favorite    = UIImage(named: "ic_outline_doc_favorite")
    static var  outline_doc_text        = UIImage(named: "ic_outline_doc_text")
//    static var  outline_home            = UIImage(named: "ic_outline_home")
    static var  outline_inactive        = UIImage(named: "ic_outline_Inactive")
    static var  outline_location        = UIImage(named: "ic_outline_location")
    static var  outline_message         = UIImage(named: "ic_outline_message")
    static var  outline_more            = UIImage(named: "ic_outline_more")
    static var  outline_nav             = UIImage(named: "ic_outline_nav")
    static var  outline_notification    = UIImage(named: "ic_outline_notification_bing")
    static var  outline_profile         = UIImage(named: "ic_outline_profile")
    static var  outline_search_normal   = UIImage(named: "ic_outline_search_normal")
    static var  outline_setting_2       = UIImage(named: "ic_outline_setting_2")
    static var  outline_setting         = UIImage(named: "ic_outline_setting-4")
    static var  outline_star            = UIImage(named: "ic_outline_star_1")
    static var  outline_timer           = UIImage(named: "ic_outline_timer")
    static var  ic_plus                 = UIImage(named: "ic_plus")
    static var envelope_circle          = UIImage(systemName: "envelope.circle")
    static var envelope_sqr             = UIImage(systemName: "envelope.circle")
    static var lock_circle              = UIImage(systemName: "lock.circle")
    static var lock_sqr                 = UIImage(systemName: "lock.circle")
    static var person_circle            = UIImage(systemName: "person.circle")
    static var person_sqr               = UIImage(systemName: "lock.circle")
    static var arrowLeft                = UIImage(named: "ic_arrow_left")
    
}
//MARK: - App Images
struct AppImages {
    static var backgroundImage          = UIImage(named: "peakpx")
    static var appLogo                  = UIImage(named: "Mo-Cocktail")
    static var google                   = UIImage(named: "google")
    static var facebook                 = UIImage(named: "facebook")
}
//MARK: - API
struct AppURL {
    static var baseURL  : String         = ""
    static var path     : String         = ""
    static var apiKey   : String         = ""
}
//MARK:- AppText
struct AppPlaceholder {
    
    static var emailPlaceholder         = "Enter your Email "
    static var passwordPlaceholder      = "Enter your Password "
    static var forgotPassword           = "Forgot Password"
    
}
struct  AppTitles {
    static var email                    = "Email"
    static var password                 = "Password"
    static var searchRecipe             = "Search Recipe"
    static var filterRecipe             = "Filter Recipe"
    static var savedRecipes             = "Saved Recipes"
    static var review                   = "Reviews"
    static var notification             = "Notifications"
    static var profile                  = "My Profile"
    static var signIn                   = "Sign In"
    static var singup                   = "Sign Up"
    static var confirmPassword          = "Confirm Password"
}
//MARK:- AppPlaceholder
