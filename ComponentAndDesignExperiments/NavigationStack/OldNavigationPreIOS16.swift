//
//  File.swift
//  ComponentAndDesignExperiments
//
//  Created by Marshall  on 9/21/22.
//

//Based on https://www.youtube.com/watch?v=7dnTHrLyFLc

import Foundation
import SwiftUI

//MARK: - OLD WAY
struct OldNavigation: View {
    var body: some View {
            
        NavigationView {
            List {
                NavigationLink("Link to another view") {
                    Text("The aforementioned other view")
                }
            }
        }

    }
}


struct OldNavigation_Previews: PreviewProvider {
    static var previews: some View {
        OldNavigation()
    }
}
