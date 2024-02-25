//
//  MoreView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct MoreView: View {
    let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            VStack(alignment: .center, spacing: 5) {
                Image("prayer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100, alignment: .center)
            }
            .padding()
            
            Form {
                Section(header: Text("Application")) {
                    HStack {
                        Text("Product")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("The Holy Rosary")
                    }
                    HStack {
                        Text("Version")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(appVersion)
                    }
                }
            }
            
        }
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
