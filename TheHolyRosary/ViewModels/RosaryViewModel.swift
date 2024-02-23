//
//  TodaysViewModel.swift
//  TheHolyRosary
//
//  Created by Macmaurice Osuji on 2/19/24.
//

import Foundation

@MainActor class RosaryViewModel: ObservableObject {
    @Published var todaysModel = [Today] ()
    @Published var tomorrowsModel = [Tomorrow] ()
    @Published var yesterdaysModel = [Yesterday] ()
    
    func fetchTodaysRosary() {
        NetworkManager.getRequest(endpoint: "today") { (result: Result<[Today], Error>) in
            switch result {
            case .success(let todaysModels):
                // Handle successful response
                DispatchQueue.main.async {
                    self.todaysModel = todaysModels
                }
            case .failure(let error):
                // Handle error
                print("Error fetching data: \(error)")
            }
        }
        
    }
    
    func fetchTomorrowsRosary() {
        NetworkManager.getRequest(endpoint: "tomorrow") { (result: Result<[Tomorrow], Error>) in
            switch result {
            case .success(let tomorrowsModels):
                // Handle successful response
                DispatchQueue.main.async {
                    self.tomorrowsModel = tomorrowsModels
                }
            case .failure(let error):
                // Handle error
                print("Error fetching data: \(error)")
            }
        }
        
    }
    
    func fetchYesterdaysRosary() {
        NetworkManager.getRequest(endpoint: "yesterday") { (result: Result<[Yesterday], Error>) in
            switch result {
            case .success(let yesterdaysModels):
                // Handle successful response
                DispatchQueue.main.async {
                    self.yesterdaysModel = yesterdaysModels
                }
            case .failure(let error):
                // Handle error
                print("Error fetching data: \(error)")
            }
        }
        
    }
}

