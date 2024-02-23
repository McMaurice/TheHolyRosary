//
//  HomeNavButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/21/24.
//

import SwiftUI

struct HomeButtonsView: View {
    @StateObject var rosaryViewModel = RosaryViewModel()
    let color = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
    
    var body: some View {
        HStack(spacing: 40) {
            Button {
                //
            } label: {
                VStack(spacing: 5) {
                    if let yesterday = rosaryViewModel.yesterdaysModel.first {
                        Image(systemName: "chevron.left")
                        Text("Yesterday")
                            .font(.headline)
                        Text("\(yesterday.mystery) Mystery")
                            .font(.subheadline)
                    }
                }
                .frame(width: 135, height: 60)
                .padding()
                .background(Color(color))
                .cornerRadius(15)
                .shadow(radius: 10)
                .shadow(radius: 5, x: 6, y: 5)
            }

            Button {
                MoreView()
            } label: {
                VStack(spacing: 5) {
                    if let tomorrow = rosaryViewModel.tomorrowsModel.first {
                        Image(systemName: "chevron.right")
                        Text("Tomorrow")
                            .font(.headline)
                        Text("\(tomorrow.mystery) Mystery")
                            .font(.subheadline)
                    }
                }
                .frame(width: 135, height: 60)
                .padding()
                .background(Color(color))
                .cornerRadius(15)
                .shadow(radius: 5, x: 6, y: 5)
            }
        }
        .onAppear {
            rosaryViewModel.fetchTomorrowsRosary()
            rosaryViewModel.fetchYesterdaysRosary()
        }
        .foregroundColor(.white)
        .padding(.bottom)
    }
}


struct HomeButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
