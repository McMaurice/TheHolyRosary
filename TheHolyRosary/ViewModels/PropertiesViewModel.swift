//
//  PropertiesModelView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/25/24.
//
import SwiftUI
import Foundation

class PropertiesViewModel: ObservableObject {
    @Published var showTomorrow = false
    @Published var showYesterday = false
    @Published var animatePrayerButton = false
    
    func prayerButtonAnimation() {
        guard !animatePrayerButton else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            
            ) {
                self.animatePrayerButton.toggle()
            }
        }
    }
}
