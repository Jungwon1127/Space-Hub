//
//  HomeViewModel.swift
//  Space Hub
//
//  Created by Jungwon Kim on 12/16/21.
//
import Foundation

class HomeViewModel: ObservableObject {
    @Published var currentConditions = CurrentConditions(dateTime: "00:00:00", temp: 0.0, humidity: 0.0, precip: 0.0, conditions: "", icon: "", moonphase: 0.0, sunrise: "", sunset: "")
    
    func fetchData() {
        guard let url = URL(string: "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/los%20angeles?unitGroup=metric&key=R4BGQBP9CZY8LMZYXMHJUSGQC&contentType=json") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, urlresponse, error in
            guard let data = data, error == nil else { return }
        
            do {
                let weather = try JSONDecoder().decode(WeatherModel.self, from: data)
                 
                DispatchQueue.main.async {
                    self?.currentConditions = weather.currentConditions 
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
