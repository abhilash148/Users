//
//  User.swift
//  Users
//
//  Created by Sai Abhilash Gudavalli on 12/04/23.
//

import Foundation

struct User: Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var friends: [Friend]
}


