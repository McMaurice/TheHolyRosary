//
//  NavLabelView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/24/24.
//

import SwiftUI

struct NavLabelView: View {
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    let day: String
    
    var body: some View {
        VStack {
            Image("\(day)")
                .resizable()
                .scaledToFill()
                .frame(width: 100,height: 150)
                .padding()
            Text(day.capitalized)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(secondaryAccentColor)
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(secondaryAccentColor)
        )
        .shadow(color: .black.opacity(2.0), radius: 5, x: 3, y: 5)
    }
}


struct NavLabelView_Previews: PreviewProvider {
    static var previews: some View {
        NavLabelView(day: "sunday")
            .environmentObject(PropertiesViewModel())
    }
}
