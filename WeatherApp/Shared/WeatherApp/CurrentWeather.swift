import SwiftUI

struct CurrentWeather: View {
    var weather: WeatherModel?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Local Weather")
                .font(.largeTitle)
                .bold()
                .padding(60)
                .shadow(color: .gray, radius: 12)
                .foregroundColor(Color.white)
            //Spacer()
            
            Image(uiImage: "https://openweathermap.org/img/wn/\(weather?.weather.first?.icon ?? "Unknown")@2x.png".load())
            
            Text("\(weather?.main.temp ?? 0, specifier: "%.1f") °C")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.heavy)
                .font(.system(size: 65))
                .shadow(color: .gray, radius: 6)
            
            Text("\(weather?.name ?? "Unknown")")
                .font(.title)
                .bold()
                .foregroundColor(.white)
                .padding(.bottom, 300)
                .shadow(color: .gray, radius: 6)
            Spacer()
            
        }
        .background(
            Image("dark_background")
                .resizable()
                .scaledToFill()
                .clipped())
        .edgesIgnoringSafeArea([.top, .bottom])
        
    }
}
    
    struct CurrentWeather_Previews: PreviewProvider {
        static var previews: some View {
            CurrentWeather()
        }
    }

extension String{
    func load() -> UIImage {
        do {
            guard let url = URL(string:
                                    self)
            else{
                return UIImage()
            }
            print(url)
            let data: Data = try
                Data(contentsOf: url)
            return UIImage(data:data)
                ?? UIImage()
        }
        catch {
            
        }
        return UIImage()
    }
}
