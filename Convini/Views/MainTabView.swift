import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                case .home:
                    Text("홈 화면") // 실제 홈 화면으로 변경
                case .wishList:
                    Text("관심상품") // 실제 관심상품 화면으로 변경
                case .event:
                    Text("할인정보") // 실제 할인정보 화면으로 변경
                case .setting:
                    Text("설정") // 실제 설정 화면으로 변경
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Divider()
            
            customTabBar // 탭 바
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    // MARK: - 커스텀 바 디자인
    var customTabBar: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        Image("\(tab)")
                            .font(.system(size: 20))
                        Text(tab.title)
                            .font(.system(size: 10))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 3.5)
                    .foregroundColor(selectedTab == tab ? Color(hex: "00B49A") : Color(hex: "DEDEDE"))
                }
            }
        }
        .padding(.vertical, 14)
        .background(Color.white)
    }
}

enum Tab: String, CaseIterable {
    case home
    case wishList
    case event
    case setting
    
    var title: String {
        switch self {
        case .home: return "홈"
        case .wishList: return "관심상품"
        case .event: return "할인정보"
        case .setting: return "설정"
        }
    }
}

#Preview {
    MainTabView()
}
