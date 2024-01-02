import SwiftUI

struct ContentView: View {
    
    @State private var currentPage: Int = 0
    @State var onBoardingfinish : Bool?
    
    var body: some View {
        
        NavigationStack{
            
            if !{onBoardingfinish ?? false}() {
                
                if(currentPage == 0) {
                    FirstPageView(currentPage: $currentPage)
                } else if(currentPage == 1) {
                    SecondPageView(currentPage: $currentPage)
                } else if(currentPage == 2){
                    TabBarView(currentPage: $currentPage)
                }
            } else {
                TabBarView(currentPage: $currentPage)
                
            }
        }
        .onAppear(perform: {
            getData()
        })
    }
    func getData(){
        onBoardingfinish = UserDefaults.standard.bool(forKey: "isOnBoardingFinish")
        print("DEBUG: \(onBoardingfinish)")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
