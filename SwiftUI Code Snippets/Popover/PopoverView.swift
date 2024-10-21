//
//  PopoverView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 21/10/2024.
//

import SwiftUI

struct PopoverView: View {
    @State private var isShowingPopover = false
    var body: some View {
        Text("Tap me!")
            .popover(isPresented: $isShowingPopover) {
                Text("Hello!")
                    .presentationCompactAdaptation(.popover)
            }
            .onTapGesture {
                isShowingPopover = true
            }
    }
}

#Preview {
    PopoverView()
}
