
import SwiftUI

struct CurrentWeather: View {
    var weather: WeatherModel?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Text("WeatherXXX")
                .font(.largeTitle)
                .bold()
                .padding(60)
                .shadow(color: .gray, radius: 12)
                .foregroundColor(Color.white)
            Spacer()
            
            Text("\(weather?.main.temp ?? 0) °C")
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
