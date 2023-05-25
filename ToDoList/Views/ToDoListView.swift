import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
	@StateObject var viewModel = ToDoListViewViewModel()
	@FirestoreQuery var items: [ToDoListItem]

	init(userId: String) {
		self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
	}

    var body: some View {
		NavigationView {
			VStack {
				List(items) { item in
					ToDoListItemView(item: item)
						.swipeActions {
							Button("Delete") {
								viewModel.delete(id: item.id)
							}
						}
				}
				.listStyle(.automatic)
			}
			.navigationTitle("To Do List")
			.toolbar {
				Button {
					viewModel.showingNewItemView = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewItemView) {
				NewItemView(newItemPresented: $viewModel.showingNewItemView)
			}
		}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
		ToDoListView(userId: "1emdsh3cLsPytyMI4W6wwj22E6R2")
    }
}
