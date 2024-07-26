import SwiftUI

struct PlusButtonView: View {
    // MARK: - Private interface
    private let imageName = "plus.circle"
    
    // MARK: - Internal interface
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(.pastelGreen)
                .font(.system(size: 80))
                .shadow(color: .pastelGreen, radius: 5, x: 5, y: 2)
        }
    }
}

#Preview {
    PlusButtonView(action: {})
}
