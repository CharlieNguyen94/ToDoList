import SwiftUI

struct RegisterView: View {

    var body: some View {
		VStack {
			HeaderView(
				title: "Register",
				subtitle: "Start organizing todos",
				angle: -15,
				background: .orange
			)

			Spacer()
		}
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
