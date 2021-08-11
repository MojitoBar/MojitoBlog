---
date: 2021-02-28 19:29
description: SwiftUI SideMenu 예제
tags: SwiftUI
---


### SwiftUI SideMenu
SwiftUI로 사이드메뉴를 구현한 간단한 예제이다.

기본적으로 SideMenuView.swift와 그 안에 표시해줄 MenuButtonView.swift 두 파일이 있으며, SideMenuView는 ZStack으로 메인 화면에 보여주게 된다.

### MainView.swift
```Swift
struct MainView: View {
    // 사이드 메뉴를 열고 닫음을 저장할 변수
    @State var sideMenuBarToggle: Bool = false
    
    var body: some View {
        ZStack{
            // MainView's View...

            // 사이드 메뉴 선언, sideMenuBarToggle 변수 Binding.
            SideMenuView(sideMenuBarToggle: $sideMenuBarToggle)
        }
        // 화면 끝까지 채우기 위해
        .ignoresSafeArea()
    }
}
```

### SideMenuView.swift
```Swift
struct SideMenuView: View {
    // MainView에서의 Bool변수 바인딩.
    @Binding var sideMenuBarToggle: Bool
    @State var width = UIScreen.main.bounds.width
    @State var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var selectedIndex = ""
    
    var body: some View {
        // Side Menu
        HStack(spacing: 0){
            Spacer(minLength: 0)
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        withAnimation(.spring()){
                            // 애니메이션을 포함해 버튼 토글
                            sideMenuBarToggle.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                    })
                }
                .padding()
                .padding(.top, edges?.top)
                
                HStack(spacing: 15){
                    VStack(alignment: .leading, content: {
                        Text("Placeholder")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("wnehdtjr5@gmail.com")
                            .fontWeight(.semibold)
                    })
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                
                // Menu Buttons ...
                VStack (alignment: .leading){
                    MenuButtonView(image: "gear", title: "asdfasdfa", selected: $selectedIndex, show: $sideMenuBarToggle)
                    MenuButtonView(image: "gear", title: "asdfasdfa", selected: $selectedIndex, show: $sideMenuBarToggle)
                    MenuButtonView(image: "gear", title: "asdfasdfa", selected: $selectedIndex, show: $sideMenuBarToggle)
                    MenuButtonView(image: "gear", title: "asdfasdfa", selected: $selectedIndex, show: $sideMenuBarToggle)
                    MenuButtonView(image: "gear", title: "asdfasdfa", selected: $selectedIndex, show: $sideMenuBarToggle)
                }
                .padding(.top)
                
                Spacer(minLength: 0)
            }
            .frame(width: width - 100)
            .background(Color.gray)
            // 토글 변수로 검사해 x좌표 지정
            .offset(x: sideMenuBarToggle ? 0 : width - 100)
        }
        // 토글 변수로 검사해 뒷 배경 색깔 지정
        .background(Color.black.opacity(sideMenuBarToggle ? 0.3 : 0))
    }
}
```

### MenuButtonView.swift
```Swift
struct MenuButtonView: View {
    var image : String
    var title : String
    
    var body: some View{
        Button(action: {
            // Some Changing Views..
        }, label: {
            HStack (spacing: 15){
                Image(systemName: image)
                    .font(.system(size: 22))
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding(.vertical)
        })
        .padding(.top, 5)
        .foregroundColor(.white)
    }
}
```

주석을 위주로 보면 어렵지 않은 코드이다.

하지만 거의 모든 어플리케이션에 필수적으로 들어가는 UI로 자주 쓸 것 같아 정리해봤다.
