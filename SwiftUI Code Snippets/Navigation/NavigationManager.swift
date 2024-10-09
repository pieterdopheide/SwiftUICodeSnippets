//
//  NavigationManager.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import Foundation
import SwiftUI

// Define a singleton class for managing navigation
@Observable
final class NavigationManager {
    
    var selectedTab = 1
    
    //Tab handler for pop to root on tap of selected tab
    var tabHandler: Binding<Int> { Binding(
        get: { self.selectedTab },
        // React to taps on the tap item
        set: {
            // If the current tab selection gets tapped again
            if $0 == self.selectedTab {
                switch $0 {
                case 1:
                    self.mainNavigator = [] //reset the navigation path
                case 2:
                    self.cityNavigator = []
                case 3:
                    self.animalNavigator = []
                case 4:
                    self.settingsNavigator = []
                default:
                    self.mainNavigator = []
                    
                }
            }
            self.selectedTab = $0
        }
    ) }
    
    static let nav = NavigationManager() //also commonly called "shared"
    
    var mainNavigator: [NavigationDestination] = []
    var cityNavigator: [NavigationDestination] = []
    var animalNavigator: [NavigationDestination] = []
    var settingsNavigator: [NavigationDestination] = []
    
    private init() {}
}
