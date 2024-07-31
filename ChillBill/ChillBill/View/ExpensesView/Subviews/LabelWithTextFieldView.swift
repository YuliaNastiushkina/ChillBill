import SwiftUI

/// A text field that allows to enter and edit text and has a label above itself.
struct LabelWithTextFieldView: View {
    // MARK: - Internal interface

    /// The text entered into the text field.
    @Binding var input: String

    /// A text displayed in the label.
    let labelText: String

    /// A placeholder text displayed within the text field.
    let placeholderText: String

    /// A type of keyboard to display when the field is tapped.
    let keyboardType: UIKeyboardType

    /// An alignment of the label inside the view along the horizontal axis.
    let labelAlignment: HorizontalAlignment

    /// An alignment of the text field inside the view along the horizontal axis.
    let textFieldAlignment: TextAlignment

    var body: some View {
        VStack(alignment: labelAlignment) {
            Text(labelText)
                .font(.system(size: fontBodySize, weight: .bold))

            Divider()

            TextField(placeholderText, text: $input)
                .font(.system(size: fontBodySize))
                .keyboardType(keyboardType)
                .lineLimit(textFieldLineLimit)
                .multilineTextAlignment(textFieldAlignment)
        }
    }

    /// Creates a view with specified label text, placeholder, keyboard type,
    /// label and text field alignments.
    ///
    /// The default alignments of the text field and the label are leading.
    ///
    /// - Parameters:
    ///   - input: The text entered into the field.
    ///   - labelText: A text displayed in the label.
    ///   - placeholderText:  A placeholder text displayed within the field.
    ///   - keyboardType: A type of keyboard to display when the field is tapped.
    ///   - labelAlignment: An alignment of the label inside the view.
    ///   - textFieldAlignment: An alignment of the text field inside the view.
    init(
        input: Binding<String>,
        labelText: String,
        placeholderText: String,
        keyboardType: UIKeyboardType,
        labelAlignment: HorizontalAlignment = .leading,
        textFieldAlignment: TextAlignment = .leading
    ) {
        _input = input
        self.labelText = labelText
        self.placeholderText = placeholderText
        self.keyboardType = keyboardType
        self.labelAlignment = labelAlignment
        self.textFieldAlignment = textFieldAlignment
    }

    // MARK: - Private interface

    private let fontBodySize: CGFloat = 20
    private let textFieldLineLimit = 1
}

struct LabelWithTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()

            LabelWithTextFieldView(
                input: .constant(""),
                labelText: "Label",
                placeholderText: "Placeholder",
                keyboardType: .default,
                labelAlignment: .center,
                textFieldAlignment: .center
            )

            Spacer()

            LabelWithTextFieldView(
                input: .constant(""),
                labelText: "Here's a label with a quite long fancy text that doesn't fit on one line.",
                placeholderText: "Placeholder",
                keyboardType: .default
            )

            Spacer()
        }
        .padding()
    }
}
