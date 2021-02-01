//
//  NetworkManagerProtocol.swift
//  WeatherApp (iOS)
//
//  Created by Miia Romanainen on 1.2.2021.
//

import Foundation
protocol NetworkManagerProtocol {
    func fetchCurrentWeather(city: String, completion: @escaping (WeatherModel) -> ())
    //func fetchCurrentLocationWeather(lat: String, lon: String, completion: @escaping (WeatherModel) -> ())
    //func fetchNextFiveWeatherForecast(city: String, completion: @escaping ([ForecastTemperature]) -> ())
}
