//
//  YesterdayButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/24/24.
//

import SwiftUI

struct YesterdayButtonView: View {
    @EnvironmentObject var rosaryViewModel: RosaryViewModel
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    
    var body: some View {
        VStack {
            Button {
                propertiesViewModel.showYesterday.toggle()
                propertiesViewModel.showTomorrow = false
            } label: {
                VStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                        Text("Yesterday")
                            .font(.headline)
                    if let yesterday = rosaryViewModel.yesterdaysModel.first {
                        Text("\(yesterday.mystery) Mystery")
                            .font(.subheadline)
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 135, height: 60)
                .padding()
                .background(secondaryAccentColor)
                .cornerRadius(15)
                .shadow(radius: 10)
                .shadow(color: .black, radius: 10, x: 3, y: 5)
            }
        }
    }
}

struct YesterdayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PropertiesViewModel())
            .environmentObject(RosaryViewModel())
    }
}
