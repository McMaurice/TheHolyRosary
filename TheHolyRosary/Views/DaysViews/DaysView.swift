//
//  DaysView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct DaysView: View {
    @State private var numOfRows = 150.0
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: numOfRows))
        ]
        NavigationStack {
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { day in
                    NavigationLink {
                        //
                    } label: {
                        Text(day)
                    }
                }
            }
        }
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView()
    }
}
