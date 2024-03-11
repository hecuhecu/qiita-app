import SwiftUI

struct ErrorStateView: View {
    let action: (() -> Void)?
    
    init(action: (() -> Void)? = nil) {
        self.action = action
    }
    
    var body: some View {
        VStack {
            Text("エラーが発生しました")
                .font(.title3)
                .fontWeight(.medium)
            
            if let action {
                Text("再読み込み")
                    .font(.title3)
                    .foregroundStyle(Color(.link))
                    .onTapGesture {
                        action()
                    }
            }
        }
    }
}

#Preview {
    ErrorStateView(action: {})
}
