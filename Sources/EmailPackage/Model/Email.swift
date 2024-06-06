//
//  EmailResponse.swift
//  
//
//  Created by Mohitkumar Gupta on 26/05/24.
//

import Foundation

public struct Email: Decodable, Identifiable {
    public let id: Int
    public let email: String
    public let firstName: String
    public let lastName: String
    public let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct EmailResponse: Decodable {
    let emailList: [Email]
    
    enum CodingKeys: String, CodingKey {
        case emailList = "data"
    }
}
