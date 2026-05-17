import SwiftUI

struct MainView: View {
    @StateObject var viewModel: UserViewModel
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.user.folders) { folder in
                    NavigationLink(folder.name) {
                        FolderView(viewModel: FolderViewModel(folder: Folder(name: folder.name, notes: folder.notes)))
                    }
                }
            }
            Button("add folder") {
                viewModel.createFolder(name: "Test")
            }
        }
    }
}

//#Preview {
//    MainView(viewModel: UserViewModel(user: User(username: "test", password: "test")))
//}
