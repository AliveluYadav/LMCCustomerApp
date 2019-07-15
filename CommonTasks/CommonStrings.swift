//
//  CommonTask.swift
//  CustomerApp
//
//  Created by LetMeCall Corp on 06/02/19.
//  Copyright © 2019 LetMeCall Corp. All rights reserved.
//

import Foundation
import UIKit
class CommonStrings
    {
    
   internal static let strSysName:String = UIDevice.current.systemName
   internal static let appversion:String = UIDevice.current.systemVersion
   internal static let deviceName:String = UIDevice.current.name
   internal static let uniqueIdentifier:String = (UIDevice.current.identifierForVendor?.uuidString)!
   internal static let fcmToken:String = ""
    
    // self.baseUrl = @"http://9b8b56e0.ngrok.io/letmecall-web-v2";
    // self.baseUrl = @"https://letmecall.com/";
    //  self.baseUrl = @"http://3fcded96.ngrok.io/letmecall-web-v2/";
    
    internal static let version0 = "api/v0/"
    internal static let version1 = "api/v1/"
    internal static let version2 = "api/v2/"
    internal static let version3 = "api/v3/"
    internal static let version4 = "api/v4/"
    internal static let version5 = "api/v5/"
    internal static let versionAPI = "v3/"
    
    internal static let baseURL = "http://45.33.46.234:8080/"
   
    internal static let loginURL = baseURL + version0 + "login"
    internal static let signUpURL = baseURL + version0 + "login/signup"
    internal static let distinctStoreCategoryURL = baseURL + version0 + "stores/distinctStoreCategory"
    internal static let storesURL =  baseURL + version0 + "stores?"
    internal static let signUpTCurl =  baseURL + version0 + "terms"
    internal static let fgtPassTCurl =  baseURL + "forgotPasswordPage?cart=false"
    internal static let storeSku = baseURL + version0
    internal static let updateProfileUrl = baseURL + version0 + "customers/"
    internal static let shippingUrl = baseURL + version0 + "customers/"
    internal static let shippingAddressUrl = baseURL + version0 + "customers/"
    internal static let customerCartUrl = baseURL + version0 + "carts/customers/"
    internal static let carts = baseURL + version0 + "carts/"
    internal static let orders =  baseURL + version0 + "orders/"
    internal static let cartItem =  baseURL + version1 + "carts/"
    internal static let logoutURL =  baseURL + version1 + "logout"
    internal static let googlePlacesUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?"
    
    
}


