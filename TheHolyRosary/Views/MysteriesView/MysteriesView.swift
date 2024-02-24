//
//  MysteriesView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct MysteriesView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: CustomShape()) {
                Text("Tap")
            }
        }
    }
}

struct MysteriesView_Previews: PreviewProvider {
    static var previews: some View {
        MysteriesView()
    }
}
