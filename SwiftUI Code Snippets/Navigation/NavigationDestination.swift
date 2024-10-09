//
//  NavigationDestination.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import Foundation
import SwiftUI

enum NavigationDestination: Hashable, View {
    case home
    case profile
    case settings
    case city(String)
    
    // return the associated view for each case
    var body: some View {
        switch self {
        case .home:
            HomeView()
        case .profile:
            ProfileView()
        case .settings:
            SettingsView()
        case .city(let name):
            CityDetailView(name: name)
                .toolbarTitleDisplayMode(.large)
        }
    }
}
