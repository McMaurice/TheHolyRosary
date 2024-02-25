//
//  HomeNavButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/21/24.
//

import SwiftUI

struct HomeButtonsView: View {
    @EnvironmentObject var rosaryViewModel: RosaryViewModel
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    
    var body: some View {
        HStack(spacing: 40) {
            YesterdayButtonView()
            TomorrowButtonView()
        }
        .onAppear {
            rosaryViewModel.fetchTomorrowsRosary()
            rosaryViewModel.fetchYesterdaysRosary()
        }
        .foregroundColor(.white)
        .padding(.bottom)
        if propertiesViewModel.showTomorrow {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .background(.ultraThinMaterial)
                    .frame(height: UIScreen.main.bounds.height / 1.5)
                    .transition(.move(edge: .bottom))
                
                if let tomorrow = rosaryViewModel.tomorrowsModel.first {
                    VStack {
                        VStack(spacing: 10) {
                            Text("Tomorrow")
                            Text("\(tomorrow.rosary_day), \(tomorrow.currentDate)")
                        }
                        .font(.headline.bold())
                        .padding()
                        
                        VStack(spacing: 8) {
                            Text("\(tomorrow.mystery) Mystery")
                            Text("\(tomorrow.season) Season")
                        }
                        .font(.callout.bold())
                        .padding(.top, 20)
                    }
                    .foregroundColor(.white)
                    .offset(y: -150)
                } else {
                    ProgressView()
                        .offset(y: -100)
                    }
                }
            }
        
        if propertiesViewModel.showYesterday {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .background(.ultraThinMaterial)
                    .frame(height: UIScreen.main.bounds.height / 1.5)
                    .transition(.move(edge: .bottom))
                if let yesterday = rosaryViewModel.yesterdaysModel.first {
                    VStack {
                        VStack(spacing: 10) {
                            Text("Yesterday")
                            Text("\(yesterday.rosary_day), \(yesterday.currentDate)")
                        }
                        .font(.headline.bold())
                        .padding()
                        
                        VStack(spacing: 8) {
                            Text("\(yesterday.mystery) Mystery")
                            Text("\(yesterday.season) Season")
                        }
                        .font(.callout.bold())
                        .padding(.top, 20)
                    }
                    .clipShape(Rectangle())
                    .foregroundColor(.white)
                    .offset(y: -150)
                } else {
                    ProgressView()
                        .offset(y: -100)
                    }
                }
        }
    }
}


struct HomeButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PropertiesViewModel())
            .environmentObject(RosaryViewModel())
    }
}
