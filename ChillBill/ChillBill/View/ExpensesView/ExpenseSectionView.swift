import SwiftUI

/// A view that shows a section of expenses with header.
struct ExpenseSectionView: View {
    // MARK: - Internal interface
    
    /// Dummy view model that provides data for the view.
    let viewModel: DummySectionViewModel
    
    var body: some View {
        Section {
            ForEach(viewModel.rows) { row in
                ExpensesRowView(viewModel: row)
            }
        } header: {
            Text(viewModel.header)
                .font(.headline)
                .foregroundStyle(Color.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ExpenseSectionView(viewModel: DummySectionViewModel(
        header: "25.07.2024",
        rows: [
          DummyExpenseViewModel(
            nameOfTheExpense: "Tickets",
            payer: "Mary",
            amount: "50.5"
          ),
          DummyExpenseViewModel(
            nameOfTheExpense: "Coffee",
            payer: "Bob",
            amount: "25.0"
          ),
    ]))
}
