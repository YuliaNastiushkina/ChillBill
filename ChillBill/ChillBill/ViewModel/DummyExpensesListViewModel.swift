import Foundation

/// Dummy view model that provides data to display for the list of expenses.
final class DummyExpensesListViewModel {
    /// A list of expenses grouped into sections by date.
    let expensesGroupedIntoSectionsByDate: [DummySectionViewModel] = [
        DummySectionViewModel(
            header: "29-07-2024",
            rows: [
                DummyExpenseViewModel(
                    nameOfTheExpense: "Coffee",
                    payer: "Daniell Forground",
                    amount: "35.0"),
                DummyExpenseViewModel(
                    nameOfTheExpense: "Lunch",
                    payer: "Alice Wonderland",
                    amount: "50.0"),
            ]),
        
        DummySectionViewModel(
            header: "28-07-2024",
            rows: [
                DummyExpenseViewModel(
                    nameOfTheExpense: "Park tickets",
                    payer: "Bob Builder",
                    amount: "75.0"),
                DummyExpenseViewModel(
                    nameOfTheExpense: "Taxi",
                    payer: "Alice Wonderland",
                    amount: "64.5"),
            ]),
        
        DummySectionViewModel(
            header: "26-07-2024",
            rows: [
                DummyExpenseViewModel(
                    nameOfTheExpense: "Rent a car",
                    payer: "Bob Builder",
                    amount: "475.0")
            ]),
        
        DummySectionViewModel(
            header: "24-07-2024",
            rows: [
                DummyExpenseViewModel(
                    nameOfTheExpense: "Dinner at Italian cafe",
                    payer: "Bob Builder",
                    amount: "135.4"),
                DummyExpenseViewModel(
                    nameOfTheExpense: "Booking hotel",
                    payer: "Alice Wonderland",
                    amount: "540.0"),
                DummyExpenseViewModel(
                    nameOfTheExpense: "Cake and coffee",
                    payer: "Daniell Forground",
                    amount: "44.8")
            ])
    ]
}
