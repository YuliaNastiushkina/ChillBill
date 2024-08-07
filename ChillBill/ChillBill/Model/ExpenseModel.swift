import Foundation

/// A statement of the money owed for goods or services by different people.
class Expense: Identifiable {
    
    /// The unique identifier for the expense.
    var id: UUID
    
    /// The short description of the expense.
    var titleOfExpense: String
    
    /// The overall sum of money that was spent within the expense.
    var amount: Decimal
    
    /// The person who paid the expense.
    var payer: String
    
    /// A date when the expense was created.
    var date: Date
    
    init(id: UUID = UUID(), titleOfExpense: String, amount: Decimal, payer: String, date: Date) {
        self.id = id
        self.titleOfExpense = titleOfExpense
        self.amount = amount
        self.payer = payer
        self.date = date
    }
}
