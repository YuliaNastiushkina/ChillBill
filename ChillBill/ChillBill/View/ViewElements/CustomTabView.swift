import SwiftUI

/// A view that displays a customizable tab button.
/// It is a reusable component that displays a button with a title.
/// The button has a background color that changes based on its selection state.
struct CustomTabView: View {
    //MARK: - Internal interface
    /// The title of the tab.
    var title: String
    /// A Boolean value indicating whether the tab is selected.
    var isSelected: Bool
    /// The action to perform when the tab is tapped.
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.appYellow.opacity(0.8) : Color.clear)
                .cornerRadius(5)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    CustomTabView(title: "Expenses", isSelected: true, action: {})
}
