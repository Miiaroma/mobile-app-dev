//
//  WeatherNetworkManager.swift
//  WeatherApp (iOS)
//
//  Created by Miia Romanainen on 1.2.2021.
//

import Foundation

class WeatherNetworkManager : NetworkManagerProtocol {
    
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ()){
    let formattedCity = city.replacingOccurrences(of: "", with: "+")
    let API_URL = "https://api.openweathermap.org/data/2.5/weather?q=\(formattedCity)&appid=\(NetworkProperties.API_KEY)&units=metric"
        
    guard let url = URL(string: API_URL) else {
        fatalError()
    }
        
    print(url)
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
    guard let data = data else { return }

        do {
            let currentWeather = try JSONDecoder().decode(WeatherModel.self, from: data)
            completion(currentWeather)
        } catch {
             print(error)
        }

    }.resume()
    
    struct NetworkProperties {
        static let API_KEY = "1adfcdb6b64b59edcd01d5fae37b8f86"
    }
    /*func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ())
    func fetchNextFiveWeatherForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ())*/
    //3 protocol methods will appear here
    
   
    }
    
}

