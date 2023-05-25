import SwiftUI

struct NewItemView: View {
	@StateObject var viewModel = NewItemViewViewModel()
	@Binding var newItemPresented: Bool

    var body: some View {
		VStack {
			Text("New Item")
				.font(.system(size: 32))
				.bold()
				.padding(.top, 100)

			Form {
				TextField("Title", text: $viewModel.title)
					.textFieldStyle(.automatic)

				DatePicker("Due Date", selection: $viewModel.dueDate)
					.datePickerStyle(.graphical)

				TLButton(title: "Save", background: .pink) {
					if viewModel.canSave {
						viewModel.save()
						newItemPresented = false
					} else {
						viewModel.showAlert = true
					}
				}
			}
		}
		.alert(
			Text("Error"),
			isPresented: $viewModel.showAlert) {} message: {
			Text("Please fill in all fields and select due date that is today or newer.")
		}

    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
		NewItemView(newItemPresented: .constant(false))
    }
}
