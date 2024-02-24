//
//  NavLabelView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/24/24.
//

import SwiftUI

struct NavLabelView: View {
    let day: String
    
    var body: some View {
        let color = #colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)

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
                .background(Color(color))
            
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(color))
        )
        .shadow(radius: 10)
    }
}


struct NavLabelView_Previews: PreviewProvider {
    static var previews: some View {
        NavLabelView(day: "sunday")
    }
}
