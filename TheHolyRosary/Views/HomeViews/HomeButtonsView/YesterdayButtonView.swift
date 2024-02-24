//
//  YesterdayButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/24/24.
//

import SwiftUI

struct YesterdayButtonView: View {
    @ObservedObject var rosaryViewModel: RosaryViewModel
    @Binding var showYesterday: Bool
    @Binding var showTomorrow: Bool
    let color = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
    
    var body: some View {
        VStack {
            Button {
                showYesterday.toggle()
                showTomorrow = false
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
                .background(Color(color))
                .cornerRadius(15)
                .shadow(radius: 10)
                .shadow(radius: 5, x: 6, y: 5)
            }
        }
    }
}

struct YesterdayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
