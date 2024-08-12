import SwiftUI

/// A view that shows a list of expenses grouped by the date of creation.
struct ExpensesListView: View {
    //MARK: -Internal interface
    
    /// Dummy view model that provides data for the view.
    var viewModel = DummyExpensesListViewModel()

    var body: some View {
        List(viewModel.expensesGroupedIntoSectionsByDate) { section in
            ExpenseSectionView(viewModel: section)
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    ExpensesListView()
}
