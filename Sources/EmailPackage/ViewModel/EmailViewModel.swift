//
//  File.swift
//  
//
//  Created by Mohitkumar Gupta on 26/05/24.
//


import Foundation
import SwiftUI


public class EmailViewModel: ObservableObject {
    
    
    @Published public var emails: [Email] = []
    @Published public var isLoading: Bool = false
    
    private let emailService: EmailServiceProtocol
    
    public var onFirstEmailSelected: ((String) -> Void)?
    
    public init(emailService: EmailServiceProtocol = EmailService()) {
        self.emailService = emailService
    }
    
    @MainActor
    public func fetchEmails() async {
        isLoading = true
        do {
            let emails = try await emailService.fetchEmails()
            self.emails = emails
        } catch {
            print("Error: \(error)")
        }
        isLoading = false
    }
    
    public func selectFirstEmail() {
        if let firstEmail = emails.first?.email {
            onFirstEmailSelected?(firstEmail)
        }
    }
}
