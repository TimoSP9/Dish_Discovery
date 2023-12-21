import SwiftUI

struct ContentView: View {
    @State private var currentPage: Int = 0
    var body: some View {
        // MARK: Kyk babi
        NavigationStack{
            
            if(currentPage == 0) {
                FirstPageView(currentPage: $currentPage)
            } else if(currentPage == 1) {
                SecondPageView(currentPage: $currentPage)
            } else if(currentPage == 2){
                HomePage(currentPage: $currentPage)
            } else if (currentPage == 5){
                        recommView(currentPage : $currentPage)
            } else if(currentPage == 6){
                profileView(currentPage: $currentPage)
            } else if(currentPage == 9){
                fPreferenceView(currentPage: $currentPage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
