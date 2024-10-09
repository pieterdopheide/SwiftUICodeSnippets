//
//  ProfileView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .font(.system(size: 100))
                .foregroundStyle(.secondary)
            
            Text("John Doe")
                .font(.largeTitle)
            Text("Author")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProfileView()
}
