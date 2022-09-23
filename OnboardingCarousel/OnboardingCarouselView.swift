//
//  OnboardingCarouselView.swift
//  ComponentAndDesignExperiments
//
//  Created by Marshall  on 9/22/22.
//

import SwiftUI

//TODO: - Add Tabview
struct OnboardingCarouselView: View {
    let data = CarouselItem.data
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    ForEach(data) { item in
                        CarouselItemView(item: item)
                            .frame(width: .infinity)
                    }
                }
            }
        }
    }
}

struct OnboardingCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCarouselView()
    }
}
