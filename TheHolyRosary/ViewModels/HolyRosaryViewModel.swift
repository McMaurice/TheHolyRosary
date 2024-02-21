//
//  TodaysViewModel.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/19/24.
//

import Foundation

@MainActor class HolyRosaryViewModel: ObservableObject {
    @Published var rosaryModel = [RosaryModel] ()
    @Published var prayerModel = [PrayerModel] ()
    
    func fetchRosary(endpoint: String) {
        NetworkManager.getRequest(endpoint: endpoint) { (result: Result<[RosaryModel], Error>) in
            switch result {
            case .success(let rosaryModels):
                // Handle successful response
                DispatchQueue.main.async {
                    self.rosaryModel = rosaryModels
                }
            case .failure(let error):
                // Handle error
                print("Error fetching data: \(error)")
            }
        }

    }
    
    func fetchPrayers(endpoint: String) {
        NetworkManager.getRequest(endpoint: endpoint) { (result: Result<[PrayerModel], Error>) in
            switch result {
            case .success(let prayerModel):
                // Handle successful response
                DispatchQueue.main.async {
                    self.prayerModel = prayerModel
                }
            case .failure(let error):
                // Handle error
                print("Error fetching data: \(error)")
            }
        }

    }
}

