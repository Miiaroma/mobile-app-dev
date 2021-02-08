//
//  UIImageView.swift
//  WeatherApp (iOS)
//
//  Created by Miia Romanainen on 8.2.2021.
//

import SwiftUI

var weather: WeatherModel?
// let imageCache = NSCache<AnyObject, AnyObject>()



struct UIImageView: View {
    var body: some View {
        Text("\(weather?.weather.first?.icon ?? "Ei Tietoa")")
        Text("\(weather?.main.temp ?? 0, specifier: "%.1f") °C")
        Image(uiImage:"https://openweathermap.org/img/wn/\(String(describing: weather?.weather.first?.icon))@2x.png".load())
    }
}

struct UIImageView_Previews: PreviewProvider {
    static var previews: some View {
        UIImageView()
    }
}
