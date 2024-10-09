//
//  CityDetailView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct CityDetailView: View {
    var name: String
    
    var body: some View {
        VStack {
            Text("This is \(name)")
        }
        .navigationTitle(name)
    }
}

#Preview {
    CityDetailView(name: "Example")
}
