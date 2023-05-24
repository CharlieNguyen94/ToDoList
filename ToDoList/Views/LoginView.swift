import SwiftUI

struct LoginView: View {

	@State var email = ""
	@State var password = ""

    var body: some View {
		NavigationView {
			VStack {
				HeaderView(
					title: "To Do List",
					subtitle: "Get things done",
					angle: 15,
					background: .pink
				)

				Form {
					TextField("Email Address", text: $email)
						.textFieldStyle(.plain)
					SecureField("Password", text: $password)
						.textFieldStyle(.plain)

					Button {

					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 10)
								.foregroundColor(.blue)

							Text("Log in")
								.foregroundColor(.white)
								.bold()
						}
					}
					.padding()
				}
				.offset(y: -50)

				VStack {
					Text("New around here?")
					NavigationLink(
						"Create An Account",
						destination: RegisterView()
					)
				}
				.padding(.bottom, 50)

				Spacer()

			}
		}
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
