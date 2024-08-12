import SwiftUI

/// A view that shows a row of expense.
struct ExpensesRowView: View {
    // MARK: - Internal interface
    /// The view model to provide data to the view.
    let viewModel: DummyExpenseViewModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(viewModel.nameOfTheExpense)
                    .lineLimit(singleLine)
                    .font(.system(size: bodySize))
                
                HStack {
                    Text(paidLabel)
                        .bold()
                    Text(viewModel.payer)
                        .lineLimit(singleLine)
                }
                .font(.system(size: noteSize))
                .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("$ \(viewModel.amount)")
                .font(.system(size: bodySize))
                .lineLimit(singleLine)
        }
    }
    
    // MARK: - Private interface
    private let paidLabel = "Paid by:"
    private let cornerRadius: CGFloat = 10
    private let padding: CGFloat = 16
    private let singleLine = 1
    private let noteSize: CGFloat = 14
    private let bodySize: CGFloat = 20
}

#Preview {
    ExpensesRowView(
        viewModel: DummyExpenseViewModel(
        nameOfTheExpense: "Coffee",
        payer: "Bob",
        amount: "25.0")
    )
}
