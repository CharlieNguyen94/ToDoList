import SwiftUI

struct ProfileView: View {
	@StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
		NavigationView {
			VStack {
				if let user = viewModel.user {
					profile(user: user)
				} else {
					Text("Loading profile...")
				}
			}
			.navigationTitle("Profile")
		}
		.onAppear {
			viewModel.fetchUser()
		}
    }

	@ViewBuilder
	func profile(user: User) -> some View {
		Image(systemName: "person.circle")
			.resizable()
			.aspectRatio(contentMode: .fit)
			.foregroundColor(.red)
			.frame(width: 124, height: 124)
			.padding()

		VStack(alignment: .leading) {
			HStack {
				Text("Name:")
					.bold()
				Text(user.name)
			}
			.padding()

			HStack {
				Text("Email:")
					.bold()
				Text(user.email)
			}
			.padding()

			HStack {
				Text("Member since: ")
					.bold()
				Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
			}
			.padding()
		}

		Spacer()

		TLButton(
			title: "Log out",
			background: .red
		) {
			viewModel.logOut()
		}
		.frame(height: 80)
	}
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
