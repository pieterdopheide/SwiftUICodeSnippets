//
//  HomeView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct HomeView: View {
    @Bindable private var navigator = NavigationManager.nav
    
    var body: some View {
        NavigationStack(path: $navigator.mainNavigator) {
            VStack{
                Text("Select:")
                
                Group {
                    Button("Find a city"){
                        navigator.selectedTab = 2
                    }
                    Button("Find an animal"){
                        navigator.selectedTab = 3
                        
                    }
                    Button("Go to Settings"){
                        navigator.selectedTab = 4
                    }
                    .tint(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .buttonStyle(BorderedProminentButtonStyle())
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            .addToolbar()
            .addNavigationSupport()
            .navigationTitle("Welcome")
        }
    }
}

#Preview {
    HomeView()
}
