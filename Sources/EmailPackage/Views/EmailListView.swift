//
//  EmailListView.swift
//
//
//  Created by Mohitkumar Gupta on 26/05/24.
//

import SwiftUI

public struct EmailListView: View {
    @ObservedObject var viewModel: EmailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    public init(viewModel: EmailViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.emails) { email in
                    EmailRowView(email: email)
                }
            }
            Button(action: {
                viewModel.selectFirstEmail()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Return First Item")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .task {
            await viewModel.fetchEmails()
        }
    }
}
