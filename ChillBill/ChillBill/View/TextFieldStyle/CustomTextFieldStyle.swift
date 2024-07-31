import SwiftUI

/// A view modifier that applies a custom style to a text field.
struct CustomTextFieldStyle: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: width, height: height)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.appOrange, lineWidth: 2)
            }
    }
}

extension View {
    func customTextFieldStyle(width: CGFloat, height: CGFloat) -> some View {
        self.modifier(CustomTextFieldStyle(width: width, height: height))
    }
}
