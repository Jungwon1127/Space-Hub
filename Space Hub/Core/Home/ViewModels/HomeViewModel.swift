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
    
    func getTemperature(farenheight: Bool) -> String {
        var temp = Measurement(value: currentConditions.temp, unit: UnitTemperature.celsius)
        let mf = MeasurementFormatter()
        mf.unitOptions = .providedUnit
        mf.numberFormatter.maximumFractionDigits = 0
        
        if farenheight {
            temp = temp.converted(to: UnitTemperature.fahrenheit)
        }
        
        
        
        return mf.string(from: temp)
    }
    
    func getMoonPhase() -> String {
        var moonPhase: String
        
        switch currentConditions.moonphase {
        case let x where x == 0.0:
            moonPhase = "New Moon"
        case let x where x > 0 && x < 0.5 :
            moonPhase = "Waxing Crescent"
        case let x where x == 0.5:
            moonPhase = "Full Moon"
        case let x where x > 0.5 && x < 0.75:
            moonPhase = "Waning Gibbous"
        case let x where x == 0.75:
            moonPhase = "Last Quarter"
        case let x where x > 0.75 && x <= 1:
            moonPhase = "Waning Crescent"
        default:
            moonPhase = "Moon?"
        }
        
        return moonPhase
    }
    
    func formatTime(time: String) -> String {
        let dfin = DateFormatter()
        let dfout = DateFormatter()
        dfin.dateFormat = "HH:mm:ss"
        dfout.dateFormat = "hh:mm a"
        let time = dfin.date(from: time) ?? Calendar.current.date(from: DateComponents(year: 0000, month: 0, day: 0))!
        let timeString = dfout.string(from: time)
        
        return timeString
    }
}
