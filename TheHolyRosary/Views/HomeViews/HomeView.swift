//
//  HomeView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var rosaryViewModel = RosaryViewModel()
    
    let color2 = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
   
    var body: some View {
        VStack {
            TopPicView()
            ZStack {
                CustomShape()
                    .foregroundColor(Color(color2))
                    .padding(.bottom, 5)
                    .shadow(color: .gray, radius: 5, x: 6, y: 5)
                
                VStack(spacing: 8)  {
                    if let today = rosaryViewModel.todaysModel.first {
                        VStack(spacing: 8) {
                            Text("Today")
                            Text("\(today.rosary_day), \(today.currentDate)")
                        }
                        .font(.headline.bold())
                        .offset(y: -60)
                        
                        VStack(spacing: 8) {
                            Text("\(today.mystery) Mystery")
                            Text("\(today.season) Season")
                        }
                        .font(.callout.bold())
                        .offset(y: -60)
                        .padding(.top, 20)
                    }
                }
                .foregroundColor(.white)
                
                PrayButtonView()
                    .offset(y: 60)
            }
            .offset(y: -100)
            
            HomeButtonsView()
                .offset(y: -20)
        }
        .onAppear {
            rosaryViewModel.fetchTodaysRosary()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
