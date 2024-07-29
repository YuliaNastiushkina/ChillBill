import Foundation

/// A dummy view model that provides data to display for an expense list row.
/// This view model is intended for testing or development purposes, providing hardcoded data for an expense.
final class DummyExpenseViewModel: Identifiable {
    
    /// The name of the expense to be shown in the view.
    let nameOfTheExpense: String
    
    /// The person who paid the bill.
    let payer: String
    
    /// Total amount of the bill to be shown in the view.
    let amount: String
    
    /// The bill's unique identifier, automatically generated.
    let id = UUID()
    
    /// Initializes a new instance with the provided data.
    /// - Parameters:
    ///   - nameOfTheExpense: The name of the expense.
    ///   - payer: Person who paid the bill.
    ///   - amount: The total amount of the expense.
    init(nameOfTheExpense: String, payer: String, amount: String) {
        self.nameOfTheExpense = nameOfTheExpense
        self.payer = payer
        self.amount = amount
    }
}
