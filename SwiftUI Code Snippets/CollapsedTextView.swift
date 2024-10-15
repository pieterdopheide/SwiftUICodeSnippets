//
//  CollapsedTextView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 15/10/2024.
//

import SwiftUI

struct CollapsedTextView: View {
    let paragraphs = [
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit ut erat sed malesuada. Quisque fermentum, nunc sit amet auctor condimentum, sapien orci elementum mi, quis ultrices lacus magna sit amet augue. Ut tempus est ac blandit mollis. Etiam at quam non dui mattis ullamcorper a eu metus. Phasellus magna purus, consequat ut mollis ut, vulputate pharetra lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque eleifend pulvinar eros, sed pharetra lacus pellentesque vitae. Quisque egestas risus erat, nec mattis quam pretium a. Suspendisse ante tellus, varius non ipsum in, gravida finibus risus. In feugiat vitae velit vel fringilla. Sed egestas orci mi, sed fringilla purus gravida sed. Sed non facilisis lorem, ut aliquet turpis.",
        "Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque suscipit blandit felis, sit amet luctus ex mollis a. Donec ultricies vel justo eget dapibus. Vestibulum gravida dignissim elementum. Nulla id nibh a magna euismod tempor. Fusce at magna eu magna tincidunt vehicula non in nisi. Duis et semper odio. Curabitur metus enim, rhoncus vel lectus eu, luctus ornare odio. Donec accumsan semper arcu, vitae eleifend risus ullamcorper quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean cursus orci eget pulvinar convallis. Duis bibendum quam ut sollicitudin condimentum.",
        "In vulputate elit sem, et tempus lorem cursus at. Duis ipsum lacus, fermentum et odio a, convallis ullamcorper turpis. Aliquam suscipit lectus vel sem porttitor cursus. Fusce sed velit egestas, mattis sem eu, tempor diam. Duis risus tellus, aliquet vel nisl in, dignissim venenatis neque. Pellentesque nec lorem et ipsum maximus viverra. Fusce vitae dignissim mauris. Nam scelerisque, magna at auctor tempus, lectus lectus tristique quam, vitae tempor turpis mi in felis. Sed id ante ut ligula interdum aliquet. Aenean tincidunt volutpat ligula. Suspendisse dolor lacus, molestie at dapibus nec, consectetur sed nulla. Vestibulum eget congue justo.",
        "Aenean efficitur felis et ligula mollis hendrerit. Aenean sit amet nisi et mi elementum consequat. Nam arcu nulla, tempus sit amet leo sit amet, ornare ornare sem. Duis molestie arcu leo, tincidunt egestas ipsum lacinia et. Vivamus fermentum elit vel purus condimentum vulputate. Curabitur pharetra orci eget lectus iaculis dapibus. Donec vestibulum enim eget rhoncus tristique. Nulla facilisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.",
        "Quisque vulputate velit sed lorem pellentesque ullamcorper. Quisque tincidunt ultrices lectus, vel efficitur nisl posuere hendrerit. Proin condimentum nulla sed ex lacinia, vitae sagittis libero consectetur. Duis non nisi felis. Aliquam tempor eget risus a tempus. Curabitur varius scelerisque enim ut bibendum. Phasellus vel mi sed purus imperdiet mollis. Sed nec elit a sem sollicitudin elementum. Quisque ultricies euismod ante, sed ultrices libero lobortis quis. Nullam bibendum viverra quam."
    ]
    
    @State private var paragraph1Expanded = false
    @State private var paragraph2Expanded = false
    @State private var paragraph3Expanded = false
    @State private var paragraph4Expanded = false
    @State private var paragraph5Expanded = false
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(paragraphs, id: \.self) { paragraph in
                    ExpandableText(text: paragraph)
                        .padding()
                }
            }
        }
    }
}

struct ExpandableText: View {
    let text: String
    
    @State var isExpanded = false
    
    var body: some View {
        Text(text)
            .lineLimit(isExpanded ? nil : 3)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
    }
}

#Preview {
    CollapsedTextView()
}
