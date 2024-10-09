//
//  SettingsView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct SettingsView: View {
    @Bindable private var navigator = NavigationManager.nav
    
    var body: some View {
        NavigationStack(path: $navigator.settingsNavigator) {
            VStack{
                Text("Links:")
                
                Button("Profile"){
                    navigator.settingsNavigator.append(.profile)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .buttonStyle(BorderedProminentButtonStyle())
                
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            .addToolbar()
            .addNavigationSupport()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
