//
//  CarouselItemView.swift
//  ComponentAndDesignExperiments
//
//  Created by Marshall  on 9/22/22.
//

import SwiftUI

struct CarouselItemView: View {
    let item: CarouselItem
    
    var body: some View {
        ZStack {
            item.backgroundColor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(item.title)
                    .font(.system(size: 40, weight: .semibold))
                    .animation(.interpolatingSpring(stiffness: 40, damping: 8))
                
                Text(item.subtitle)
                    .font(.system(size: 25, weight: .regular))
                    .animation(.interpolatingSpring(stiffness: 40, damping: 8))
            }
            .padding(.horizontal)
            Spacer()
            
        }
        .foregroundColor(.white)
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(item: CarouselItem.data[0])
    }
}
