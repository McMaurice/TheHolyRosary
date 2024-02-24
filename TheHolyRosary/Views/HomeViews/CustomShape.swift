//
//  CustomShape.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/21/24.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        // Calculate the size and position of the rectangle
        let rectangleWidth = rect.width * 0.97
        let rectangleHeight = rect.height * 2.2
        let rectangleX = (rect.width - rectangleWidth) / 2
        let rectangleY = (rect.height - rectangleHeight) / 2

        // Add rectangle
        let rectangleRect = CGRect(x: rectangleX, y: rectangleY, width: rectangleWidth, height: rectangleHeight)
        path.addRoundedRect(in: rectangleRect, cornerSize: CGSize(width: 30, height: 30))

        // Calculate the size and position of the circle
        let circleDiameter = rect.width * 0.75
        let circleY = rectangleY - (circleDiameter - rectangleHeight) / 2

        // Add circle
        let circleRect = CGRect(x: (rect.width - circleDiameter) / 2, y: circleY, width: circleDiameter, height: circleDiameter)
        path.addEllipse(in: circleRect)
        
        return path
    }
}

struct CustomShape_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
