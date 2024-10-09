//
//  ViewExtension.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import Foundation
import SwiftUI

extension View {
    func addToolbar() -> some View {
        self
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        let navigator = NavigationManager.nav
                        navigator.selectedTab = 1
                        navigator.mainNavigator = []
                    } label: {
                        Image(systemName: "apple.logo")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        NavigationManager.nav.selectedTab = 4
                        NavigationManager.nav.settingsNavigator = [.profile]
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
            }
    }
    
    func addSearchbar(text: Binding<String>, prompt: String) -> some View {
        self
            .searchable(text: text, prompt: prompt)
            .task {
                //action code here...
            }
    }
    
    func addNavigationSupport() -> some View {
        self
            .navigationDestination(for: NavigationDestination.self) { destination in
                destination // The enum itself returns the view
            }
    }
}
