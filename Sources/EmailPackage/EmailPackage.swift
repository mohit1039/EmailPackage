// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI


public protocol EmailPackageProtocol {
    func getEmailPackageView() -> AnyView
    func fetchFirstEmailClosure(fetchFirstEmail: @escaping (String) -> Void)
}

public class EmailPackage: EmailPackageProtocol {
    
    private var emailViewModel: EmailViewModel
    
    public init() {
        self.emailViewModel = EmailViewModel()
    }
    
    public func getEmailPackageView() -> AnyView {
        AnyView(EmailListView(viewModel: emailViewModel))
    }
    
    public func fetchFirstEmailClosure(fetchFirstEmail: @escaping (String) -> Void) {
        self.emailViewModel.onFirstEmailSelected = fetchFirstEmail
    }
    
}
