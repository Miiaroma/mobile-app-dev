import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
        
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) {landmark in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                    }
                }
                .onDelete(perform:delete)
            }
            .navigationTitle("Landmarks")
        }
    }
    func delete(at offsets:IndexSet){
        modelData.landmarks.remove(atOffsets: offsets)
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
                    LandmarkList()
                        .environmentObject(ModelData())
        }
    }

