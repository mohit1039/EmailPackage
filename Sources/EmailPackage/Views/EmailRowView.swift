//
//  EmailRowView.swift
//  
//
//  Created by Mohitkumar Gupta on 26/05/24.
//

import SwiftUI

struct EmailRowView: View {
    let email: Email
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(email.email)
                    .font(.headline)
                Text("\(email.firstName) \(email.lastName)")
                    .font(.subheadline)
            }
            Spacer()
            AsyncImage(url: URL(string: email.avatar)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    ProgressView()
                        .frame(width: 50, height: 50)
                }
            }
        }
        .padding()
    }
}
