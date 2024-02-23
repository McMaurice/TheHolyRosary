//
//  PrayerViewModel.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/23/24.
//

import Foundation

@MainActor class PrayerViewModel: ObservableObject {
    @Published var prayerModel = [PrayerModel] ()
    
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

