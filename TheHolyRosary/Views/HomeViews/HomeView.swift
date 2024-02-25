//
//  HomeView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var rosaryViewModel: RosaryViewModel
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                TopPicView()
                ZStack {
                    CustomShape()
                        .foregroundColor(Color.accentColor)
                        .padding(.bottom, 1)
                        .shadow(color: .black, radius: 10, x: 3, y: 5)
                    
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
                        } else {
                            VStack {
                                Text("Ops! Not available at this time")
                                Text("Check on your internet connection")
                                ProgressView()
                            }
                            .padding(.bottom, 50)
                        }
                    }
                    .foregroundColor(.white)
                    
                    PrayButtonView()
                        .offset(y: 70)
                }
                .offset(y: -120)
                
                HomeButtonsView()
                    .offset(y: -20)
            }
            .onAppear {
                rosaryViewModel.fetchTodaysRosary()
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PropertiesViewModel())
            .environmentObject(RosaryViewModel())
    }
}
