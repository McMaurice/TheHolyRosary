//
//  PrayButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/21/24.
//

import SwiftUI

struct PrayButtonView: View {
    
    var body: some View {
        NavigationLink {
            MysteriesView()
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
                            .foregroundColor(.black)
                        )
                }
                .padding(.top)
            }

        }
    }
}

struct PrayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
