//
//  ContentView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image (systemName: "house")
                    Text("Home")
                }
            DaysView()
                .tabItem {
                    Image (systemName: "cross")
                    Text("Days")
                }
            MysteriesView()
                .tabItem {
                    Image (systemName: "moon.circle")
                    Text("Mysteries")
                }
            MoreView()
                .tabItem {
                    Image (systemName: "ellipsis")
                    Text("More")
                }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(PropertiesViewModel())
                .environmentObject(RosaryViewModel())
        }
    }
}
