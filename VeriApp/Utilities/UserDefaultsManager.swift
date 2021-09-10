//
//  UserDefaultsManager.swift
//  iAutoriza
//
//  Created by Evelin Gutierrez on 25/11/20.
//  Copyright © 2020 Evelin Gutierrez. All rights reserved.
//

import UIKit

class UserDefaultsManager {
    
    static func getUserDefaultsBool(_ key:enumUDKeys) -> Bool {
        if let value = UserDefaultsManager.getUserDefaults(key) as? Bool {
            return value
        }
        return false
    }
    
    static func getUserDefaultsString(_ key:enumUDKeys) -> String {
        if let value = UserDefaultsManager.getUserDefaults(key) as? String {
            return value
        }
        return ""
    }
    
    static func getUserDefaultsArray(_ key:enumUDKeys) -> [Any]? {
        if let value = UserDefaultsManager.getUserDefaults(key) as? [Any] {
            return value
        }
        return nil
    }
    
    static func getUserDefaultsDictionary (_ key:enumUDKeys) -> [String:Any]? {
        if let value = UserDefaultsManager.getUserDefaults(key) as? [String:Any] {
            return value
        }
        return nil
    }
    
    //MARK: - Base Save User Default
    static func saveUserDefaults<T>(value element:T, key:enumUDKeys) {
        UserDefaults.standard.set(element, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func deleteUserDefaults(_ key:enumUDKeys)  {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    static func getUserDefaults(_ key:enumUDKeys) -> Any? {
        if let value = UserDefaults.standard.object(forKey: key.rawValue)  {
            return value
        }
        return nil
    }
}

