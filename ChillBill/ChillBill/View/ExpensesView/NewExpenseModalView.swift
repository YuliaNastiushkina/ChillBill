import SwiftUI

struct NewExpenseModalView: View {
    //MARK: - Internal interface
    
    var body: some View {
        VStack(spacing: spaceBetweenTextFields) {
            LabelWithTextFieldView(
                input: $title,
                labelText: "Title",
                placeholderText: "What was it?",
                keyboardType: .default
            )
            
            LabelWithTextFieldView(
                input: $amount,
                labelText: "Amount",
                placeholderText: "0.0",
                keyboardType: .decimalPad
            )
            
            LabelWithTextFieldView(
                input: $paidBy,
                labelText: "Paid by:",
                placeholderText: "Who paid the bill?",
                keyboardType: .default
            )
            
            LabelWithDatePickerView(date: $date, labelText: "Date")
            
            Spacer()
        }
        .padding()
    }
    
    //MARK: - Private inteface
    
    @State private var title = ""
    @State private var amount = ""
    @State private var paidBy = ""
    @State private var date = Date()
    private let spaceBetweenTextFields: CGFloat = 20
}

#Preview {
    NewExpenseModalView()
}
