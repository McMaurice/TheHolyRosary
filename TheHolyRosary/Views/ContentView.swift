//
//  ContentView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var holyRosaryViewModel = HolyRosaryViewModel()
    
    var body: some View {
        VStack {
            TabHomeView().preferredColorScheme(.light)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
