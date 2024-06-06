//
//  File.swift
//  
//
//  Created by Mohitkumar Gupta on 26/05/24.
//

import Foundation
import Alamofire

public protocol EmailServiceProtocol {
    func fetchEmails() async throws -> [Email]
}

public class EmailService: EmailServiceProtocol {
    
    public init() {}
    
    public func fetchEmails() async throws -> [Email] {
        //URL value can be made configurable based on different value and network call can be made generic
        // For now keeping it simple as it is not much complex
        let url = "https://reqres.in/api/users?page=1"
        let response = try await AF.request(url)
            .validate()
            .serializingDecodable(EmailResponse.self).value
        return response.emailList
    }
}


