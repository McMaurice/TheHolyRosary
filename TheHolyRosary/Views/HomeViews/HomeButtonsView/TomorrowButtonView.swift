//
//  TomorrowButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/24/24.
//

import SwiftUI

struct TomorrowButtonView: View {
    @ObservedObject var rosaryViewModel: RosaryViewModel
    @Binding var showTomorrow: Bool
    @Binding var showYesterday: Bool
    let color = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)
    
    var body: some View {
        VStack {
            Button {
                showTomorrow.toggle()
                showYesterday = false
            } label: {
                VStack(spacing: 5) {
                    Image(systemName: "chevron.right")
                    Text("Tomorrow")
                        .font(.headline)
                    if let tomorrow = rosaryViewModel.tomorrowsModel.first {
                        Text("\(tomorrow.mystery) Mystery")
                            .font(.subheadline)
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 135, height: 60)
                .padding()
                .background(Color(color))
                .cornerRadius(15)
                .shadow(radius: 5, x: 6, y: 5)
            }
        }
    }
}

struct TomorrowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
