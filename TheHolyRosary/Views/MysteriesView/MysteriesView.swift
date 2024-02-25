//
//  MysteriesView.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/20/24.
//

import SwiftUI

struct MysteriesView: View {
    @EnvironmentObject var propertiesViewModel: PropertiesViewModel
    @State var showAnimation: Bool = false
    let mysteries = ["joyful", "luminous", "sorrowful", "glorious"]
    
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Circle()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 300, height: 300)
                    .offset(x: 150, y: -470)
                Circle()
                    .foregroundColor(Color.accentColor)
                    .frame(width: 200, height: 200)
                    .offset(x: -260, y: 250)
                
                VStack(spacing: 30) {
                    ForEach(mysteries.indices, id: \.self) { index in
                        NavigationLink {
                            //
                        } label: {
                            HStack {
                                Text("\(self.mysteries[index].capitalized) Mystery")
                                    .frame(height: 100)
                                    .frame(maxWidth: 350)
                                    .foregroundColor(.white)
                                    .font(.headline.bold())
                                    .background(secondaryAccentColor)
                                    .cornerRadius(10)
                                    .shadow(color: .black, radius: 5, x: 3, y: 5)
                            }
                        }
                    }
                }
                .padding(.top, 210)
                .offset(y: showAnimation ? -160 : 300)
            }
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.5))  {
                    showAnimation.toggle()
                }
            }
            .onDisappear {
                showAnimation = false
            }
            .navigationBarTitle("Mysteries")
        }
    }
}

struct MysteriesView_Previews: PreviewProvider {
    static var previews: some View {
        MysteriesView()
            .environmentObject(PropertiesViewModel())
    }
}
