import Foundation
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main: Codable {
    let temp: Float
    let feels_like: Float
    let temp_min: Float
    let temp_max: Float
    let pressure: Float
    let humidity: Float
}

struct Sys: Codable {
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}

struct WeatherModel: Codable {
    let weather: [Weather]
    let main: Main
    let sys: Sys
    let name: String?
    let dt: Int
    let timezone: Int?
    let dt_txt: String?
}

/*struct Weather: Codable{
    let id, dt, cod, timezone: Int
    let name, base: String
    let coord: Coord
    let weather: [WeatherData]
    let main: Main
    //let clouds: Clouds
    //let sys: Sys
}
struct Coord: Codable{
    let lon, lat: Double
}
struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String
}
struct Main: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, humidity: Int
}
struct Clouds: Codable {
    let all: String
}
struct Sys: Codable {
    let id, type, sunrise, sunset: Int
    let country: String
}*/
