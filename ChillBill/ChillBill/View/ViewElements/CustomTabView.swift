import SwiftUI

struct CustomTabView: View {
    var title: String
    var isSelected: Bool
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
