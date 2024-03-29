import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    @State private var showingAlert = false
    var landmarkIndex: Int {
        guard let index = modelData.landmarks.firstIndex(where: {return $0.id == landmark.id}) else {
            return 0
        }
        return index
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack{
                    Text(landmark.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    FavoriteButton(isSet:$modelData.landmarks[landmarkIndex].isFavorite)
                    Button(action: {
                    // Action will goes here
                    self.showingAlert = true
                                               }) {
                    //Text("Delete")
                    Image(systemName: "trash")
                        Text("Show Alert")
                        .font(.title)
                        .foregroundColor(Color.white)
                        }
                        .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Alert"), message: Text("Are you sure you want to delete this?"), primaryButton: .default(Text("OK")), secondaryButton: .destructive(Text("Cancel")))                    }
                }
                
            HStack {
                Text(landmark.park)
                    .font(.subheadline)
                Spacer()
                Text(landmark.state)
                    .font(.subheadline)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
                
            Divider()

            Text("About \(landmark.name)")
                .font(.title2)
            Text(landmark.description)
                }
                .padding()
            }
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.automatic)
        }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
