//
//  BannerOnboardingView.swift
//  SwiftUI Code Snippets
//
//  Created by Dopheide,Pieter on 09/10/2024.
//

import SwiftUI

// As seen in this Reddit thread: https://www.reddit.com/r/SwiftUI/comments/1frxvsw/do_you_use_onboarding_screens_simple_onboarding/
// Use the code example from the thread: https://www.coderstool.com/cs/fC771n

struct BannerOnboardingView: View {
    @Binding var isOnBoarding: Bool
    
    @State private var isAnimationTriggered: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Banner contains slowly moving cards at the top. You can place whatever you want inside this view.
            // Technically, it occupies the entire screen, but only the part at the top is visible due to
            // the LinearGradient used on top of it.
            BannerView()
                .frame(maxHeight: .infinity, alignment: .top)
                .bannerAnimation(isTriggered: isAnimationTriggered)
            
            VStack {
                VStack(spacing: 0) {
                    // LinearGradient fades out the Banner.
                    // I use it inside the VStack so that regardless of the size of the text used in TitleAndDescription() below,
                    // the LinearGradient here occupies the rest of the screen, no matter the screen size of the device or font size used,
                    // such as when users set larger fonts for accessibility, etc.
                    // Clear color is used to fade out the Banner.
                    LinearGradient(gradient: Gradient(stops: [.init(color: Color.clear, location: 0),
                                                              .init(color: Color.white, location: 0.99)]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                    
                    // Contains the welcome title, description, and "Dive In" button. You can have whatever you want here.
                    VStack(spacing: 30) {
                        VStack(spacing: 5) {
                            Text("Welcome")
                                .font(.title.bold())
                                .offsetAnimation(isTriggered: isAnimationTriggered, delay: 0.3)
                            Text("De Bibliotheek app, de plek om al je bibliotheekzaken te regelen.")
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .offsetAnimation(isTriggered: isAnimationTriggered, delay: 0.6)
                        }
                        Button(action: {
                            isOnBoarding = false
                        }) {
                            Label("Beginnen", systemImage: "rectangle.portrait.and.arrow.right.fill")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding(15)
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                }
                                .offsetAnimation(isTriggered: isAnimationTriggered, delay: 0.9)
                        }
                    }
                    .padding(30)
                    .layoutPriority(1)
                    // You also need to set the background behind the text so the rest of the Banner() is not visible
                    // behind it.
                    .background { Color.white }
                }
            }
        }
        .onAppear { isAnimationTriggered = true }
    }
}

struct BannerView: View {
    @State private var endpoints = Endpoints(endpoints: [Library]())
    
    let colors: [Color] = [.red, .orange, .blue, .green, .pink, .yellow, .gray, .brown]
    @State private var isAnimationTriggered: Bool = false
    
    var body: some View {
        // GeometryReader is used so the cards below can exceed the boundries of the screen without
        // affecting other elements (Texts and the button)
        GeometryReader { _ in
            VStack(spacing: 10) {
                ForEach(Array(colors.enumerated()), id: \.element) { index, color in
                    HStack(spacing: 10) {
                        ForEach(0..<5, id: \.self) { _ in
                            //                            RoundedRectangle(cornerRadius: 16)
                            //                                .frame(width: 250, height: 70)
                            //                                .foregroundStyle(color)
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: 250, height: 70)
                                .foregroundStyle(color)
                                .overlay {
                                    Text(endpoints.endpoints.randomElement()?.orgName ?? "")
                                }
                        }
                    }
                    .offset(x: CGFloat(index) * -80.0)
                }
            }
            // subtle "scrolling" animation effect of the cards
            .offset(x: isAnimationTriggered ? -400 : 0)
            .animation(.linear(duration: 50).repeatForever(autoreverses: true), value: isAnimationTriggered)
            .onAppear { isAnimationTriggered = true }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://w4a.wise-nl.oclc.org/rest/app-endpoints-idm") else {
            print("Invalid fetch library URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Endpoints.self, from: data) {
                endpoints = decodedResponse
            } else {
                endpoints = Endpoints(endpoints: [Library]())
            }
        } catch {
            print("Invalid libraries data")
        }
    }
}

extension View {
    func offsetAnimation(isTriggered: Bool, delay: CGFloat) -> some View {
        return self
            .offset(y: isTriggered ? 0 : 30)
            .opacity(isTriggered ? 1 : 0)
            .animation(.smooth(duration: 1.4, extraBounce: 0.2).delay(delay), value: isTriggered)
    }
    
    func bannerAnimation(isTriggered: Bool) -> some View {
        return self
            .scaleEffect(isTriggered ? 1 : 0.95)
            .opacity(isTriggered ? 1 : 0)
            .animation(.easeOut(duration: 1), value: isTriggered)
    }
}

struct Endpoints: Hashable, Codable {
    var endpoints: [Library]
}

struct Library: Hashable, Codable, Identifiable {
    var id = UUID()
    var orguuid: String
    var libraryId: String
    var orgName: String
    var url: String
    var weight: String?
    var lat: String
    var lon: String
    var version: String
    var city: String?
    
    enum CodingKeys: String, CodingKey {
        case orguuid
        case libraryId = "instantie"
        case orgName = "orgname"
        case url, weight, lat, lon
        case version = "v"
        case city
    }
    
    static let example = Library(
        orguuid: "3daef8d939faf3405d8587ac664eb25b",
        libraryId: "I000",
        orgName: "Preview Library",
        url: "https://owtestta04mxr1.nit.oclc.org/",
        lat: "52.012808",
        lon: "4.716112",
        version: "v1.0"
    )
}

#Preview {
    BannerOnboardingView(isOnBoarding: .constant(true))
}
