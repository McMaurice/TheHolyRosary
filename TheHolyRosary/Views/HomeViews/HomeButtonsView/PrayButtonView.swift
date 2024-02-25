//
//  PrayButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/21/24.
//

import SwiftUI

struct PrayButtonView: View {
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    
    var body: some View {
        NavigationLink {
            MoreView()
        } label: {
            VStack {
                ZStack {
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 130, height: 100)
                        .shadow(radius: 5, x: 6, y: 5)
                        .overlay(
                            VStack(spacing: 0) {
                                Image("prayer")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                
                                HStack(spacing: 5) {
                                    Text("Pray")
                                    Text("Now")
                                }
                                .font(.headline)
                                .fontWeight(.bold)
                            }
                        )
                }
                .padding(.top)
                .foregroundColor(.black)
                .padding(.horizontal, propertiesViewModel.animatePrayerButton ? 30 : 20)
                .scaleEffect(propertiesViewModel.animatePrayerButton ? 1.1 : 1.0)
                .offset(y: propertiesViewModel.animatePrayerButton ? -7 : 0)
            }

        }
        .onAppear {
            propertiesViewModel.prayerButtonAnimation()
        }
    }
}

struct PrayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrayButtonView()
            .environmentObject(PropertiesViewModel())
    }
}
