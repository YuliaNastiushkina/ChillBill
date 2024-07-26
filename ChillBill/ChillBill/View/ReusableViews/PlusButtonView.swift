import SwiftUI

///  A view that displays a reusable customizable plus button with a system image.
struct PlusButtonView: View {
    // MARK: - Internal interface
    /// The action to perform when the button is tapped.
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundColor(.pastelGreen)
                .font(.system(size: 80))
                .shadow(color: .pastelGreen, radius: 5, x: 5, y: 2)
        }
    }
    
    // MARK: - Private interface
    private let imageName = "plus.circle"
}

#Preview {
    PlusButtonView(action: {})
}
