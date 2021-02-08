import Foundation

import Combine
let networkManager = WeatherNetworkManager()
let imageCache = NSCache<AnyObject, AnyObject>()

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: WeatherModel?
    
    init() {
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch(by city: String = "Lappeenranta") {
        networkManager.fetchCurrentWeather(city: city) {
            self.current = $0
        }
    }
}
