import SwiftUI

struct HabitTrackerNoteView: View {
    @StateObject var viewModel: NoteViewModel
    
    var body: some View {
        HStack {
            VStack {
                ForEach(viewModel.habits, id: \.self) {habit in
                    HStack {
                        Text(habit)
                    }
                }
            }
            VStack {
                ForEach(viewModel.habits, id: \.self) {habit in
                    Circle()
                        .frame(width: 20, height: 20)
                }
            }
            VStack {
                ForEach(viewModel.habits, id: \.self) {habit in
                    Circle()
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}

#Preview {
    NoteView(viewModel: NoteViewModel(note: Note.makeHabitTracker(title: "Spendings on March", startDate: Date(), endDate: Date(),habits: ["Journaling", "Yoga", "No Gaming"])))
}
