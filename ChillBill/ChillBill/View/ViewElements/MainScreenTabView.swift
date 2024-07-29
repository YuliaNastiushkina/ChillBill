import SwiftUI

struct MainScreenTabView: View {
    
    // MARK: - Internal interface
    var body: some View {
        VStack {
            HStack {
                CustomTabView(title: expensesTitle, isSelected: selectedTab == .expenses) {
                    selectedTab = .expenses
                }
                
                CustomTabView(title: myBalanceTitle, isSelected: selectedTab == .balance) {
                    selectedTab = .balance
                }
            }
            .padding(2)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            .padding()
            
            if selectedTab == .expenses {
                ExpensesView()
            } else {
                BalanceView()
            }
            
            Spacer()
        }
    }
    
    //MARK: - Private interface
    @State private var selectedTab: Tab = .expenses
    
    private var expensesTitle = "Expenses"
    private var myBalanceTitle = "My Balance"
    
    private enum Tab {
        case expenses
        case balance
    }
    
    private struct ExpensesView: View {
        var body: some View {
            ExpensesListView()
        }
    }
    
    private struct BalanceView: View {
        var body: some View {
            Text("My balance View")
                .font(.largeTitle)
                .padding()
        }
    }
}

#Preview {
    MainScreenTabView()
}
