//
//  TabsView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

// Source: https://medium.com/@jakir/swiftui-tabview-with-animation-b13cf5478988

struct TabsView: View {
    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Label("Tab 1", systemImage: "1.circle")
                }
            
            Text("Tab 2")
                .tabItem {
                    Label("Tab 2", systemImage: "2.circle")
                }
            
            NestedTabView()
                .tabItem {
                    Label("Tab 3", systemImage: "3.circle")
                }
        }
    }
}

struct NestedTabView: View {
    @State var currentTab = 0
    @Namespace var namespace
    
    var body: some View {
        // The ZStack alignment determines the location of the tab bar, in this case a the top of the view.
        ZStack(alignment: .top) {
            TabView(selection: $currentTab) {
                Text("Tab 3.1")
                    .tag(0)
                
                Text("Tab 3.2")
                    .tag(1)
                
                Text("Tab 3.3")
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack {
                tabBarItem(name: "Tab 3.1", tab: 0)
                tabBarItem(name: "Tab 3.2", tab: 1)
                tabBarItem(name: "Tab 3.3", tab: 2)
            }
        }
    }
    
    func tabBarItem(name: String, tab: Int) -> some View {
        Button {
            currentTab = tab
        } label: {
            VStack {
                Text(name)
                
                if currentTab == tab {
                    Color.black.frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: currentTab)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TabsView()
}
