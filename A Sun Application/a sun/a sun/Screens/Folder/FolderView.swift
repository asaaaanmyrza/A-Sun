import SwiftUI

struct FolderView: View {
    @StateObject var viewModel: FolderViewModel
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.folder.notes, id: \.id) { note in
                    NavigationLink(note.title) {
                        NoteView(viewModel: NoteViewModel(note: note))
                    }
                    .navigationTitle(viewModel.folder.name)
                }
            }
        }
    }
}

#Preview {
    FolderView(viewModel: FolderViewModel(folder: Folder(name: "General")))
}
