import SwiftUI

struct NewExpenseModalView: View {
    @State private var title = ""
    @State private var amount = ""
    @State private var paidBy = ""
    private let spaceBetweenTextFields: CGFloat = 20
    
    var body: some View {
        VStack(spacing: spaceBetweenTextFields) {
            TextField("Title", text: $title)
            
            TextField("Amount", text: $amount)
            
            TextField("Paid by", text: $paidBy)
            
            Spacer()
        }
    }
}

#Preview {
    NewExpenseModalView()
}
