//
//  SearchbarTabsView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

struct SearchbarTabsView: View {
    // Get a binding to the navigation singleton
    @Bindable private var navigator = NavigationManager.nav
    
    var body: some View {
        TabView(selection: navigator.tabHandler) {
            HomeView()
                .tabItem {
                    Label("Welcome", systemImage: "house")
                }
                .tag(1)
            
            CityTabView()
                .tabItem {
                    Label("Cities", systemImage: "building.2.fill")
                }
                .tag(2)
            
            AnimalTabView()
                .tabItem {
                    Label("Animals", systemImage: "tortoise.fill")
                }
                .tag(3)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
    }
}

#Preview {
    SearchbarTabsView()
}
