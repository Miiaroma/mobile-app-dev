
import Foundation

import Combine
let networkManager = WeatherNetworkManager()

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
            //self.tempSymbol.loadImageFromURL(url: "http://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")        }
    }
}

}
