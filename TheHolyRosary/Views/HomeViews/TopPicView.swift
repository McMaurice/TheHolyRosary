//
//  TopPicView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/22/24.
//

import SwiftUI

struct TopPicView: View {
    let color3 = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    
    var body: some View {
        ZStack {
            Image("rosary")
                .resizable()
                .foregroundColor(.red)
                .padding()
                .frame(width: 350, height: 400)
                .offset(y: -60)
            
            Circle()
                .opacity(0.6)
                .frame(width: 500, height: 500, alignment: .topLeading)
                .offset(y: -180)
                .foregroundColor(Color(color3))
                .shadow(color: .black, radius: 10, x: 6, y: 5)
        }
    }
}

struct TopPicView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicView()
    }
}
