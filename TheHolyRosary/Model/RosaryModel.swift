//
//  TodaysModel.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/19/24.
//

import Foundation

struct RosaryModel: Codable {
    let rosary_day: String
    let mystery: String
    let season: String
    let currentDate: String
    let mp3Link: String
}
