import SwiftUI


struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body.weight(.medium))
            .foregroundColor(Color(hex: 0x9E9E9E))
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(hex: 0xECECEC))
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: 0xB1B1B1), lineWidth: 1)
                }
                
            }
//            .buttonBorderShape(.roundedRectangle(radius: 8))
            
    }
}
