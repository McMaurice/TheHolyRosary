//
//  TomorrowButtonView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/24/24.
//

import SwiftUI

struct TomorrowButtonView: View {
    @EnvironmentObject var rosaryViewModel: RosaryViewModel
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    
    var body: some View {
        VStack {
            Button {
                propertiesViewModel.showTomorrow.toggle()
                propertiesViewModel.showYesterday = false
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
                .background(secondaryAccentColor)
                .cornerRadius(15)
                .shadow(color: .black, radius: 10, x: 3, y: 5)
            }
        }
    }
}

struct TomorrowButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(PropertiesViewModel())
            .environmentObject(RosaryViewModel())
    }
}
