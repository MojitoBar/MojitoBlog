---
date: 2021-02-28 19:29
description: SwiftUI DropBox
tags: SwiftUI
---

### SwiftUI List
SwiftUI에서 기본으로 제공해주는 DisclosureGroup이 있지만 커스텀에 제약이 많다...
직접 DropDown을 만들어 여러 속성을 추가해서 커스텀할 수 있도록 짠 코드이다.

expand변수를 통해서 box를 열었을 때, 닫았을 때를 체크해줬다.

그리고 `.animation(.spring())`로 애니메이션도 추가할 수 있다.

### DropDown struct
```Swift
struct DropDown : View{
    @State var expand = false
    var body: some View{
        VStack (alignment: .trailing){
            HStack{
                Text("DropBox")
                Image(systemName: expand ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6)
            }.onTapGesture {
                self.expand.toggle()
            }
            if expand{
                VStack(alignment: .trailing){
                    Text("item 1")
                    Text("item 2")
                }
            }
        }
        .animation(.spring())
    }
}
```
