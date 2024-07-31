import SwiftUI

struct OrangeRoundedRectangleButton: ButtonStyle {
    private let buttonCornerRadius: CGFloat = 15
    private let buttonTextSize:CGFloat = 20
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(
                .system(
                    size: buttonTextSize,
                    weight: .bold
                )
            )
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .background(Color.appOrange)
            .clipShape(RoundedRectangle(cornerRadius: buttonCornerRadius))
    }
}

struct OrangeRoundedRectangleButton_Previews:
    PreviewProvider {
    static var previews: some View {
        Button("Press Me!") {}
            .buttonStyle(OrangeRoundedRectangleButton())
    }
}

