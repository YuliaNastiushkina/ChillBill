import SwiftUI

struct MainScreenView: View {
    // MARK: - Internal interface
    
    var body: some View {
        VStack {
            Text(boardName)
                .font(.largeTitle)
                .padding()

            Image(systemName: "house.circle.fill")
                .foregroundColor(.appOrange)
                .font(.system(size: 70))
                .padding()
            
            HStack {
                MainScreenTabView()
            }
            .font(.title2)
            
            PlusButtonView(action: {})
            Text(addButtonDescription)
                .font(.footnote)
                .foregroundColor(.gray)
        }
        Spacer()
    }
    
    //MARK: - Private interface
    private var boardName = "Toronto trip"
    private let addButtonDescription = "Add expense"
}

#Preview {
    MainScreenView()
}
