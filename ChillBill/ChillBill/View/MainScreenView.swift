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
                CustomTabInfoView()
            }
            .font(.title2)
        }
        .overlay(alignment: .bottom) {
            VStack {
                PlusButtonView(action: {})
                Text(addButtonDescription)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
    //MARK: - Private interface
    private var boardName = "Toronto trip"
    private let addButtonDescription = "Add expense"
}

#Preview {
    MainScreenView()
}
