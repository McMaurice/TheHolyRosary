//
//  TheHolyRosaryApp.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/19/24.
//

import SwiftUI

@main
struct TheHolyRosaryApp: App {
    @StateObject var rosaryViewModel: RosaryViewModel = RosaryViewModel()
    @StateObject var propertiesViewModel: PropertiesViewModel = PropertiesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(rosaryViewModel)
                .environmentObject(propertiesViewModel)
        }
    }
}
