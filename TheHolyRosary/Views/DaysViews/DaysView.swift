//
//  DaysView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct DaysView: View {
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    @State private var numOfRows = 150.0
    let days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]
    
    var body: some View {
        let columns = [
            GridItem(.adaptive(minimum: numOfRows))
        ]
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(days, id: \.self) { day in
                        NavigationLink {
                            //
                        } label: {
                            NavLabelView(day: day)
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Weekday Devotions")
        }
    }
}

struct DaysView_Previews: PreviewProvider {
    static var previews: some View {
        DaysView()
            .environmentObject(PropertiesViewModel())
    }
}

