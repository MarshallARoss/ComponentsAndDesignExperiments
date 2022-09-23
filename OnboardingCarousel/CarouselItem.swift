//
//  CarouselItem.swift
//  ComponentAndDesignExperiments
//
//  Created by Marshall  on 9/22/22.
//

import SwiftUI

struct CarouselItem: Identifiable {
    let id = UUID().uuidString
    let backgroundColor: Color
    //let image: String
    let title: String
    let subtitle: String
}

extension CarouselItem {
   
    static let data: [CarouselItem] = [
        .init(backgroundColor: .carouselTheme.blue, title: "Welcome 👋", subtitle: "This is a fun project where I experiment, learn, and try new things."),
        .init(backgroundColor: .carouselTheme.pink, title: "First, Onboarding.", subtitle: "You're looking at it. How's it going so far?"),
        .init(backgroundColor: .carouselTheme.orange, title: "Coming Up", subtitle: "Hit 'Done' to be taken to the navigation list where each project get's a little spotlight. See you there.")
    ]
    
}
