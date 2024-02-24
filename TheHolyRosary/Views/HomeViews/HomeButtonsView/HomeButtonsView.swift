//
//  HomeNavButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/21/24.
//

import SwiftUI

struct HomeButtonsView: View {
    @StateObject var rosaryViewModel = RosaryViewModel()
    @State var showYesterday: Bool = false
    @State var showTomorrow: Bool = false
    
    let color2 = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    
    var body: some View {
        HStack(spacing: 40) {
            YesterdayButtonView(rosaryViewModel: rosaryViewModel, showYesterday: $showYesterday, showTomorrow: $showTomorrow)
            TomorrowButtonView(rosaryViewModel: rosaryViewModel, showTomorrow: $showTomorrow, showYesterday: $showYesterday)
        }
        .onAppear {
            rosaryViewModel.fetchTomorrowsRosary()
            rosaryViewModel.fetchYesterdaysRosary()
        }
        .foregroundColor(.white)
        .padding(.bottom)
        if showTomorrow {
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
        
        if showYesterday {
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
    }
}
