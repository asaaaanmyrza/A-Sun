import SwiftUI

struct FinanceTrackerNoteView: View {
    @StateObject var viewModel: NoteViewModel
    
    var body: some View {
        Button("Add operation") {
            viewModel.addFinanceOperation(Operation(date: Date(), amount: 123, type: .spending))
        }
        List {
            ForEach(viewModel.operations, id: \.id) { operation in
                HStack {
                    Text(String(operation.amount))
                    Spacer()
                    Text(operation.date.formatted(date: .numeric, time: .omitted))
                    switch operation.type {
                        case .income: Color.green
                        case .spending: Color.red
                    }
                }
            }
        }
    }
}

#Preview {
    NoteView(viewModel: NoteViewModel(note: Note.makeFinanceTracker(title: "Spendings on March", startDate: Date(), endDate: Date(),currency: "$")))
}
